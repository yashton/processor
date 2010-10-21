`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: Memory Controller
// Module Name: memory_controller
// Project Name: CS3710
// Description: Memory routing for main memory and memory mapped IO.
//////////////////////////////////////////////////////////////////////////////////
module memory_controller
	#(
		parameter MAIN_MEMORY_SIZE = 9216,
		parameter PROGRAM_ADDR_TOP = 16'h1FFF,
		parameter SPRITE_ADDR = 16'h4000,
		parameter SPRITE_ADDR_TOP = 16'h41ff,
		parameter TILE_ADDR = 16'h2000,
		parameter TILE_ADDR_TOP = 16'h3fff,
		parameter PRIORITY_ADDR = 16'h4380,
		parameter BRIGHTNESS_ADDR = 16'h4381,
		parameter GPU_SR_ADDR = 16'h4382
	)
	(
		input clk,
		input rst,
		input [15:0] memaddr,
		input memwrite,
		input [15:0] writedata,
		input [15:0] pcaddr,
		output reg [15:0] memdata,
		output [15:0] pcdata,
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
	wire program_enable;
	assign program_enable = memaddr <= PROGRAM_ADDR_TOP;
	
	assign sprite_object_enable = memaddr >= SPRITE_ADDR && memaddr <= SPRITE_ADDR_TOP;
	assign sprite_object_addr = memaddr - SPRITE_ADDR;
	assign tile_data_enable = memaddr >= TILE_ADDR && memaddr <= TILE_ADDR_TOP;
	assign tile_data_addr = memaddr - TILE_ADDR;
	
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
				other_memdata <= {hbright, vbright, 8'b00000000};
			end
		end
	end
	
	// main program memory - 9 kilowords
	wire [15:0] main_data;
	main_memory main(.addra(memaddr), .dina(writedata), .ena(program_enable), .wea(memwrite),
		.clka(clk), .clkb(clk), .web(1'b0), .dinb(16'h0), .addrb(pcaddr), .doutb(pcdata), .douta(main_data));
	
	// Decides which of the memory regions will be output on memdata.
	always @(*) begin
		if (sprite_object_enable) begin
			memdata <= sprite_object_data;
		end
		else if (tile_data_enable) begin
			memdata <= tile_data;
		end
		else if (program_enable) begin
			memdata <= main_data;
		end
		else begin
			memdata <= other_memdata;
		end
	end
endmodule
