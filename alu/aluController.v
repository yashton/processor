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
    output [4:0] aluCont,
	 output [4:0] psrWrEn
    );
	 
	 reg [4:0] aluContReg;
	 reg [4:0] psrEn;
	 
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
	 // psrEn = CLFZN
	 
	 always @(*)
		case(oper)
			4'b0000: // Register: boolean and arithmetic operations
				case(func)
					4'b0001:begin  // logical and
							aluContReg <= 5'b00011;
							psrEn  <= 5'b00010;
						end
					4'b0010: begin // logical or
							aluContReg <= 5'b00100; 
							psrEn  <= 5'b00010;
						end
					4'b0011: begin // logical xor
							aluContReg <= 5'b00101; 
							psrEn  <= 5'b00010;
						end
					4'b0100: begin // not
							aluContReg <= 5'b01010;
							psrEn  <= 5'b00010;
						end
					4'b0101: begin // add (for add)
							aluContReg <= 5'b00000; 
							psrEn  <= 5'b10111; 
						end
					4'b0110: begin // add (for addc)
							aluContReg <= 5'b00000; 
							psrEn  <= 5'b10111; 
						end
					4'b0111: aluContReg <= 5'b00000; // add (for addu)
					4'b1001:  begin // sub (for sub)
							aluContReg <= 5'b00001;
							psrEn  <= 5'b10111; 
						end
					4'b1010: begin// sub (for subc)
							aluContReg <= 5'b00001;
							psrEn  <= 5'b10111; 
						end
					4'b1011: begin // sub (for cmp)
							aluContReg <= 5'b00001;
							psrEn  <= 5'b01011; 
						end
					4'b1101: aluContReg <= 5'b01000; // mov
					4'b1110: aluContReg <= 5'b00010; // mul
					4'b1111: begin // dst & src (for test)
							 aluContReg <= 5'b00011; 
							 psrEn  <= 5'b00010;
						end
					default: aluContReg <= 5'b00000; // don't care
				endcase
			4'b0100:  // Special: loads, stores, tests, jumps
				case(func)
					4'b1000: aluContReg <= 5'b01000; // JAL
					4'b1100: aluContReg <= 5'b10001; // jcond
					4'b1101: aluContReg <= 5'b00111; // scond
					default: aluContReg <= 5'b00000; // don't care
				endcase
			4'b1000: // Shift
				case(func)
					4'b0000: aluContReg <= 5'b01100; // LSHI left
					4'b0001: aluContReg <= 5'b01101; // LSHI right
					4'b0010: aluContReg <= 5'b01100; // ASHUI left
					4'b0011: aluContReg <= 5'b01111; // ASHUI right
					4'b0100: aluContReg <= 5'b01011; // LSH
					4'b0110: aluContReg <= 5'b01110; // ASHU
					default: aluContReg <= 5'b00000; // don't care
				endcase
			4'b1100: aluContReg <= 5'b10000; // Bcond
			4'b0001: begin // logical andi
					aluContReg <= 5'b00011; 
					psrEn  <= 5'b00010;
				end
			4'b0010: begin // logical ori
					aluContReg <= 5'b00100;
					psrEn  <= 5'b00010;
				end
			4'b0011: begin // logical xori
					aluContReg <= 5'b00101; 
					psrEn  <= 5'b00010;
				end
			4'b0101: begin // add (for addi)
					aluContReg <= 5'b00000; 
					psrEn  <= 5'b10111; 
				end
			4'b0110: begin // add (for addci)
					aluContReg <= 5'b00000; 
					psrEn  <= 5'b10111; 
				end			
			4'b0111: aluContReg <= 5'b00000; // add (for addui)
			4'b1001: begin // sub (for subi)
					aluContReg <= 5'b00001;
					psrEn  <= 5'b10111; 
				end
			4'b1010: begin // sub( for subci)
					aluContReg <= 5'b00001;
					psrEn  <= 5'b10111; 
				end
			4'b1011: begin // sub (for cmpi)
					aluContReg <= 5'b00001;
					psrEn  <= 5'b01011; 
				end
			4'b1101: aluContReg <= 5'b01000; // movi
			4'b1110: aluContReg <= 5'b00010; // muli
			4'b1111: aluContReg <= 5'b01001; // LUI
			default: aluContReg <= 5'b00000; // don't care
		endcase
		
		assign aluCont = aluContReg;
		assign psrWrEn = psrEn;
		
		
endmodule
