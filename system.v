`timescale 1ns / 1ps
`define foo 6
module system
	(
		input clk,
		input rst_btn,
		//game/user input
		input data,
		output latch,
		output pulse,
		input sensor,
		input trigger,
		//snes controller input
		output [15:0] plyra_input,
		output [15:0] plyrb_input,
		// VGA
		output bright, hsync, vsync,
		output [7:0] R, G, B,
		output vga_dac_clk,
		// physical switches
		input [7:0] switches,
		// rotary encoder
		input rot_a,
		input rot_b,
		// StrataFlash ROM
		input [15:0] SF_D,
		output [23:0] SF_A,
		output SF_CE0,
		output SF_OE,
		output SF_WE,
		output SF_BYTE,
		// Onboard vga
		output VGA_RED, VGA_GREEN, VGA_BLUE,
		output VGA_HSYNC, VGA_VSYNC,
		// SPI 
		output MOSI,
		output DAC_cs,
		output SCK,
		output DAC_CLR
	);
	wire rst;
	assign rst = !rst_btn;
	
	wire hbright;
	wire vbright;
	wire [9:0] x, y;
	wire line_start;
	wire vlookahead;
	wire [15:0] tile_memdata;
	wire [15:0] sprite_memdata;
	wire [7:0] brightness;
	wire [7:0] sprite_priority;
	wire sprite_memenable;
	wire [9:0] sprite_addr;
	wire tile_memenable;
	wire [12:0] tile_addr;
	
	// processor
	wire [15:0] memdata;
	wire [15:0] instruction;
	wire proc_en;
	wire [15:0] pcaddr;	
	wire [15:0] proc_writedata;
	wire [15:0] proc_memaddr;
	wire proc_memwrite;
	
	wire [15:0] writedata;
	wire [15:0] memaddr;
	wire memwrite;
	
	wire palette_memenable;
	wire [15:0] palette_memdata;
	wire [9:0] palette_addr;
	
	wire [15:0] bg_write_data;
	wire bg_mem_write;
	wire bg_mem_enable;
	wire bg_palette;

	// rotary encoder
	wire [15:0] rot_count;
	wire rot_en;
	
	// DMA controller
//	wire dma_en;
//	wire [1:0] dma_mode;
	wire [23:0] rom_addr;
	wire [15:0] rom_data;
	wire rom_load;
	wire rom_ready;
//	wire [15:0] dma_writedata;
//	wire [15:0] dma_memaddr;
//	wire dma_memwrite;
	
	//sound controller
	wire sound_en;
	wire [15:0] sound_data;
	wire [6:0] sound_select;

	
	processor proc (
			.clk(clk),
			.rst(rst),
			.en(proc_en),
			.pcaddr(pcaddr),
			.instruction(instruction),
			.memaddr(proc_memaddr),
			.memdata(memdata),
			.writedata(proc_writedata),
			.memwrite(proc_memwrite)
		);
		
