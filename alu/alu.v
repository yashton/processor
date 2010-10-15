`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Team Blue
// 
// Design Name: Arithmetic logic unit
// Module Name: alu
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module alu
	(
		input [15:0] dst,
		input [15:0] src,
		input [3:0] oper,
		input [3:0] func,
		input [3:0] cond,
		input sign_ext_imm,
		output [15:0] result
	);
	
	reg [15:0] psr;
endmodule
