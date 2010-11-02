`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    12:12:04 10/28/2010 
// Design Name: 
// Module Name:    memoryMap 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module memoryMap
	#(
		parameter SPRITE_ADDR = 16'h2000,
		parameter TILE_ADDR = 16'h2400,
		parameter PALETTE_ADDR = 16'h4400,
		parameter PRIORITY_ADDR = 16'h4801,
		parameter BRIGHTNESS_ADDR = 16'h4802,
		parameter GPU_SR_ADDR = 16'h4800
	)
	(
		input clk,
		input [15:0] memaddr,
		input memwrite,
		input [15:0] writedata,
		output [15:0] memdata,
		input [15:0] pcaddr,
		output [15:0] instruction,
		// Memory mapped input and other RAM blocks.
		input hbright,
		input vbright,
		input [15:0] sprite_object_data, tile_data,
		output sprite_object_enable, tile_data_enable,
		output [9:0] sprite_object_addr,
		output [12:0] tile_data_addr,
		output reg [6:0] sprite_priority,
		output reg [7:0] brightness
	 );

	wire programen;
	assign programen = (addr < SPRITE_ADDR);
	assign sprite_object_enable = !programen && (addr < TILE_ADDR);
	assign tile_data_enable = !sprite_object_enable && (addr < PALETTE_ADDR);
	assign sprite_object_addr = memaddr - SPRITE_ADDR;
	assign tile_data_addr = memaddr - TILE_ADDR;
	wire [15:0] programout;
	main_memory programMemory (.clka(clk), .clkb(clk), .addra(memaddr), .wea(memwrite), .ena(programen), .dina(writedata), .douta(programout), 
										 .addrb(pcaddr), .web(1'b0), .dinb(15'b0), .doutb(instruction))
	always @(*) begin
		if (programen)
			memdata <= programout;
		else if (sprite_object_enable)
			memdata <= sprite_object_data;
		else if (tile_data_enable)
			memdata <= tile_data;
		else
			memdata <= other_memdata;
	end
	
	// Memory mapped access - misc
	reg [15:0] other_memdata;
	always @(posedge clk) begin
		if (!rst) begin
			brightness <= 0;
			sprite_priority <= 0;
		end
		else begin
			if (memaddr == BRIGHTNESS_ADDR) begin
				if (memmemwrite) begin
					brightness <= writedata;
				end
				other_memdata <= brightness;
			end
			else if (memaddr == PRIORITY_ADDR) begin
				if (memmemwrite) begin
					sprite_priority <= writedata;
				end
				other_memdata <= sprite_priority;
			end
			else if (memaddr == GPU_SR_ADDR) begin
				other_memdata <= {hbright, vbright, 8'b00000000}; 
			end
			else begin
				other_memdata = 0;
			end
		end
	end
endmodule