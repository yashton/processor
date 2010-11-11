	
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
	#(parameter WIDTH = 16)
	(
		input [WIDTH-1:0] dst,
		input [WIDTH-1:0] src,
		input [3:0] oper,
		input [3:0] func,
		input [3:0] cond,
		input [4:0] psrRead,
		output [4:0] psrWrEn,
		output [4:0] psrWrite,
		output reg [WIDTH-1:0] result
	);
	wire [4:0] ctrl;
	aluController aluctrl (oper, func, ctrl, psrWrEn);

	 // aluCont table
	 // 00000 = dst + src
	 // 00001 = dst - src
	 // 00010 = dst * src
	 // 00011 = dst & src
	 // 00100 = dst | src 
	 // 00101 = dst ^ src
	 // 00110 = dst ~ src
	 // 00111 = 1 if condition is true, 0 if false (condition code stored in src[3:0])(Scond)	
	 // 01000 = src mov,movi,jal
	 // 01001 = Dst << 8|src (LUI)  
	 // 01010 = ~dst			(NOT)
	 // 01011 = Amt = -src; Src < 0 ? Dst >> amt[3:0] : Dst << Src[3:0] (LSH)
	 //correction Amt = -src; src<0 ? dst<< amt[3:0] : dst << 
	 // 01100 = Dst << Src[3:0] (LSHI Left & ASHUI Left)
	 // 01101 = Dst >> -Src[4:0] (LSHI Right)
	 // 01110 = Amt = -src; Src < 0 ? (Dst >> Src[3:0]) | ({amt{Dst[15]}} << (16-amt)) : Dst << Src [3:0] (ASHU)
	 // 01111 = amt = -Src[4:0]; (Dst >> amt) | ({amt{Dst[15]}} << (16-amt)) (ASHUI Right)
	 // 10000= cond ? Dst + src : Dst (Bcond)
	 // 10001= cond ? Src : Dst (Jcond)
	 // CONDITION codes
	localparam EQ = 0, NE = 1, CS = 2, CC = 3, HI = 4, LS = 5, GT = 6, LE = 7;
	localparam FS = 8, FC = 9, LO = 10, HS = 11, LT = 12, GE = 13, UC = 14;

	wire [WIDTH-1:0]  lsh, rsh;//, sumc;
	reg [WIDTH-1:0] sumc;
	wire [4:0] amt;
	reg cr, car;  
	reg condition;
	wire c, l, f, z, n;
	assign {c,l,f,z,n} = psrRead;
	always @(*) begin
		case (cond)
			EQ: condition = z;
			NE: condition = !z;
			CS: condition = c;
			CC: condition = !c;
			HI: condition = l;
			LS: condition = !l;
			GT: condition = n;
			LE: condition = !n;
			FS: condition = f;
			FC: condition = !f;
			LO: condition = !l & !z;
			HS: condition = l | z;
			LT: condition = !n & !z;
			GE: condition = n | z;
			UC: condition = 1;
			default: condition = 0;
		endcase
	end
	
	
	assign amt 	= -(src[4:0]); //shift amount for right shift
	assign lsh 	= dst<<src[3:0];
	assign rsh 	= dst>>amt[3:0];

	always@(*) begin			
			if ( ( ((oper == 4'b0111)  || ((oper==4'b0000)&&(func == 4'b0111))) )
				||( ((oper == 4'b1010)  || ((oper==4'b0000)&&(func == 4'b1010))) ) )
			begin
				car <= psrRead[4];
			end
			else begin
				car <= 0;
			end
		end
		 
	always@(*)begin
				if (!ctrl[0]) begin
					{cr, sumc} <= dst + src + ctrl[0] + car;
				end 
				else begin				
					{cr, sumc} <= dst + ~src + ctrl[0] - car;
				end
	end
		
	always@(*) begin
		case(ctrl)
			5'b00000:
				result <= sumc;
			5'b00001: 
				result <= sumc;
			5'b00010: result <= dst*src;
			5'b00011: result <= dst&src;
			5'b00100: result <= dst|src;
			5'b00101: result <= dst^src;
			//5'b00110:
			5'b00111: result <= condition;
			5'b01000: result <= src;
			5'b01001: result <= {src[7:0],dst[7:0]};
			5'b01010: result <= ~dst;	
			5'b01011: result <= (src < 0) ? rsh : lsh; 
			5'b01100: result <= lsh;
			5'b01101: result <= rsh;
			5'b01110: result <= (src<0) ? dst>>>amt : lsh;
			5'b01111: result <= dst >>> amt[4:0];
	 // 10000= cond ? Dst + src : Dst (Bcond)
			5'b10000: result <= condition ? dst+src:dst;
	 // 10001= cond ? Src : Dst (Jcond)
			5'b10001: result <= condition ? src:dst;
			default: result <= 0;
		endcase
	end
	
	// psrWrite = CLFZN
	assign psrWrite[1] = (result == 15'b0);
	assign psrWrite[0] = result[15];
	assign psrWrite[3] = result[15];
	assign psrWrite[4] = cr;
	assign psrWrite[2] = (dst[15] & src[15] & !result[15])
			|(!dst[15] & !src[15] & result[15]);

endmodule

