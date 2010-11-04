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
    output [4:0] aluCont
	 output [4:0] 
    );
	 
	 // aluCont table
	 // 00000 = dst + src
	 // 00001 = dst - src
	 // 00010 = dst * src
	 // 00011 = dst & src
	 // 00100 = dst | src
	 // 00101 = dst ^ src
	 // 00110 = dst ~ src
	 // 00111 = 1 if condition is true, 0 if false (condition code stored in src[3:0])(Scond)	
	 // 01000 = src 
	 // 01001 = Dst << 8|src (LUI)
	 // 01010 = ~dst
	 // 01011 = Amt = -src; Src < 0 ? Dst >> amt[3:0] : Dst << Src[3:0] (LSH)
	 // 01100 = Dst << Src[3:0] (LSHI Left & ASHUI Left)
	 // 01101 = Dst >> -Src[4:0] (LSHI Right)
	 // 01110 = Amt = -src; Src < 0 ? (Dst >> Src[3:0]) | ({amt{Dst[15]}} << (16-amt)) : Dst << Src [3:0] (ASHU)
	 // 01111 = amt = -Src[4:0]; (Dst >> amt) | ({amt{Dst[15]}} << (16-amt)) (ASHUI Right)
	 // 10000= cond ? Dst + src : Dst (Bcond)
	 // 10001= cond ? Src : Dst (Jcond)
	 
	 
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
