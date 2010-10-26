
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
		input  vFlip,
		input [3:0] tileY,
		
		// Relative data
		input [9:0] y, // given y coord of scan line.
		//output xbound, // true if sprite is bounded on this scan line
		output yintersect, // true if intersects this scan line
		
		// Tile outputs
		output [3:0] tile_y_total,
		output [2:0] tile_y_offset,
		output reg [2:0] first,
		output reg [2:0] last
	);

	reg [5:0] width;
	reg [5:0] height;
	//assign xbound = (a + width) >= 0 && a < 640;
	assign yintersect = y >= b && y <= (b + height);
	
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
			4: height <= 39;
			5: height <= 47;
			6: height <= 55;
			7: height <= 63;
			default: height <= 7;
		endcase
	end

	always @(*) begin
		if (a >= 0)
			first <= 0;
		else
			first <= (-a)/8 + 1;
			
		if ((a + width) < 640)
			last <= sizeX;
		else
			last <= sizeX - ((a + width) - 640)/8;
	end
	
	// relative position
	wire [3:0] tile_vertical_offset;
	wire [6:0] n;
	assign n = vFlip ? (height - (y - b)) : (y - b);
	assign tile_y_offset = n[2:0];
	assign tile_vertical_offset = n[6:3];
	assign tile_y_total = tileY + tile_vertical_offset;
endmodule
