`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: GPU line buffer.
// Module Name: line_buffer
// Project Name: CS3710
// Description: Provides 640 registers for storing the line back buffer and z priority;
// and 640 registers for the line front buffer, which is shifted out to the VGA output.
//////////////////////////////////////////////////////////////////////////////////
module line_buffer
	#(
		parameter WIDTH = 640,
		parameter SPRITE_DATA_ADDR = 16'h2000,
		parameter SPRITE_DATA_ADDR_TOP = 16'h3fff
	)
	(
		input clk,
		input rst,
		input shift,
		input load,
		input front,
		input [9:0] addr,
		input [11:0] tile,
		input [1:0] z,
		input [3:0] palette,
		input [9:0] x,
		output busy,
		output reg [7:0] p_index,
		// mem-mapped IO
		input [15:0] memaddr,
		input memwrite,
		input [15:0] writedata,
		output reg [15:0] memdata
   );
	// VRAM for sprite tiles
	reg [15:0] tile_data [8191:0];
	reg [31:0] loaded_tile_data;
		
	// VRAM for line front and back buffer.
	reg [31:0] pixel_buffer [511:0];

	initial begin
		$readmemh("tile.dat", tile_data);
	end
	
	// Registers for latching inputs
	reg [11:0] line_tile;
	reg [9:0] line_addr;
	reg [1:0] line_z;
	reg [3:0] line_palette;
	reg pixel_update;
	reg [1:0] pixel_z [WIDTH-1:0];
	// set of flags for values that need to be written. Transparent pixels are ignored.
	wire [3:0] need_write;
	assign need_write[0] = line_data[3:0] != 0;
	assign need_write[1] = line_data[7:4] != 0;
	assign need_write[2] = line_data[11:8] != 0;
	assign need_write[3] = line_data[15:12] != 0;
	
	// flags for each pixel already written to buffer.
	reg [3:0] written;
	
	// flags for values that have not been written yet.
	wire [3:0] unwritten;
	assign unwritten = need_write & ~written;
	
	// finds the right-most unwritten value.
	wire [3:0] next_write;
	assign next_write = (~unwritten + 1) & unwritten;
	
	// if there are unwritten values, load one
	wire load_pixel;
	wire load_z;
	reg [1:0] loaded_z;
	assign load_pixel = next_write != 0 && load_z;
	assign load_z = line_z > loaded_z;
	assign busy = load_pixel;

	// calulate which offset is needed
	reg [1:0] pixel_offset;
	always @(*) begin
		case (next_write)
			1: pixel_offset <= 0;
			2: pixel_offset <= 1;
			4: pixel_offset <= 2;
			8: pixel_offset <= 3;
			default: pixel_offset <= 0;
		endcase
	end
	
	// calculate the write offset.
	wire [9:0] pixel_addr;
	assign pixel_addr = line_addr + pixel_offset;
	
	// Switches the data written to pixel to the correct slice.
	reg [3:0] pixel_data;
	always @(*) begin
		case (pixel_offset)
			0: pixel_data <= line_data[3:0];
			1: pixel_data <= line_data[7:4];
			2: pixel_data <= line_data[11:8];
			3: pixel_data <= line_data[15:12];
			default: pixel_data <= line_data[3:0];
		endcase
	end
	
	
	
	
	
	wire [7:0] word;
	wire [1:0] offset;
	assign word = line_addr[9:2];
	assign offset = line_addr[1:0];

	reg [31:0] loaded;
	reg [31:0] write;
	always @(posedge clk) begin
		sliceA = {line_palette, line_data[3:0]};
		sliceB = {line_palette, line_data[7:4]};
		sliceC = {line_palette, line_data[11:8]};
		sliceD = {line_palette, line_data[15:12]};
		sliceE = {line_palette, line_data[19:16]};
		sliceF = {line_palette, line_data[23:20]};
		sliceG = {line_palette, line_data[27:24]};
		sliceH = {line_palette, line_data[31:28]};
		
		// first
		if (state == FIRST || state == THIRD) begin // for third, copy update to previous.
			if (offset == 0) begin // && (updateA || updateB || updateC || updateD)
				dataD = updateD ? sliceD : loaded[31:24];
				dataC = updateC ? sliceC : loaded[23:16];
				dataB = updateB ? sliceB : loaded[15:8];
				dataA = updateA ? sliceA : loaded[7:0];
			end
			else if (offset == 1) begin // && (updateA || updateB || updateC)
				dataD = updateC ? sliceC : loaded[31:24];
				dataC = updateB ? sliceB : loaded[23:16];
				dataB = updateA ?  sliceA : loaded[15:8];
				dataA = previousH ? sliceH : loaded[7:0];
			end
			else if (offset == 2) begin // && (updateA || updateB)
				dataD = updateB ? sliceB : loaded[31:24];
				dataC = updateA ? sliceA : loaded[23:16];
				dataB = previousH ? sliceH : loaded[15:8];
				dataA = previousG ? sliceG : loaded[7:0];
			end
			else begin // offset == 3 // && (updateA)
				dataD = updateA ? sliceA : loaded[31:24];
				dataC = previousH ? sliceH : loaded[23:16];
				dataB = previousG ? sliceG : loaded[15:8];
				dataA = previousF ? sliceF : loaded[7:0];
			end
		end
		else if (state == SECOND) begin
			if (offset == 0) begin
				dataD = updateH ? sliceH : loaded[31:24];
				dataC = updateG ? sliceG : loaded[23:16];
				dataB = updateF ? sliceF : loaded[15:8];
				dataA = updateE ? sliceE : loaded[7:0];
			end
			else if (offset == 1) begin
				dataD = updateG ? sliceG : loaded[31:24];
				dataC = updateF ? sliceF : loaded[23:16];
				dataB = updateE ? sliceE : loaded[15:8];
				dataA = updateD ? sliceD : loaded[7:0];
			end
			else if (offset == 2) begin
				dataD = updateF ? sliceF :loaded[31:24];
				dataC = updateE ? sliceE : loaded[23:16];
				dataB = updateD ? sliceD : loaded[15:8];
				dataA = updateC ? sliceC : loaded[7:0];
			end
			else begin
				dataD = updateE ? sliceE :loaded[31:24];
				dataC = updateD ? sliceD : loaded[23:16];
				dataB = updateC ? sliceC : loaded[15:8];
				dataA = updateB ? sliceB : loaded[7:0];
			end
		end
		write = {dataD, dataC, dataB, dataA};
	end

	always @(posedge clk) begin
		if (!rst) begin
			state <= WAIT;
		end
		else begin
			state <= next_state;
		end
	end
	
	always @(*) begin
		case (state)
			WAIT: next_state <= load ? FIRST : WAIT;
			// if the next word to be written
			FIRST: next_state <= offset != 0 ? SECOND : (load ? FIRST : WAIT);
			SECOND: next_state <= load ? FIRST : WAIT;
			default: next_state <= WAIT;
		endcase
	end
	
	

	/*
	it takes 2 cycles to read the sprite object data. it takes at least 2 cycles to write an 8 pixel slice,
	but writing to sequential addresses can be pipelined. After the rightmost slice write is initiated, the
	object data can use the next 3 write cycles to load the next object data. This means that the gpu control cycle is
	1 + 2 + 2 * (tiles) cycles. This is min 2 cycles for a cull, max 19 cycles for a full 32 pixel.
	Writing 32 32-pixel sprites will be 608 cycles. Using all 256 sprites, each a single tile wide, will 
	take 1280 cycles.
	
	*/
	

	// Memory reads and writes for sprite tile data.
	reg [12:0] tmem;
	always @(posedge clk) begin
		if (memaddr >= SPRITE_DATA_ADDR && memaddr <= SPRITE_DATA_ADDR_TOP) begin
			tmem <= memaddr - SPRITE_DATA_ADDR;
			if (memwrite) begin
				tile_data[tmem] <= writedata;
			end
			memdata <= tile_data[tmem];
		end
		loaded_tile_data <= tile_data[tile];
	end
	
	
	
	
	
	
	wire front_updated [WIDTH-1:0];
	wire back_updated [WIDTH-1:0];
	wire pixel_z [WIDTH-1:0];
	genvar i;
	generate
		for (i = 0; i < WIDTH; i = i + 1)
		begin:buffer
			wire select;
			assign select = load_pixel && (pixel_addr == i);
			line_buffer_latch stage(clk, select, copy, clear, pixel_z, front_z[i], front_update[i], back_updated[i]);
		end
	endgenerate

endmodule

module line_updated_buffer
	(
		input clk,
		input load,
		input copy,
		input clear,
		input [1:0] data,
		output reg [1:0] front_z,
		output reg front,
		output reg back
	);
	always @(posedge clk) begin
		if (!clear || copy) begin
			front <= 0;
			front_z <= 0;
		end
		else if (load) begin
			front <= 1;
			front_z <= data;
		end
		
		if (!clear) begin
			back <= 0;
		end
		else if (copy) begin
			back <= front;
		end
	end
endmodule
