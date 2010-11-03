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
   wire [9:0] x;
   wire [9:0] y;
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
   wire pcAddrSrc;
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
   
   alu_schematic  alu (.aluSrcA(aluSrcA), 
                      .aluSrcB(aluSrcB), 
                      .clk(clk), 
                      .cond(cond[3:0]), 
                      .dst_addr(dst_addr[3:0]), 
                      .func(func[3:0]), 
                      .Immediate(Immediate[7:0]), 
                      .memdata(memdata[15:0]), 
                      .oper(oper[3:0]), 
                      .pcAddrSrc(pcAddrSrc), 
                      .pcSrc(pcSrc), 
                      .pcWrite(pcWrite), 
                      .regsrc(regsrc[1:0]), 
                      .regwrite(regwrite), 
                      .rst(rst), 
                      .signExtImm(signExtImm), 
                      .src_addr(src_addr[3:0]), 
                      .memaddr(memaddr[15:0]), 
                      .pcaddr(pcaddr[15:0]), 
                      .writedata(writedata[15:0]));
   controller  control (.clk(clk), 
                       .instruction(instruction[15:0]), 
                       .rst(rst), 
                       .alusrca(aluSrcA), 
                       .alusrcb(aluSrcB), 
                       .cond(cond[3:0]), 
                       .dstaddr(dst_addr[3:0]), 
                       .func(func[3:0]), 
                       .immediate(Immediate[7:0]), 
                       .memwrite(memwrite), 
                       .oper(oper[3:0]), 
                       .pcaddrsrc(pcAddrSrc), 
                       .pcsrc(pcSrc), 
                       .pcwrite(pcWrite), 
                       .regsrc(regsrc[1:0]), 
                       .regwrite(regwrite), 
                       .sign_ext_imm(signExtImm), 
                       .srcaddr(src_addr[3:0]));
   gpu_schematic  gpu (.brightness(brightness[7:0]), 
                      .clk(clk), 
                      .line_start(line_start), 
                      .memwrite(memwrite), 
                      .palette_data(), 
                      .palette_wrindex(), 
                      .palette_write(), 
                      .rst(rst), 
                      .sprite_addr(sprite_addr[9:0]), 
                      .sprite_memenable(sprite_memenable), 
                      .sprite_priority(sprite_priority[6:0]), 
                      .tile_addr(tile_addr[12:0]), 
                      .tile_memenable(tile_memenable), 
                      .vlookahead(vlookahead), 
                      .writedata(writedata[15:0]), 
                      .x(x[9:0]), 
                      .y(y[9:0]), 
                      .R(R[7:0]), 
                      .G(G[7:0]), 
                      .B(B[7:0]), 
                      .sprite_memdata(sprite_memdata[15:0]), 
                      .tile_memdata(tile_memdata[15:0]));
   memory_controller  memory (.clk(clk), 
                             .hbright(hbright), 
                             .memaddr(memaddr[15:0]), 
                             .memwrite(memwrite), 
                             .pcaddr(pcaddr[15:0]), 
                             .rst(rst), 
                             .sprite_object_data(sprite_memdata[15:0]), 
                             .tile_data(tile_memdata[15:0]), 
                             .vbright(vbright), 
                             .writedata(writedata[15:0]), 
                             .brightness(brightness[7:0]), 
                             .instruction(instruction[15:0]), 
                             .memdata(memdata[15:0]), 
                             .sprite_object_addr(sprite_addr[9:0]), 
                             .sprite_object_enable(sprite_memenable), 
                             .sprite_priority(sprite_priority[6:0]), 
                             .tile_data_addr(tile_addr[12:0]), 
                             .tile_data_enable(tile_memenable));
   vga  vga_ctrl (.clk(clk), 
                 .rst(rst), 
                 .bright(bright), 
                 .hbright(hbright), 
                 .hsync(hsync), 
                 .line_start(line_start), 
                 .vbright(vbright), 
                 .vlookahead(vlookahead), 
                 .vsync(vsync), 
                 .x(x[9:0]), 
                 .y(y[9:0]));
endmodule
