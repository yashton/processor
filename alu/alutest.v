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
	reg sign_ext_imm;

	// Outputs
	wire [15:0] given;
	wire c, l, f, z, n;

	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.dst(dst), 
		.src(src), 
		.oper(oper), 
		.func(func), 
		.cond(cond), 
		.sign_ext_imm(sign_ext_imm), 
		.result(given)
	);
	
	wire [15:0] sum, sumc, mult, sub, subc, band, bor, bxor, passthrough, sll, srl, sar, sal, lsh, ashu, scond, bcond, jcond, bnot, test;
	
	assign sum = dst + src;
	assign sumc = dst + src + c;
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
	assign bcond = Condition ? (dst + src): dst;
	assign jcond = Condition ? src : dst;
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
		if (oper == 4'b0000)
		begin
			if( func == 4'b0101 || func == 4'b0110)
				result = sum;
			else if (func == 4'b0111)
				result = sumc;
			else if (func == 4'b1110)
				result = mult;
			else if (func == 4'b1011 ||func == 4'b1011)
				result = sub;
			else if (func == 4'b1010)
				result = subc;
			else if (func == 4'b0001 || func == 4'b1111)
				result = band;
			else if (func == 4'b0010)
				result = bor;
			else if (func == 4'b0011)
				result = bxor;
			else if (func == 4'b1101)
				result =passthrough;
			else if (func == 4'b0100)
				result = bnot;
			else
				result = 0;
		end
		else if (oper == 4'b0001)
			result = band;
		else if (oper == 4'b0010)
			result = bor;
		else if (oper == 4'b0011)
			result = bxor;
		else if (oper == 4'b0100)
		begin
			if( func == 4'b1000)
				result = passthrough;
			else if (func == 4'b1100)
				result = jcond;
			else
				result = 0;
		end
		else if (oper == 4'b0101)
			result = sum;
		else if (oper == 4'b0110)
			result = sum;
		else if (oper == 4'b0111)
			result = sumc;
		else if (oper == 4'b1000)
		begin
			if (func == 4'b0000)
				result = sll;
			else if (func == 4'b0001)
				result = srl;
			else if (func == 4'b0010)
				result = sal;
			else if (func == 4'b0011)
				result = sar;
			else if (func == 4'b0100)
				result = lsh;
			else if (func == 4'b0110)
				result = ashu;
			else
				result = 0;
		end
		else if (oper == 4'b1001)
			result = sub;
		else if (oper == 4'b1010)
			result = subc;
		else if (oper == 4'b1011)
			result = sub;
		else if (oper == 4'b1100)
			result = bcond;
		else if (oper == 4'b1101)
			result = passthrough;
		else if (oper == 4'b1110)
			result = mult;
		else // if (oper == 4'b1111)
			result = lui;
	end
   
	reg clk;
	always @(*) begin
		#5 clk = 0; #5 clk = 1; 
	end

	integer h, i, j, k, x, y;
	always @(posedge clk) begin
		for (i = 0; i < 16; i = i + 1) begin
			oper = i[3:0];
			if (oper == 4'b0000) begin // register operations
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
			else if (oper == 4'b0100)
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
			else if (oper == 4'b1000)
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
			else if (oper == 4'b1100)
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

