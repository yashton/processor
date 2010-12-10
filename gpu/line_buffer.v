`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: GPU line buffer.
// Module Name: line_buffer
// Project Name: CS3710
// Description: Provides a front and back scan line buffer.
//
// Scanlines are calculated for the next upcoming line (the back buffer), while
// the current scanline is being read into the palette color generator (the front
// buffer). 
// The front and back buffer is implemented using a single 1-kiloword block ram.
// The top half of the memory block is used for one buffer, the bottom half
// for the other. The topmost bit of the address switches which is the front.
// Each buffer is 1024 bytes, of which only 640 are use. This is a benefit,
// however, as any location off the screen will be written to the upper portion
// of the buffer, which will never be drawn. Negative locations wrap around
// to the top, while locations > 640 will simply be written above. Due to the
// nature of the bounding, this will never be more than one tile on either side.
// Additionally, there are small distributed memory blocks for storing a 
// set of stale state flags for the front and back buffer. Because the RAM
// cannot be cleared at the beginning of the next scanline, a separate flag
// bit must be set. See pixel_updated_logic.v for details.
// Additionally, the z information for each pixel must be stored, and another
// small distributed memory is used for this.
// 
// The state machine of this module is fairly complicated, and utilizes a
// form of pipelining to streamline the writing of large blocks of pixels.
// The basic concept is a for loop
//	for (current_tile = first; current_tile <= last; current_tile++)
//	{
//		write tile to buffer
//	}
//
// Each tile is a 8-pixel slice, each pixel being 4 bits. To write a slice, 
// there are two cases. If the slice falls evenly on a two 32 bit words, then two
// writes can be performed. Otherwise, the slice falls offset across three 32
// words. The key to the pipelining is that often more than one tile is being
// written at a time, and the third word of an offset is the same as the 
// first word of the next tile. This allows sequential writes to occur quickly.
//////////////////////////////////////////////////////////////////////////////////
module line_buffer
	#(
		parameter WIDTH = 640,
		parameter WAIT = 0,
		parameter START = 1,
		parameter FIRST = 2,
		parameter WRFIRST = 3,
		parameter SECOND = 4,
		parameter WRSECOND = 5
	)
	(
		input clk,
		input rst,
		
		// Sprite input
		input load,
		input [9:0] addr,
		input [1:0] z,
		input [4:0] palette,
		input [2:0] first,
		input [2:0] last,
		output line_busy,
		// tile input
		output reg [3:0] current_tile,
		input [31:0] tile_data,
		// back line buffer output
		input line_start,
		input [9:0] x,
		input [9:0] y,
		output [8:0] index,
		output enable
   );
	reg [2:0] last_tile;
	
	wire front;
	assign front = y % 2;
	
	reg [7:0] pixel_addr;
	reg [1:0] offset;
	
	wire write_pixel;
		
	wire [35:0] pixel_read_data;
	wire [3:0] pixel_read_updated;
	wire [7:0] pixel_read_z;
	wire [35:0] pixel_write_data;
	wire [3:0] pixel_write_updated;
	wire [7:0] pixel_write_z;
	
	reg [1:0] line_z;
	reg [4:0] line_palette;
	
	// Registers for latching inputs	
	reg completed_first;
	reg [3:0] state, next_state;
	assign write_pixel = state == FIRST || state == SECOND;
	
	always @(posedge clk) begin
		if (!rst) begin
			offset <= 0;
			last_tile <= 0;
			line_z <= 0;
			line_palette <= 0;
		end
		else if (load) begin
			offset <= addr[1:0];
			last_tile <= last;
			line_z <= z;
			line_palette <= palette;
		end
	end
	
	always @(posedge clk) begin
		if (!rst || load) begin
			completed_first <= 0;
		end
		else if (state == WRFIRST) begin
			completed_first <= 1;
		end
	end
	
	always @(posedge clk) begin
		if (!rst) begin
			pixel_addr <= 0;
		end
		else if (load) begin
			pixel_addr <= addr[9:2];
		end
		else if(state == FIRST || state == SECOND) begin
			pixel_addr <= pixel_addr + 1;
		end
	end
	
	always @(posedge clk) begin		
		if (!rst) begin
			current_tile <= 0;
		end
		else if (load) begin
			current_tile <= first;
		end
		else if ((offset != 0 && state == FIRST && completed_first) || (offset == 0 && state == SECOND)) begin
			current_tile <= current_tile + 1;
		end
	end
	
	always @(posedge clk) begin
		if (!rst || line_start) begin
			state <= WAIT;
		end
		else begin
			state <= next_state;
		end
	end
	
	assign line_busy = state != WAIT;
	
	always @(*) begin
		case (state)
			WAIT: next_state <= load ? START : WAIT;
			START: next_state <= current_tile > last_tile ? WAIT : FIRST;
			FIRST: next_state <= WRFIRST;
			WRFIRST: next_state <= (offset != 0 && completed_first && current_tile > last_tile) ? WAIT : SECOND;
			SECOND: next_state <= WRSECOND;
			WRSECOND: next_state <= (offset == 0 && current_tile > last_tile) ? WAIT : FIRST;
			default: next_state <= WAIT;
		endcase
	end
	
	wire [11:0] remaining;
	reg [11:0] previous;
	wire calculate_first;
	assign calculate_first = state == FIRST;
	pixel_logic pixel(calculate_first, offset, line_z, line_palette,
		tile_data, previous, remaining,
		pixel_read_data, pixel_read_updated, pixel_read_z,
		pixel_write_data, pixel_write_updated, pixel_write_z);
	
	always @(posedge clk) begin		
		if (!rst || load) begin
			previous <= 12'h0;
		end
		else if (state == WRSECOND) begin
			previous <= remaining;
		end
	end
	
	wire [8:0] buffer_addr;
	assign buffer_addr = {front, pixel_addr};
	
	wire [10:0] output_addr;
	assign output_addr = {!front, x};
	
	wire pixel_enable;
	assign pixel_enable = state != WAIT;
	
	// VRAM for line front and back buffer.
	line_buffer_vram buffer_ram(
		.addra(buffer_addr), .dina(pixel_write_data), .ena(pixel_enable), 
		.wea(write_pixel), .clka(clk), .douta(pixel_read_data),
		.addrb(output_addr), .dinb(9'h0), .web(1'b0), .clkb(clk), .doutb(index));
	
	pixel_z_data pixel_z(.a(pixel_addr), .d(pixel_write_z), .we(write_pixel),
		.clk(clk), .spo(pixel_read_z));
	
	pixel_updated_logic pixel_updated_flag(clk, rst, line_start, pixel_addr, write_pixel,
		pixel_write_updated, pixel_read_updated, x, enable);
endmodule
