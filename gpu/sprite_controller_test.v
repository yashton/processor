`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:40:42 10/19/2010
// Design Name:   gpu
// Module Name:   /home/yashton/Desktop/blue/sprite_controller_test.v
// Project Name:  blue
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: gpu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module sprite_controller_test;

	// Inputs
	reg clk;
	reg rst;
	reg [6:0] sprite_priority;
	reg memenable;
	reg [9:0] memaddr;
	reg memwrite;
	reg [15:0] writedata;
	reg scanline_start;
	reg vlookahead;
	reg [9:0] y;
	reg line_busy;

	// Outputs
	wire [15:0] memdata;
	wire hFlip;
	wire line_load;
	wire [1:0] line_z;
	wire [3:0] line_palette;
	wire [9:0] line_addr;
	wire tile_table;
	wire [3:0] tile_x;
	wire [3:0] tile_y_total;
	wire [2:0] tile_y_offset;
	wire [2:0] sizeX;
	wire [2:0] first;
	wire [2:0] last;

	// Instantiate the Unit Under Test (UUT)
	sprite_controller uut (
		.clk(clk), 
		.rst(rst), 
		.sprite_priority(sprite_priority), 
		.memenable(memenable), 
		.memaddr(memaddr), 
		.memwrite(memwrite), 
		.writedata(writedata), 
		.memdata(memdata), 
		.scanline_start(scanline_start), 
		.vlookahead(vlookahead), 
		.y(y), 
		.hFlip(hFlip), 
		.line_load(line_load), 
		.line_z(line_z), 
		.line_palette(line_palette), 
		.line_addr(line_addr), 
		.tile_table(tile_table), 
		.tile_x(tile_x), 
		.tile_y_total(tile_y_total), 
		.tile_y_offset(tile_y_offset), 
		.sizeX(sizeX), 
		.first(first), 
		.last(last), 
		.line_busy(line_busy)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		sprite_priority = 0;
		memenable = 0;
		memaddr = 0;
		memwrite = 0;
		writedata = 0;
		scanline_start = 0;
		vlookahead = 1;
		y = 0;
		line_busy = 0;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 1;
		// Add stimulus here

	end

	always begin
		#5 clk = 1; #5 clk = 0;
	end
      
endmodule

