`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: GPU sprite tile table.
// Module Name: tile_table
// Project Name: CS3710
// Description: Provides memory for storing the sprite tile table, memory
// mapped access to the table, and combinational logic for combining
//////////////////////////////////////////////////////////////////////////////////
module tile_table
	(
		input clk,
		input rst,
		input load,
		// Sprite data
		input hFlip,
		input [2:0] size_x,
		input tile_table,
		input [3:0] tile_x,
		input [3:0] tile_y_total,
		input [2:0] tile_y_offset,
		// Line buffer connection
		input [3:0] current_tile,
		output reg tile_flip,
		output [31:0] tile_data,
		// Memory mapped IO
		input [12:0] memaddr,
		input memenable,
		input memwrite,
		input [15:0] writedata,
		output [15:0] memdata
	);
	
	reg [3:0] line_tile_x;
	reg [7:0] tile_top;
	wire [3:0] offset = tile_flip ? (size_x - current_tile) : current_tile;
	wire [3:0] tile_x_total;
	assign tile_x_total = line_tile_x + offset;
	wire [11:0] tile_addr;
	assign tile_addr = {tile_top, tile_x_total};

	// VRAM for sprite tiles
	tile_vram tile_data_vram(
		.addra(memaddr), .dina(writedata), .ena(memenable), .wea(memwrite), .clka(clk), .douta(memdata),
		.addrb(tile_addr), .dinb(0), .web(1'b0), .clkb(clk), .doutb(tile_data));

	always @(posedge clk) begin
		if (!rst) begin
			line_tile_x <= 0;
			tile_top <= 0;
			tile_flip <= 0;
		end
		else if (load) begin
			line_tile_x <= tile_x;
			tile_top <= {tile_table, tile_y_total, tile_y_offset};
			tile_flip <= hFlip;
		end
	end
endmodule
