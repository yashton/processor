`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:58:43 10/19/2010
// Design Name:   alu
// Module Name:   //wannsee/Users/u0527893/My Documents/3710/Lab3.1/aluTestbench/alutest.v
// Project Name:  aluTestbench
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alutest;

	// Inputs
	reg [15:0] dst;
	reg [15:0] src;
	reg [3:0] oper;
	reg [3:0] func;
	reg [3:0] cond;
	wire [4:0] condIn;
	reg [4:0] condOut;
	reg condWr;
	
	//operation codes
	parameter register = 4'b0000, andi = 4'b0001, ori= 4'b0010, xori= 4'b0011, special= 4'b0100, addi= 4'b0101, addui= 4'b0110;
	parameter addci= 4'b0111, shift= 4'b1000, subi= 4'b1001, subci= 4'b1010, cmpi= 4'b1011, bcond= 4'b1100, movi= 4'b1101, muli= 4'b1110, lui= 4'b1111;

	//shift function codes
	parameter lshil = 4'b0000, lshir = 4'b0001, ashuil= 4'b0010, ashuir= 4'b0011, lsh= 4'b0100, ashu= 4'b0110;

	//registers
	parameter fand = 4'b0001, fuor= 4'b0010, fxor= 4'b0011, fnot= 4'b0100, fadd= 4'b0101, faddu= 4'b0110;
	parameter faddc= 4'b0111, fsub= 4'b1001, fsubc= 4'b1010, fcmp= 4'b1011, fmov= 4'b1101, fmul= 4'b1110, ftest= 4'b1111;
	
	//special
	parameter load = 4'b0000, stor = 4'b0100, jal= 4'b1000, jcond= 4'b1100, scond= 4'b1101;
	
	// Outputs
	wire [15:0] given;
	wire c, l, f, z, n;
	
	assign condIn = {c,l,f,z,n};
	
	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.dst(dst), 
		.src(src), 
		.oper(oper), 
		.func(func), 
		.cond(cond),
		.condIn(condIn),
		.condOut(condOut),
		.condWr(condWr)'
		.result(given)
	);
	
	wire [15:0] sum, sumc, mult, sub, subc, band, bor, bxor, passthrough, sll, srl, sar, sal, lsh, ashu, scond, bcond, jcond, bnot, test;
	wire ccr, cr;
	
	assign {cr,sum} = dst + src;
	assign {ccr,sumc} = dst + src + c;
	assign mult = dst * src;
	assign sub = dst - src;
	assign sub = dst - src - c;
	assign band = dst & src;
	assign bor = dst | src;
	assign bxor = dst ^ src;
	assign passthrough = src;
	assign sll = dst << src[3:0];
	assign srl = dst >> -(src[4:0]);
	assign sal = dst << src[3:0];
	assign sar = dst >> -(src[4:0]) | {-(src[4:0]){dst[15]}} << 16 - (-(src[4:0]));
	assign lsh = src[15] ? sll : srl;
	assign ashu = src[15] ? sal : sar;
	assign scond = condition ? 1:0;
	assign bcond = condition ? (dst + src): dst;
	assign jcond = condition ? src : dst;
	assign bnot = ~dst;
	assign lui = (dst << 8) || src[7:0];

	always @(*)
	begin
		case (cond)
			0:
				condition = z;
			1:
				condition = !z;
			2:
				condition = c;
			3:
				condition = !c;
			4:
				condition = l;
			5:
				condition = !l;
			6:
				condition = n;
			7:
				condition = !n;
			8:
				condition = f;
			9:
				condition = !f;
			10:
				condition = !l & !z;
			11:
				condition = l | z;
			12:
				condition = !n & !z;
			13:
				condition = n | z;
			14:
				condition = 1;
			15:
				condition = 0;		
		endcase
	end
	initial begin
		// Initialize Inputs
		dst = 0;
		src = 0;
		oper = 0;
		func = 0;
		cond = 0;
		sign_ext_imm = 0;
		
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
	
	reg [15:0] result;
	
	
	always @(*)
	begin
		if (oper == register)
		begin
			if( func == fadd || func == faddu)
				result = sum;
			else if (func == faddc)
				result = sumc;
			else if (func == fmul)
				result = mult;
			else if (func == fcmp ||func == fsub)
				result = sub;
			else if (func == fsubc)
				result = subc;
			else if (func == fand || func == ftest)
				result = band;
			else if (func == fuor)
				result = bor;
			else if (func == fxor)
				result = bxor;
			else if (func == fmov)
				result =passthrough;
			else if (func == fnot)
				result = bnot;
			else
				result = 0;
		end
		else if (oper == andi)
			result = band;
		else if (oper == ori)
			result = bor;
		else if (oper == xori)
			result = bxor;
		else if (oper == special)
		begin
			if( func == jal)
				result = passthrough;
			else if (func == jcond)
				result = jcond;
			else
				result = 0;
		end
		else if (oper == addi)
			result = sum;
		else if (oper == addui)
			result = sum;
		else if (oper == addci)
			result = sumc;
		else if (oper == shift)
		begin
			if (func == lshil)
				result = sll;
			else if (func == lshir)
				result = srl;
			else if (func == ashuil)
				result = sal;
			else if (func == ashuir)
				result = sar;
			else if (func == lsh)
				result = lsh;
			else if (func == ashui)
				result = ashu;
			else
				result = 0;
		end
		else if (oper == subi)
			result = sub;
		else if (oper == subci)
			result = subc;
		else if (oper == cmpi)
			result = sub;
		else if (oper == bcond)
			result = bcond;
		else if (oper == movi)
			result = passthrough;
		else if (oper == muli)
			result = mult;
		else // if (oper == lui)
			result = lui;
	end
   
	wire zr, fr, lr, nr;
	assign zr = result == 0;
	assign fr = result == 0;
	assign lr = dst < src;
	assign nr = result[15] == 1;
	
	always @(*)
	begin
		if (oper == register)
		begin
			if( func == fadd)
				c_result = {cr, 1'b0, fr, zr, nr};	
			else if(func == faddc)
				c_result = {ccr, 1'b0, fr, zr, nr};
			else if (func == fcmp ||func == fsub)
				c_result = {1'b0, lr, 1'b0, zr, nr};
			else if (func == fand || func == ftest  || func = fuor || func == fxor || func == fnot)
				c_result = {3'b0, zr, 1'b0};
			else
				c_result = 0;
		end
		else if (oper == andi || oper == ori  || oper == xori)
			c_result = {3'b0, zr, 1'b0};
		else if (oper == addi)
			c_result = {cr, 1'b0, fr, zr, nr};
		else if (oper == addci)
			c_result = {ccr, 1'b0, fr, zr, nr};
		else if (oper == cmpi)
			c_result = {1'b0, lr, 1'b0, zr, nr};
		else 
			c_result = 0;
	end
	
	reg clk;
	always @(*) begin
		#5 clk = 0; #5 clk = 1; 
	end

	integer h, i, j, k, x, y;
	always @(posedge clk) begin
		for (i = 0; i < 16; i = i + 1) begin
			oper = i[3:0];
			if (oper == register) begin // register operations
				for (j = 0; j < 16; j = j + 1) begin
					func = j[3:0];
					if (func != 4'b0000 && func != 4'b1000 && func != 4'b1100) begin
						for (x = 0; x < 2**16; x = x + 43) begin
							dst = x[15:0]
							for (y = 0; y < 2**16; y = y + 23) begin
								src = n[15:0]; #5;
								if (given != result) begin
									$display("Actual result did not equal expected result.");
								end
							end
						end
					end
				end
			end 
			else if (oper == special)
				for (j = 0; j < 16; j = j + 1) begin
					func = j[3:0];
					if (func == 4'b1000 || func == 4'b1101 || func == 4'b1100) begin
						for (k = 0; k < 16; k = k + 1) begin
							cond = k[3:0]
							for (h = 0; h < 16; h = h + 1) begin
								{c,f,z,n,l} = h[4:0];
								for (x = 0; x < 2**16; x = x + 43) begin
									dst = x[15:0]
									for (y = 0; y < 2**16; y = y + 23) begin
										src = y[15:0]; #5;
										if (given != result) begin
											$display("Actual result did not equal expected result.");
										end
									end
								end
							end
						end
					end
				end
			else if (oper == shift)
				for (j = 0; j < 16; j = j + 1) begin
					func = j[3:0];
					if (func == 4'b0000 || func != 4'b0001 || func != 4'b0010 || func != 4'b0011 || func != 4'b0100 || func != 4'b0110) begin
						for (x = 0; x < 2**16; x = x + 43) begin
							dst = x[15:0]
							for (y = 0; y < 300; y = y + 1) begin
								src = y[15:0]; #5;
								if (given != result) begin
									$display("Actual result did not equal expected result.");
								end
							end
						end
					end
				end
			else if (oper == bcond)
				for (j = 0; j < 16; j = j + 1) begin
					func = j[3:0];
					if (func == 4'b0000 || func != 4'b0001 || func != 4'b0010 || func != 4'b0011 || func != 4'b0100 || func != 4'b0110) begin
						for (k = 0; k < 16; k = k + 1) begin
							cond = k[3:0]
							for (h = 0; h < 16; h = h + 1) begin
								{c,f,z,n,l} = h[4:0];
								for (x = 0; x < 2**16; x = x + 113) begin
									dst = x[15:0]
									for (y = 0; y < 2**16; y = y + 23) begin
										src = y[15:0]; #5;
										if (given != result) begin
											$display("Actual result did not equal expected result.");
										end
									end
								end
							end
						end
					end
				end
			else begin
				for (m = 0; m < 2**16; m = m + 213) begin
					dst = m[15:0]
					for (n = 0; n < 2**16; n = n + 47) begin
						src = n[15:0]; #5;
						if (given != result) begin
							$display("Actual result did not equal expected result.");
						end
					end
				end
			end
			// set cond, condition codes, oper, and func
			// set dst, src
			// compare given with result.
		end
	end
endmodule

