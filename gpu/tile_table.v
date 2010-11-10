`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: GPU sprite tile table.
// Module Name: tile_table
// Project Name: CS3710
// Description: Provides memory for storing the sprite tile table, memory
// mapped access to the table, and logic for access by the line buffer.
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
		output reg [31:0] tile_data,
		// Memory mapped IO
		input [12:0] memaddr,
		input memenable,
		input memwrite,
		input [15:0] writedata,
		output [15:0] memdata
	);
	
	// Address calculations
	reg tile_flip;
	reg [3:0] line_tile_x;
	wire [3:0] offset = tile_flip ? (size_x - current_tile) : current_tile;
	wire [3:0] tile_x_total;
	assign tile_x_total = line_tile_x + offset;
	reg table_addr;
	reg [3:0] y_total_addr;
	reg [2:0] y_offset_addr;
	wire [11:0] tile_addr;
	assign tile_addr = {table_addr, y_total_addr, tile_x_total, y_offset_addr};
	
	// VRAM for sprite tiles
	wire [31:0] read_tile_data;
	tile_vram tile_data_vram(
		.addra(memaddr), .dina(writedata), .ena(memenable), .wea(memwrite), .clka(clk), .douta(memdata),
		.addrb(tile_addr), .dinb(0), .web(1'b0), .clkb(clk), .doutb(read_tile_data));

	// On load, latch the address information
	always @(posedge clk) begin
		if (!rst) begin
			line_tile_x <= 0;
			table_addr <= 0;
			y_total_addr <= 0;
			y_offset_addr <= 0;
			tile_flip <= 0;
		end
		else if (load) begin
			line_tile_x <= tile_x;
			table_addr <= tile_table;
			y_total_addr <= tile_y_total;
			y_offset_addr <= tile_y_offset;
			tile_flip <= hFlip;
		end
	end
	
	// For horizontal flips, pixel values need to be reversed.
	always @(*) begin
		if (tile_flip) begin
			tile_data <= {read_tile_data[3:0], read_tile_data[7:4],
				read_tile_data[11:8], read_tile_data[15:12], read_tile_data[19:16], 
				read_tile_data[23:20], read_tile_data[27:24], read_tile_data[31:28]};
		end
		else begin
			tile_data <= read_tile_data;
		end
	end
endmodule
