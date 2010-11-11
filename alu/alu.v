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
module alu#(parameter WIDTH = 16)
	(
		input [WIDTH-1:0] dst,
		input [WIDTH-1:0] src,
		input [3:0] oper,
		input [3:0] func,
		input [3:0] cond,
		input [4:0] psrRead,
		output [4:0] psrWrite,
		output [4:0] psrWrEn,
		output reg [WIDTH-1:0] result
	);
	wire [4:0] ctrl;
	aluController aluctrl (oper, func, cond, ctrl, psrWrEn);

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
	wire [WIDTH-1:0]  amt, lsh, rsh, src2, sum, sumc;
	wire cr, c;  
	assign amt 	= -src; //shift amount for right shift
	assign lsh 	= dst<<src[3:0];
	assign rsh 	= dst>>amt[3:0];

	always@(*) begin			
			if ( ( (ctrl == 5'b00000) && ((oper == 4'b0111)  || (func == 4'b0111)) )
				||((ctrl == 5'b00001) && ((oper == 4'b1010)  || (func == 4'b1010)) ) )
			begin
				c = psrRead[4];
			end
			else begin
				c = 0;
			end
		end
		
	always@(*)begin
				if (!ctrl[0]) begin
					{cr, sumc} <= dst + src + ctrl[0] + c;
				end 
				else begin				
					{cr, sumc} <= dst + ~src + ctrl[0] - c;
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
			5'b00111: result <= (cond[3:0] == src[3:0]);
			5'b01000: result <= src;
			5'b01001: result <= (dst<<8)|src;
			5'b01010: result <= ~dst;	
			5'b01011: result <= (src < 0) ? rsh : lsh;
			5'b01100: result <= lsh;
			5'b01101: result <= rsh;
			5'b01110: result <= (src<0) ? dst>>>amt : lsh;
			5'b01111: result <= dst >>> amt[4:0];
		endcase
	end
	
	// psrWrite = CLFZN
	 if (result == 15'b0)
	 begin
		assign psrWrite[1] = 1;
	 end
	 
	 if (result[15] == 1)
	 begin
		assign psrWrite[0] = 1;
	 end
	 
	 if (result[15] == 1)
	 begin
		assign psrWrite[3] = 1;
	 end
	 
	 assign psr[4] = cr;
	 
	 if(destination[15] & source[15])
	 begin
		assign psr[2] = ! result[15];
	 end
	 if(!destination[15] & ! source[15])
	 begin
		assign psr[2] = result[15];
	 end
	 
endmodule

