`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: William Graham, Ashton Snelgrove
// 
// Design Name: Memory map controller
// Module Name:    memoryMap 
// Project Name: blue
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module memory_controller
	#(
	
		parameter PROGRAM_TOP_ADDR = 16'h2000,
		parameter SPRITE_ADDR = 16'h2000,
		parameter SPRITE_TOP_ADDR = 16'h2400,
		parameter TILE_ADDR = 16'h2400,		
		parameter TILE_TOP_ADDR = 16'h4400,
		parameter PALETTE_ADDR = 16'h4400,
		parameter PALETTE_TOP_ADDR = 16'h4800,
		parameter GPU_SR_ADDR = 16'h4800,
		parameter PRIORITY_ADDR = 16'h4801,
		parameter BRIGHTNESS_ADDR = 16'h4802,
		parameter SWITCH_LED_ADDR = 16'h4803,
		// DMA_REGS % 4  needs to be 0
		parameter DMA_REGS = 16'h4804,
		parameter DMA_SRC_L = DMA_REGS + 0,
		parameter DMA_SRC_U = DMA_REGS + 1,
		parameter DMA_DST = DMA_REGS + 2,
		parameter DMA_AMT = DMA_REGS + 3,
		parameter ROT_ADDR = 16'h4808,
		parameter RNG_ADDR = 16'h4809,
		parameter CONA_ADDR = 16'h480a,
		parameter CONB_ADDR = 16'h480b,
		parameter SOUND_ADDR = 16'h480c,
		parameter SOUND_TOP_ADDR = 16'h4825,
		parameter BG_PALETTE_ADDR = 16'h4827
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
		// GPU VRAM blocks
		input [4:0] bg_pallete,
		input [15:0] sprite_object_data, tile_data, palette_data, bg_write_data,
		output sprite_object_enable, tile_data_enable, palette_enable, bg_mem_write,  bg_mem_enable,
		output [9:0] sprite_object_addr,
		output [12:0] tile_data_addr,
		output [9:0] palette_addr,
		// GPU registers
		input hbright,
		input vbright,
		output reg [7:0] sprite_priority,
		output reg [7:0] brightness,
		//inputs and outputs for switches and leds
		//output reg [7:0] test_out,
		input [7:0] switches,
		//snes controller
		input [15:0] plyra_input,
		//nes zapper
		input [15:0] plyrb_input,
		// Rotary encoder
		input [15:0] rot_count,
		output rot_en,
		// DMA controller
		output dma_en,
		output [1:0] dma_mode,
		//sound controller
		input [15:0] sound_data,
		output sound_en,
		output [6:0] sound_select
	 );

	wire programen;
	assign programen = (memaddr < PROGRAM_TOP_ADDR);
	assign sprite_object_enable = (memaddr >= SPRITE_ADDR) && (memaddr < SPRITE_TOP_ADDR);
	assign tile_data_enable = (memaddr >= TILE_ADDR) && (memaddr < TILE_TOP_ADDR);
	assign palette_enable = (memaddr >= PALETTE_ADDR) && (memaddr < PALETTE_ADDR);
	assign bg_mem_enable = memaddr == BG_PALETTE_ADDR;
	assign rot_en = memaddr == ROT_ADDR;
	assign dma_en = memaddr[15:2] == DMA_REGS;
	assign dma_mode = memaddr[1:0];
	
	assign sound_en = (memaddr >= SOUND_ADDR) && (memaddr < SOUND_TOP_ADDR);
	assign sound_select = memaddr - SOUND_ADDR;
	assign sprite_object_addr = memaddr - SPRITE_ADDR;
	assign tile_data_addr = memaddr - TILE_ADDR;
	assign palette_addr = memaddr - PALETTE_ADDR;
	wire [15:0] programout;
	//main_memory programMemory (.clka(clk), .clkb(clk), .addra(memaddr[12:0]), .wea(memwrite), .ena(programen), .dina(writedata), .douta(programout), 
	//									 .addrb(pcaddr[12:0]), .web(1'b0), .dinb(16'b0), .doutb(instruction), .rstb(~rst));
	exmem programMemory( .clk(clk), .adr(memaddr[12:0]), .pcaddr(pcaddr[12:0]), .memwrite(memwrite), .en(programen), .writedata(writedata), 
			.programout(programout), .instruction(instruction));

	wire rng_en;
	wire [15:0] random;
	assign rng_en = memaddr == RNG_ADDR;
	rng rand (.clk(clk), .en(rng_en), .rst(rst), .write(memwrite), .seed(writedata), .random(random));
	
	// Memory mapped access - misc
	reg [15:0] other_memdata;
	always @(posedge clk) begin
		if (!rst) begin
			brightness <= 8'hFF;
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
			else if ( memaddr == BG_PALETTE_ADDR) begin
				if (bg_mem_write) begin
					bg_write_data <= writedata;
				end
				other_memdata <= bg_write_data;
			end
			else if (memaddr == GPU_SR_ADDR) begin
				other_memdata <= {hbright, vbright}; 
			end
			else if (memaddr ==  SWITCH_LED_ADDR) begin
//				if (memwrite) begin
//					test_out <= writedata;
//				end
				other_memdata <= switches;
			end
			else if (memaddr == ROT_ADDR) begin
				other_memdata <= rot_count;
			end
			else if ( memaddr == CONA_ADDR) begin
				other_memdata <= {4'b0, plyra_input};
			end
			else if ( memaddr == CONB_ADDR) begin
				other_memdata <= {4'b0, plyrb_input};
			end
			else if (rng_en) begin
				other_memdata <= random;
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
		else if (sound_en)
			memdata <= sound_data;
		else
			memdata <= other_memdata;
	end
endmodule
