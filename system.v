`timescale 1ns / 1ps

module system
	(
   input clk,
   input rst,
   output bright, hsync, vsync,
   output [7:0] R, G, B
  );
   wire hbright;
   wire vbright;
   wire [9:0] x, y;
   wire line_start;
   wire vlookahead;
   wire [15:0] tile_memdata;
   wire [15:0] sprite_memdata;
   wire [7:0] brightness;
   wire [6:0] sprite_priority;
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
   wire [15:0] pcaddr;
   wire [15:0] writedata;
   wire [15:0] memaddr;
   wire memwrite;
   wire palette_memenable;
   wire [15:0] palette_memdata;
   wire [9:0] palette_addr;
   
   alu_schematic  alu (.aluSrcA(aluSrcA), 
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
                      .memaddr(memaddr), 
                      .pcaddr(pcaddr), 
                      .writedata(writedata));
   controller  control (.clk(clk), 
                       .instruction(instruction), 
                       .rst(rst), 
                       .alusrca(aluSrcA), 
                       .alusrcb(aluSrcB), 
                       .cond(cond), 
                       .dstaddr(dst_addr), 
                       .func(func), 
                       .immediate(Immediate), 
                       .memwrite(memwrite), 
                       .oper(oper), 
                       .pcaddrsrc(pcAddrSrc), 
                       .pcsrc(pcSrc), 
                       .pcwrite(pcWrite), 
                       .regsrc(regsrc), 
                       .regwrite(regwrite), 
                       .sign_ext_imm(signExtImm), 
                       .srcaddr(src_addr));
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
                      .palette_memdata(palette_memdata));
   memory_controller  memory (.clk(clk), 
                             .hbright(hbright), 
                             .memaddr(memaddr), 
                             .memwrite(memwrite), 
                             .pcaddr(pcaddr), 
                             .rst(rst), 
                             .sprite_object_data(sprite_memdata), 
                             .tile_data(tile_memdata), 
                             .vbright(vbright), 
                             .writedata(writedata), 
                             .brightness(brightness), 
                             .instruction(instruction), 
                             .memdata(memdata), 
                             .sprite_object_addr(sprite_addr), 
                             .sprite_object_enable(sprite_memenable), 
                             .sprite_priority(sprite_priority), 
                             .tile_data_addr(tile_addr), 
                             .tile_data_enable(tile_memenable),
                             .palette_enable(palette_memenable),
                             .palette_addr(palette_addr),
                             .palette_data(palette_memdata));
   vga  vga_ctrl (.clk(clk), 
                 .rst(rst), 
                 .bright(bright), 
                 .hbright(hbright), 
                 .hsync(hsync), 
                 .line_start(line_start), 
                 .vbright(vbright), 
                 .vlookahead(vlookahead), 
                 .vsync(vsync), 
                 .x(x), 
                 .y(y));
endmodule
