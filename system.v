`timescale 1ns / 1ps

module system
	(
		input clk,
		input rst,
		// VGA
		output bright, hsync, vsync,
		output [7:0] R, G, B,
		// physical switches
		input [7:0] switches,
		// rotary encoder
		input rot_a,
		input rot_b,
		// StrataFlash ROM
		input [15:1] SF_D,
		input SPI_MISO_SF_D0,
		output [23:0] SF_A,
		output SF_CE0,
		output SF_OE,
		output SF_WE,
		output SF_BYTE
	);
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
	wire [3:0] dst_addr;
	wire [3:0] src_addr;
	wire [1:0] regsrc;
	wire regwrite;
	wire aluSrcA;
	wire aluSrcB;
	wire pcWrite;
	wire pcSrc;
	wire [1:0] pcAddrSrc;
	wire [3:0] oper;
	wire [3:0] func;
	wire [3:0] cond;
	wire [7:0] Immediate;
	wire signExtImm;
	wire [15:0] memdata;
	wire [15:0] instruction;
	wire proc_en;
	wire [15:0] pcaddr;
	wire [15:0] writedata;
	wire [15:0] memaddr;
	wire memwrite;
	wire [15:0] proc_writedata;
	wire [15:0] proc_memaddr;
	wire proc_memwrite;
	
	wire palette_memenable;
	wire [15:0] palette_memdata;
	wire [9:0] palette_addr;

	// rotary encoder
	wire [15:0] rot_count;
	wire rot_en;
	
	// DMA controller
	wire dma_en;
	wire [1:0] dma_mode;
	wire [22:0] rom_addr;
	wire [15:0] rom_data;
	wire rom_load;
	wire rom_ready;
	wire [15:0] dma_writedata;
	wire [15:0] dma_memaddr;
	wire dma_memwrite;
	
	alu_schematic  alu (
			.aluSrcA(aluSrcA), 
			.aluSrcB(aluSrcB), 
			.clk(clk), 
			.cond(cond), 
			.dst_addr(dst_addr), 
			.func(func), 
			.Immediate(Immediate), 
			.memdata(memdata), 
			.oper(oper), 
			.pcaddrsrc(pcAddrSrc), 
			.pcSrc(pcSrc), 
			.pcWrite(pcWrite), 
			.regsrc(regsrc), 
			.regwrite(regwrite), 
			.rst(rst), 
			.signExtImm(signExtImm), 
			.src_addr(src_addr), 
			.memaddr(proc_memaddr), 
			.pcaddr(pcaddr), 
			.writedata(proc_writedata)
		);
		
	controller  control (
			.clk(clk), 
		  .instruction(instruction), 
		  .rst(rst), 
		  .en(proc_en),
		  .alusrca(aluSrcA), 
		  .alusrcb(aluSrcB), 
		  .cond(cond), 
		  .dstaddr(dst_addr), 
		  .func(func), 
		  .immediate(Immediate), 
		  .memwrite(proc_memwrite), 
		  .oper(oper), 
		  .pcaddrsrc(pcAddrSrc), 
		  .pcsrc(pcSrc), 
		  .pcwrite(pcWrite), 
		  .regsrc(regsrc), 
		  .regwrite(regwrite), 
		  .sign_ext_imm(signExtImm), 
			.srcaddr(src_addr)
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
		 .palette_memdata(palette_memdata)
		);
		
	assign memaddr = proc_en ? proc_memaddr : dma_memaddr;
	assign memwrite = proc_en ? proc_memwrite : dma_memwrite;
	assign writedata = proc_en ? proc_writedata : dma_writedata;
		
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
			.rot_count(rot_count),
			.rot_en(rot_en),
			.dma_en(dma_en),
			.dma_mode(dma_mode)
	  );
	  
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
			.y(y)
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
		
	romController rom (
			.clk(clk),
			.addr(rom_addr),
			.load(rom_load),
			.data(rom_data),
			.ready(rom_ready),
			.SF_D(SF_D),
			.SF_D0(SPI_MISO_SF_D0),
			.SF_A(SF_A),
			.SF_CE0(SF_CE0),
			.SF_OE(SF_OE),
			.SF_WE(SF_WE),
			.SF_BYTE(SF_BYTE)
		);
		
	dma dma_controller (
		.clk(clk),
		.rst(rst),
		.src_addr(rom_addr),
		.load_rom(rom_load),
		.src_data(rom_data),
		.ready(rom_ready),
		// memory interface
		.dst_addr(dma_memaddr),
		.dst_write(dma_memwrite),
		.dst_data(dma_writedata),
		.proc_en(proc_en),
		// system interface
		.en(dma_en),
		.write(memwrite),
		.wr_mode(dma_mode),
		.ctrl_data(writedata)
	);
		
endmodule
