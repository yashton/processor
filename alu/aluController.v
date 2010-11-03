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
			4'b0000: // Register: boolean and arithmetic operations
				case(func)  
					4'b0001: aluCont <= 3'b011; // logical and
					4'b0010: aluCont <= 3'b100; // logical or
					4'b0011: aluCont <= 3'b101; // logical xor
					4'b0101: aluCont <= 3'b000; // add (for add)
					4'b0110: aluCont <= 3'b000; // add (for addc)
					4'b0111: aluCont <= 3'b000; // add (for addu)
					4'b1001: aluCont <= 3'b001; // sub
					4'b1010: aluCont <= 3'b001; // sub (for subc)
					4'b1011: aluCont <= 3'b001; // sub (for cmp)
					4'b1101: aluCont <= 3'b111; // mov
					4'b1110: aluCont <= 3'b111; // mul
					default: aluCont <= 3'b010; // should never happen
				endcase
			4'b0100:  // Special: loads, stores, tests, jumps
				case(func)
					4'b0000: aluCont <= 3'b000;
					default: aluCont <= 3'b000;
				endcase
			4'b1000: aluCont <= 3'b000; // Shift
			4'b1100: aluCont <= 3'b000; // Bcond
			default: aluCont <= 3'b000; // Bcond
		endcase
		


endmodule
