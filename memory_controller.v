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
module memory_controller
	#(
		parameter SPRITE_ADDR = 16'h2000,
		parameter TILE_ADDR = 16'h2400,
		parameter PALETTE_ADDR = 16'h4400,
		parameter PRIORITY_ADDR = 16'h4801,
		parameter BRIGHTNESS_ADDR = 16'h4802,
		parameter GPU_SR_ADDR = 16'h4800,
		parameter SWITCH_LED_ADDR = 16'h4803
	)
	(
		input clk,
		input rst,
		input [15:0] memaddr,
		input memwrite,
		input [15:0] writedata,
		output reg [15:0] memdata,
		input [15:0] pcaddr,
		output [15:0] instruction,
		// Memory mapped input and other RAM blocks.
		input hbright,
		input vbright,
		input [15:0] sprite_object_data, tile_data, palette_data,
		output sprite_object_enable, tile_data_enable, palette_enable,
		output [9:0] sprite_object_addr,
		output [12:0] tile_data_addr,
		output [9:0] palette_addr,
		output reg [6:0] sprite_priority,
		output reg [7:0] brightness,
		//inputs and outputs for switches and leds
		input [3:0] switches,
		output reg [7:0] test_out
	 );

	wire programen;
	assign programen = (memaddr < SPRITE_ADDR);
	assign sprite_object_enable = !programen && (memaddr < TILE_ADDR);
	assign tile_data_enable = !sprite_object_enable && (memaddr < PALETTE_ADDR);
	assign palette_enable = !tile_data_enable && (memaddr < GPU_SR_ADDR);
	assign sprite_object_addr = memaddr - SPRITE_ADDR;
	assign tile_data_addr = memaddr - TILE_ADDR;
	assign palette_addr = memaddr - PALETTE_ADDR;
	wire [15:0] programout;
	//main_memory programMemory (.clka(clk), .clkb(clk), .addra(memaddr[12:0]), .wea(memwrite), .ena(programen), .dina(writedata), .douta(programout), 
	//									 .addrb(pcaddr[12:0]), .web(1'b0), .dinb(16'b0), .doutb(instruction), .rstb(~rst));
	exmem programMemory( .clk(clk), .adr(memaddr[12:0]), .pcaddr(pcaddr[12:0]), .memwrite(memwrite), .en(programen), .writedata(writedata), 
			.programout(programout), .instruction(instruction));
	// Memory mapped access - misc
	reg [15:0] other_memdata;
	always @(posedge clk) begin
		if (!rst) begin
			brightness <= 0;
			sprite_priority <= 0;
		end
		else begin
			if (memaddr == BRIGHTNESS_ADDR) begin
				if (memwrite) begin
					brightness <= writedata;
				end
				other_memdata <= brightness;
			end
			else if (memaddr == PRIORITY_ADDR) begin
				if (memwrite) begin
					sprite_priority <= writedata;
				end
				other_memdata <= sprite_priority;
			end
			else if (memaddr == GPU_SR_ADDR) begin
				other_memdata <= {hbright, vbright}; 
			end
			else if (memaddr ==  SWITCH_LED_ADDR) begin
				if (memwrite) begin
					test_out <= writedata;
				end
				other_memdata <= switches;
			end
			else begin
				other_memdata <= 0;
			end
		end
	end
	
	always @(*) begin
		if (programen)
			memdata <= programout;
		else if (sprite_object_enable)
			memdata <= sprite_object_data;
		else if (tile_data_enable)
			memdata <= tile_data;
		else if (palette_enable)
			memdata <= palette_data;
		else
			memdata <= other_memdata;
	end
endmodule
