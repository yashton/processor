`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:03:56 10/21/2010 
// Design Name: 
// Module Name:    aluController 
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
module aluController(
    input [3:0] oper,
    input [3:0] func,
    input [3:0] cond,
    output [2:0] aluCont
    );
	 
	 // aluCont table
	 // 000 = +
	 // 001 = -
	 // 010 = *
	 // 011 = &
	 // 100 = |
	 // 101 = ^
	 // 110 = ~
	 // 111 = <<
	 
	 always @(*)
		case(oper)
			4'b0000: case(func)
							4'b0001 aluCont <= 3'b011;
							4'b0010 aluCont <= 3'b100;
							4'b0011 aluCont <= 3'b101;
							4'b0101 aluCont <= 3'b000;
							4'b0110 aluCont <= 3'b000;
							4'b0111 aluCont <= 3'b000;
							4'b1001 aluCont <= 3'b001;
							4'b1010 aluCont <= 3'b001;
							4'b1011 aluCont <= 3'b001;
							4'b1101 aluCont <= 3'b111;
							4'b1110 aluCont <= 3'b111;


endmodule
