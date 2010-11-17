`timescale 1ns / 1ps

module processor
	(
		input clk,
		input rst,
		input en,
		output [15:0] pcaddr,
		input [15:0] instruction,
		output [15:0] memaddr,
		input [15:0] memdata,
		output [15:0] writedata,
		output memwrite
	);

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
			.memaddr(memaddr), 
			.pcaddr(pcaddr), 
			.writedata(writedata)
		);
		
	controller  control (
			.clk(clk), 
		  .instruction(instruction), 
		  .rst(rst), 
		  .en(en),
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
			.srcaddr(src_addr)
		);	
endmodule
