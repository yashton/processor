`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Graphics processing unit.
// Module Name: gpu
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module sprite_controller
	#(
		parameter SIZE = 8,
		parameter COLOR = 8,
		parameter COUNT = 7,
		parameter SPRITE_COUNT = 256,
		parameter START = 0,
		parameter INCR = 1,
		parameter LOAD_Y = 2,
		parameter LOAD_X = 3,
		parameter LOAD_SLICE_WORD = 4
	)
	(
		input clk,
		input rst,
		input [6:0] sprite_priority,
		// Processor memory mapped io inputs.
		input memenable,
		input [9:0] memaddr,
		input memwrite,
		input [15:0] writedata,
		output [15:0] memdata,

		// VGA control
		input scanline_start,
		input vlookahead,
		input [9:0] y, // given y coord of scan line.
		
		// line buffer control
		output reg hFlip,
		output line_load,
		output reg [1:0] line_z,
		output reg [3:0] line_palette,
		output [9:0] line_addr,
		output reg tile_table,
		output reg [3:0] tile_x,
		output [3:0] tile_y_total,
		output [2:0] tile_y_offset,
		output reg [2:0] sizeX,
		output [2:0] first,
		output [2:0] last,
		
		input line_busy
	);
	
	// RAM for sprite object data
	wire [31:0] loaded_sprite_data;
	
	reg active;
	// Sprite data
	reg [15:0] a, b; // current x and y coord.
	reg [2:0] sizeY;
	reg vFlip;
	reg [3:0] tile_y;
	wire yintersect; // true if intersects this scan line
	
	sprite test (a, b, sizeX, sizeY, vFlip, tile_y, y, yintersect, tile_y_total, tile_y_offset, first, last);
	
	assign line_addr = a[9:0];
	
	// State machine logic
	reg [4:0] state;
	reg [4:0] next_state;
	
	always @(posedge clk) begin
		if (!rst) begin
			state <= START;
		end
		else if (vlookahead) begin
			state <= next_state;
		end
	end

	always @(*) begin
		if (scanline_start) begin
			next_state <= START;
		end
		else begin
			case (state)
				START: next_state <= LOAD_Y;
				INCR: next_state <= LOAD_Y;
				LOAD_Y: next_state <= LOAD_X;
				LOAD_X: next_state <= active && yintersect ? LOAD_SLICE_WORD : INCR;
				LOAD_SLICE_WORD: next_state <= line_busy ? LOAD_SLICE_WORD : INCR;
				default: next_state <= START;
			endcase
		end
	end
	
	// sprite lookup calculations.
	reg [7:0] sprite_i;
	wire sprite_offset;
	wire [8:0] sprite_addr;
	assign sprite_addr = {sprite_i, sprite_offset}; // address is calculated by 2 * i + offset;
	assign sprite_offset = state == START || state == INCR;
	
	// Data loading.
	always @(posedge clk) begin
		if (!rst) begin
			sprite_i <= 0;
		end
		else if (state == START) begin
			sprite_i <= sprite_priority;
		end
		else if (state == INCR) begin
			sprite_i <= sprite_i + 1;
		end
		
		if (!rst) begin
			sizeX <= 0;
			sizeY <= 0;
			hFlip <= 0;
			vFlip <= 0;
			line_z <= 0;
			active <= 0;
			b <= 0;
		end
		else if (state == LOAD_Y) begin
			sizeX <= loaded_sprite_data[26:24];
			sizeY <= loaded_sprite_data[23:21];
			hFlip <= loaded_sprite_data[20];
			vFlip <= loaded_sprite_data[19];
			line_z <= loaded_sprite_data[18:17];
			active <= loaded_sprite_data[16];
			b <= loaded_sprite_data[15:0];
			//{sizeX, sizeY, hFlip, vFlip, line_z, active, b} <= line_sprite_data;
		end
		
		if (!rst) begin
			line_palette <= 0;
			tile_table <= 0;
			tile_x <= 0;
			tile_y <= 0;
			a <= 0;
		end
		else if (state == LOAD_X) begin
			line_palette <= loaded_sprite_data[28:25];
			tile_table <= loaded_sprite_data[24];
			tile_x <= loaded_sprite_data[23:20];
			tile_y <= loaded_sprite_data[19:16];
			a <= loaded_sprite_data[15:0];
			//{line_palette, tile_table, tile_x, tile_y, a} <= loaded_sprite_data;
		end
	end
	
	assign line_load = state == LOAD_SLICE_WORD && !line_busy;
//	wire sprite_load;
//	assign sprite_load = state == LOAD_X || state == LOAD_Y;
	
	sprite_object_vram sprite_ram(
		.addra(memaddr), .dina(writedata), .ena(memenable), .wea(memwrite), .clka(clk), .douta(memdata),
		.addrb(sprite_addr), .dinb(0), .web(1'b0), .clkb(clk), .doutb(loaded_sprite_data));
endmodule