//	assign memaddr = proc_en ? proc_memaddr : dma_memaddr;
//	assign memwrite = proc_en ? proc_memwrite : dma_memwrite;
//	assign writedata = proc_en ? proc_writedata : dma_writedata;
		
	assign memaddr = proc_memaddr;
	assign memwrite = proc_memwrite;
	assign writedata = proc_writedata;
	assign proc_en = 1'b1;
		
	memory_controller  memory (
			.clk(clk), 
			.rst(rst), 
			.memaddr(memaddr), 
			.memwrite(memwrite),
			.writedata(writedata), 
			.memdata(memdata),  
			.pcaddr(pcaddr), 
			.instruction(instruction), 
			.sprite_object_data(sprite_memdata), 
			.tile_data(tile_memdata), 
			.vbright(vbright), 
			.hbright(hbright), 
			.brightness(brightness), 
			.sprite_object_addr(sprite_addr), 
			.sprite_object_enable(sprite_memenable), 
			.sprite_priority(sprite_priority), 
			.tile_data_addr(tile_addr), 
			.tile_data_enable(tile_memenable),
			.palette_enable(palette_memenable),
			.palette_addr(palette_addr),
			.palette_data(palette_memdata),
			.switches(switches),
			.plyra_input(plyra_input),
			.plyrb_input(plyrb_input),
			.rot_count(rot_count),
			.rot_en(rot_en),
//			.dma_en(dma_en),
//			.dma_mode(dma_mode),
			.sound_data(sound_data),
			.sound_select(sound_select),
			.sound_en(sound_en),
			.bg_write_data(bg_write_data),
			.bg_mem_write(bg_mem_write),
			.bg_mem_enable(bg_mem_enable),
			.bg_palette(bg_palette)
	  );
	  
	gpu_schematic  gpu (
		 .clk(clk), 
		 .rst(rst), 
		 .line_start(line_start), 
		 .memwrite(memwrite), 
		 .brightness(brightness), 
		 .palette_addr(palette_addr), 
		 .palette_memenable(palette_memenable),
		 .sprite_addr(sprite_addr), 
		 .sprite_memenable(sprite_memenable), 
		 .sprite_priority(sprite_priority), 
		 .tile_addr(tile_addr), 
		 .tile_memenable(tile_memenable), 
		 .vlookahead(vlookahead), 
		 .writedata(writedata), 
		 .x(x), 
		 .y(y), 
		 .R(R), 
		 .G(G), 
		 .B(B), 
		 .sprite_memdata(sprite_memdata), 
		 .tile_memdata(tile_memdata),
		 .palette_memdata(palette_memdata),
		 .bg_write_data(bg_write_data),
		 .bg_mem_write(bg_mem_write),
		 .bg_mem_enable(bg_mem_enable),
		 .bg_palette(bg_palette)
		);
		
	assign VGA_RED = R[7];
	assign VGA_GREEN = G[7];
	assign VGA_BLUE = B[7];
	assign VGA_HSYNC = hsync;
	assign VGA_VSYNC = vsync;
	
	
	vga  vga_ctrl (
			.clk(clk), 
		  .rst(rst), 
		  .bright(bright), 
		  .hbright(hbright), 
		  .hsync(hsync), 
		  .line_start(line_start), 
		  .vbright(vbright), 
		  .vlookahead(vlookahead), 
		  .vsync(vsync), 
		  .x(x), 
			.y(y),
			.vga_dac_clk(vga_dac_clk)
		);
					  
	rotary_encoder rot (
			.clk(clk),
			.rst(rst),
			.rot_a(rot_a),
			.rot_b(rot_b),
			.count(rot_count),
			.write(memwrite),
			.en(rot_en),
			.writedata(writedata)
		);	
		
		
	sound_schematic sound (
		.clk(clk),
		.rst(rst),
		.en(1'b1),
		.MOSI(MOSI),
		.DAC_cs(DAC_cs),
		.SCK(SCK),
		.CLR(DAC_CLR),
		.sound_select(sound_select),
		.writedata(writedata),
		.memwrite(memwrite),
		.mem_en(sound_en),
		.sound_data(sound_data),
		.rom_addr(rom_addr),
		.rom_ready(rom_ready),
		.rom_load(rom_load),
		.rom_data(rom_data)
	);
	
	romController rom (
			.clk(clk),
			.rst(rst),
			.addr(rom_addr),
			.load(rom_load),
			.data(rom_data),
			.ready(rom_ready),
			.SF_D(SF_D),
			.SF_A(SF_A),
			.SF_CE0(SF_CE0),
			.SF_OE(SF_OE),
			.SF_WE(SF_WE),
			.SF_BYTE(SF_BYTE)
		);
		
//	dma dma_controller (
//		.clk(clk),
//		.rst(rst),
//		.src_addr(rom_addr),
//		.load_rom(rom_load),
//		.src_data(rom_data),
//		.ready(rom_ready),
//		// memory interface
//		.dst_addr(dma_memaddr),
//		.dst_write(dma_memwrite),
//		.dst_data(dma_writedata),
//		.proc_en(proc_en),
//		// system interface
//		.en(dma_en),
//		.write(memwrite),
//		.wr_mode(dma_mode),
//		.ctrl_data(writedata)
//	);
	
	nes_zap gameinput_neszap (
		.clk(clk),
		//.en(vsync), 
		.rst(rst),
		.sensor(sensor),
		.trigger(trigger), 
		.plyr_input(plyrb_input)
	);
	
	snes_cont gameinput_snescont (
		.clk(clk),
		.en(vsync), 
		.rst(rst),
		.latch(latch),
		.pulse(pulse), 
		.data(data),
		.plyr_input(plyra_input)
	);
endmodule
