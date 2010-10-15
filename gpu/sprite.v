
`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Sprite
// Module Name: sprite
// Project Name: CS3710
// Description: Combinatorial logic for sprites.
//////////////////////////////////////////////////////////////////////////////////
module sprite
	(
		// Sprite data
		input [15:0] a, // current x coord.
		input  [15:0] b, // current y coord.
		input  [2:0] sizeX,
		input [2:0] sizeY,
		input  hFlip,
		input  vFlip,
		input tileTable,
		input [3:0] tileX,
		input [3:0] tileY,
		
		// Relative data
		input [15:0] y, // given y coord of scan line.
		output xbound, // true if b is bounded on this scan line
		output yintersect, // true if intersects this scan line
		input [7:0] tile_word_loaded, // bank of 8 flags, for each horizontal slice word already loaded
		output [7:0] tile_word_next, // single flag will be on for the next slice word to load at tile addr.
		output [11:0] tile // address of double word to lookup for current tile_word_next
	);

	reg [5:0] width;
	reg [5:0] height;
	wire [15:0] bottom_edge;
	wire [15:0] left_edge;
	assign left_edge = a + width;
	assign bottom_edge = b + height;
	assign xbound = left_edge >= 0 && a < 640;
	assign yintersect = y >= b && y <= bottom_edge;
	
	always @(*) begin
		case (sizeX)
			0: width <= 7;
			1: width <= 15;
			2: width <= 23;
			3: width <= 31;
			4: width <= 39;
			5: width <= 47;
			6: width <= 55;
			7: width <= 63;
			default: width <= 7;
		endcase
	end
	
	always @(*) begin
		case (sizeY)
			0: height <= 7;
			1: height <= 15;
			2: height <= 23;
			3: height <= 31;
			4: width <= 39;
			5: width <= 47;
			6: width <= 55;
			7: width <= 63;
			default: height <= 7;
		endcase
	end
		
	// Tile lookup calculations
	reg [7:0] tile_base_clipped;
	always @(*) begin
		case(sizeX)
			0: tile_base_clipped <= 1;
			1: tile_base_clipped <= 3;
			2: tile_base_clipped <= 7;
			3: tile_base_clipped <= 15;
			4: tile_base_clipped <= 31;
			5: tile_base_clipped <= 63;
			6: tile_base_clipped <= 127;
			7: tile_base_clipped <= 255;
			default: tile_base_clipped <= 1;
		endcase
	end
	wire [7:0] tile_word_clipped;
	assign tile_word_clipped[0] = tile_base_clipped[0] && (a + 8) > 0;
	assign tile_word_clipped[1] = tile_base_clipped[1] && (a + 16) > 0 && (a + 8) < 640;
	assign tile_word_clipped[2] = tile_base_clipped[2] && (a + 24) > 0 && (a + 16) < 640;
	assign tile_word_clipped[3] = tile_base_clipped[3] && (a + 32) > 0 && (a + 24) < 640;
	assign tile_word_clipped[4] = tile_base_clipped[4] && (a + 40) > 0 && (a + 32) < 640;
	assign tile_word_clipped[5] = tile_base_clipped[5] && (a + 48) > 0 && (a + 40) < 640;
	assign tile_word_clipped[6] = tile_base_clipped[6] && (a + 56) > 0 && (a + 48) < 640;
	assign tile_word_clipped[7] = tile_base_clipped[7] && (a + 64) > 0 && (a + 56) < 640;
	
	wire [7:0] masked_clip;
	
	assign masked_clip = tile_word_clipped & ~tile_word_loaded;
	assign tile_word_next = (~masked_clip + 1) & masked_clip;
	// relative position
	reg tile_word_offset;
	wire [3:0] tile_x_total;
	wire [2:0] tile_vertical_offset;
	wire [3:0] tile_y_total;
	reg [2:0] tile_x_offset;
	wire [2:0] tile_y_offset;
	wire [6:0] n;
	assign n = y - b;
	assign tile_y_offset = n[2:0];
	assign tile_vertical_offset = n[6:3];
	
	assign tile = {tileTable, tile_y_total, tile_vertical_offset, tile_x_total};
	assign tile_x_total = tileX + tile_x_offset;
	assign tile_y_total = tileY + tile_y_offset;
	
	always @(*) begin
		case (tile_word_next)
			1: tile_x_offset <= 0;
			2: tile_x_offset <= 1;
			4: tile_x_offset <= 2;
			8: tile_x_offset <= 3;
			16: tile_x_offset <= 4;
			32: tile_x_offset <= 5;
			64: tile_x_offset <= 6;
			128: tile_x_offset <= 7;
			default: tile_x_offset <= 0;
		endcase
	end
endmodule

	
