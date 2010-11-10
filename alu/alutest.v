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

	parameter M_DEFAULT = 0, M_COND = 1, M_CARRY = 2, M_SKIP = 3;
	
	// OPERATION codes
	parameter REGISTER = 4'b0000, ANDI = 4'b0001, ORI= 4'b0010, XORI= 4'b0011, SPECIAL= 4'b0100, ADDI= 4'b0101, ADDUI= 4'b0110;
	parameter ADDCI= 4'b0111, SHIFT= 4'b1000, SUBI= 4'b1001, SUBCI= 4'b1010, CMPI= 4'b1011, BCOND= 4'b1100, MOVI= 4'b1101, MULI= 4'b1110, LUI= 4'b1111;

	// SHIFT function codes
	parameter LSHI_L = 4'b0000, LSHI_R = 4'b0001, ASHUI_L= 4'b0010, ASHUI_R= 4'b0011, LSH= 4'b0100, ASHU= 4'b0110;
	
	// REGISTER function codes
	parameter F_AND = 4'b0001, F_OR= 4'b0010, F_XOR= 4'b0011, F_NOT= 4'b0100, F_ADD= 4'b0101, F_ADDU= 4'b0110;
	parameter F_ADDC= 4'b0111, F_SUB= 4'b1001, F_SUBC= 4'b1010, F_CMP= 4'b1011, F_MOV= 4'b1101, F_MUL= 4'b1110, F_TEST= 4'b1111;
	
	// SPECIAL function codes.
	parameter LOAD = 4'b0000, STORE = 4'b0100, JAL= 4'b1000, JCOND= 4'b1100, SCOND= 4'b1101;

	// CONDITION codes
	parameter EQ = 0, NE = 1, CS = 2, CC = 3, HI = 4, LS = 5, GT = 6, LE = 7;
	parameter FS = 8, FC = 9, LO = 10, HS = 11, LT = 12, GE = 13, UC = 14;

	// CONTROL codes
	parameter C_ADD = 0, C_MULT = 1, C_SUB = 2, C_AND = 3, C_OR = 4, C_XOR = 5, C_PASS = 6, C_SLL = 7;
	parameter C_SRL = 8, C_SAR = 9, C_LSH = 10, C_ASHU = 11, C_SCOND = 12, C_JUMP = 13, C_NOT = 14, C_LUI = 15;
	
	// Inputs
	reg [15:0] dst;
	reg [15:0] src;
	wire [3:0] oper;
	wire [3:0] func;
	wire [3:0] cond;
	wire [4:0] condIn;
	
	// Outputs
	wire [15:0] uut_result, mock_result;
	wire [4:0] uut_condOut, mock_condOut;
	wire [4:0] uut_condWr, mock_condWr;
	
	// Instantiate the Unit Under Test (UUT)
	alu uut (
		.dst(dst), 
		.src(src), 
		.oper(oper), 
		.func(func), 
		.cond(cond),
		.condIn(psrRead),
		.condOut(uut_psrWrite),
		.condWr(uut_psrWrEn),
		.result(uut_result)
	);
	
	alu_mockup uut(
		.dst(dst), 
		.src(src), 
		.oper(oper), 
		.func(func), 
		.cond(cond),
		.condIn(condIn),
		.condOut(mock_condOut),
		.condWr(mock_condWr),
		.result(mock_result)
	);

	
	reg clk;
	initial begin
		clk = 0;
	end
	
	always @(*) begin
		#10 clk = ~clk; 
	end
	
	// Every clock edge, generate two random inputs.
	always @(posedge clk) begin
		dst <= $random();
		src <= $random();
	end

	// There are four modes
	// M_COND for operations that use a condition
	// M_CARRY for addition and subtraction with carry
	// M_DEFAULT for other operations
	// M_SKIP for unused operations and don't cares.
	reg [1:0] mode;
	always @(*) begin
		if (oper == BCOND || (oper == SPECIAL && (func == JCOND || func == SCOND))) begin
			mode <= M_COND;
		end
		else if (oper == ADDCI || oper == SUBCI || (oper == REGISTER && (func == F_ADDC || func == F_SUBC))) begin
			mode <= M_CARRY;
		end
		else if (oper[1:0] != 2'b00 
			|| (oper == REGISTER && (func[1:0] != 2'b00 || func == F_NOT)) 
			|| (oper == SPECIAL && func == JAL)
			|| (oper == SHIFT && (func[3:2] == 2'b00 || func == LSH || func == ASHU))) begin
			mode <= M_DEFAULT;
		end
		else begin
			mode <= M_SKIP;
		end
	end

	integer i;
	reg [7:0] code;
	assign {oper, func} = code;
	reg [8:0] condCode;
	assign {cond, condIn} = condCode;
	always @(posedge clk) begin
		// For every non-skip operation, do 2048 tests.
		if (mode == M_SKIP || i > 2048) begin
			i <= 0;
			code <= code + 1;
		end
		else begin
			i <= i + 1;
		end
		
		if (mode == M_CARRY) begin
			condCode <= i[0] ? 16 : 0; // toggle the C flag if doing Carry operations
		end
		else begin
			condCode <= i;
		end
	end

	always @(posedge clk) begin
		// At every clock edge, for non-skip operations, compare results.
		if (mode != M_SKIP) begin
			if (uut_result != mock_result) begin
				$display("UUT result did not equal expected result.\nuut_result: %h mock_result: %h oper: %b func: %b cond: %b condIn: %b\n",
					uut_result, mock_result, oper, func, cond, condIn);
			end
			if (uut_condWr != uut_condWr) begin
				$display("UUT PSR write signal did not equal expected value.\nuut_condWr: %b mock_condWr: %b oper: %b func: %b cond: %b\n",
					uut_condWr, mock_condWr, oper, func, cond);
			end
			if (uut_condOut != uut_condWr) begin
				$display("UUT PSR output did not equal expected value.\nuut_condWr: %b mock_condWr: %b oper: %b func: %b cond: %b\n",
					uut_condOut, mock_condOut, oper, func, cond);
			end
		end
	end
endmodule

module alu_mockup
	(
		input [15:0] dst,
		input [15:0] src,
		input [3:0] oper,
		input [3:0] func,
		input [3:0] cond,
		input [4:0] condIn,
		output [4:0] condWr,
		output [4:0] condOut,
		output reg [15:0] result
	);
	
	// OPERATION codes
	parameter REGISTER = 4'b0000, ANDI = 4'b0001, ORI= 4'b0010, XORI= 4'b0011, SPECIAL= 4'b0100, ADDI= 4'b0101, ADDUI= 4'b0110;
	parameter ADDCI= 4'b0111, SHIFT= 4'b1000, SUBI= 4'b1001, SUBCI= 4'b1010, CMPI= 4'b1011, BCOND= 4'b1100, MOVI= 4'b1101, MULI= 4'b1110, LUI= 4'b1111;

	// SHIFT function codes
	parameter LSHI_L = 4'b0000, LSHI_R = 4'b0001, ASHUI_L= 4'b0010, ASHUI_R= 4'b0011, LSH= 4'b0100, ASHU= 4'b0110;
	
	// REGISTER function codes
	parameter F_AND = 4'b0001, F_OR= 4'b0010, F_XOR= 4'b0011, F_NOT= 4'b0100, F_ADD= 4'b0101, F_ADDU= 4'b0110;
	parameter F_ADDC= 4'b0111, F_SUB= 4'b1001, F_SUBC= 4'b1010, F_CMP= 4'b1011, F_MOV= 4'b1101, F_MUL= 4'b1110, F_TEST= 4'b1111;
	
	// SPECIAL function codes.
	parameter LOAD = 4'b0000, STORE = 4'b0100, JAL= 4'b1000, JCOND= 4'b1100, SCOND= 4'b1101;

	// CONDITION codes
	parameter EQ = 0, NE = 1, CS = 2, CC = 3, HI = 4, LS = 5, GT = 6, LE = 7;
	parameter FS = 8, FC = 9, LO = 10, HS = 11, LT = 12, GE = 13, UC = 14;

	// CONTROL codes
	parameter C_ADD = 0, C_MULT = 1, C_SUB = 2, C_AND = 3, C_OR = 4, C_XOR = 5, C_PASS = 6, C_SLL = 7;
	parameter C_SRL = 8, C_SAR = 9, C_LSH = 10, C_ASHU = 11, C_SCOND = 12, C_JUMP = 13, C_NOT = 14, C_LUI = 15;

	// Condition code logic
	reg condition;
	wire c, l, f, z, n;
	assign {c,l,f,z,n} = condIn;
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
	
	// PSR Condition code generation.
	wire cr_t, cr, br, zr, fr, lr, nr;
	assign cr_t = (cr & addFunc) | (br && subFunc); // cr and br calculated in result
	assign zr = result == 0;
	assign fr = (dst[15] & src[15] & ~result[15]) | (~dst[15] & ~src[15] & result[15]);
	assign lr = dst < src;
	assign nr = result[15];
	
	assign condOut = {cr_t, lr, fr, zr, nr};
	 
	// PSR Condition code write flags.
	wire cr_wr, lr_wr, fr_wr, zr_wr, nr_wr;
	assign condWr = {cr_wr, lr_wr, fr_wr, zr_wr, nr_wr};
	wire addFunc, subFunc, cmpFunc, zFunc;
	assign addFunc = (oper == ADDI || oper == ADDCI || (oper == REGISTER && (func == F_ADD || func == F_ADDC)));
	assign subFunc = (oper == SUBI || oper == SUBCI || (oper == REGISTER && (func == F_SUB || func == F_SUBC)));
	assign cmpFunc = (oper == CMPI || (oper == REGISTER && func == F_CMP));
	// This mess is the output of two Karnaugh maps of the operations that use zero flag.
	assign zFunc = ((oper[1:0] != 2'b00 && oper[3:2] != 2'b11 && oper[2:0] != 3'b110) 
		|| (oper == REGISTER && ((~func[2] & func[1:0] != 2'b00) | func[1:0] == 2'b11 |  func[3:1] == 3'b010)));
	
	assign cr_wr = addFunc | subFunc;
	assign lr_wr = cmpFunc;
	assign fr_wr = addFunc | subFunc;
	assign zr_wr = zFunc;
	assign nr_wr = cmpFunc | subFunc | addFunc;
	
	// Result calculations
	wire [15:0] sum, mult, sub, band, bor, bxor, passthrough, sll, srl, sar, lsh, ashu, scond, jump, bnot, lui;
	
	wire cIn;
	assign cIn = (oper == ADDCI || oper == SUBCI || (oper == REGISTER && (func == F_ADDC || func == F_SUBC))) & c;
	
	wire [15:0] addr;
	wire relative;
	assign relative = func == BCOND;
	assign addr = relative ? sum : src;
	
	wire [4:0] amt;
	assign amt = -(src[4:0]);
	
	assign {cr,sum} = dst + src + cIn;
	assign mult = dst * src;
	assign {br, sub} = dst - src - cIn;
	assign band = dst & src;
	assign bor = dst | src;
	assign bxor = dst ^ src;
	assign passthrough = src;
	assign sll = dst << src[3:0];
	assign srl = dst >> amt;
	assign sar = dst >>> amt;
	assign lsh = src[15] ? srl : sll;
	assign ashu = src[15] ? sar : sll;
	assign scond = condition;
	assign jump = condition ? addr : dst;
	assign bnot = ~dst;
	assign lui = {src[7:0], dst[7:0]};
	
	// Output result mux.
	reg [3:0] ctrl;	
	always @(*) begin
		case (ctrl)
			C_ADD: result = sum;
			C_MULT: result = mult;
			C_SUB: result = sub;
			C_AND: result = band;
			C_OR: result = bor;
			C_XOR: result = bxor;
			C_PASS: result = passthrough;
			C_SLL: result = sll;
			C_SRL: result = srl;
			C_SAR: result = sar;
			C_LSH: result = lsh;
			C_ASHU: result = ashu;
			C_SCOND: result = scond;
			C_JUMP: result = jump;
			C_NOT: result = bnot;
			C_LUI: result = lui;		
			default: result = sum;
		endcase
	end
   
  // ALU operation selection logic.
  reg [3:0] regCtrl, specCtrl, shiftCtrl;
	always @(*) begin
		case (oper)
			REGISTER: ctrl = regCtrl;
			ANDI: ctrl = C_AND;
			ORI: ctrl = C_OR;
			XORI: ctrl = C_XOR;
			SPECIAL: ctrl = specCtrl;
			ADDI: ctrl = C_ADD;
			ADDUI: ctrl = C_ADD;
			ADDCI: ctrl = C_ADD;
			SHIFT: ctrl = shiftCtrl;
			SUBI: ctrl = C_SUB;
			SUBCI: ctrl = C_SUB;
			CMPI: ctrl = C_SUB;
			BCOND: ctrl = C_JUMP;
			MOVI: ctrl = C_PASS;
			MULI: ctrl = C_MULT;
			LUI: ctrl = C_LUI;		
			default: ctrl = C_ADD;
		endcase
	end

	always @(*) begin
		case (func)
			F_AND: regCtrl = C_AND;
			F_OR: regCtrl = C_OR;
			F_XOR: regCtrl = C_XOR;
			F_NOT: regCtrl = C_NOT;
			F_ADD: regCtrl = C_ADD;
			F_ADDU: regCtrl = C_ADD;
			F_ADDC: regCtrl = C_ADD;
			F_SUB: regCtrl = C_SUB;
			F_SUBC: regCtrl = C_SUB;
			F_CMP: regCtrl = C_SUB;
			F_MOV: regCtrl = C_PASS;
			F_MUL: regCtrl = C_MULT;
			F_TEST: regCtrl = C_AND;		
			default: regCtrl = C_ADD;
		endcase
	end
	
	always @(*) begin
		case (func)
			JAL: specCtrl = C_PASS;
			JCOND: specCtrl = C_JUMP;
			SCOND: specCtrl = C_SCOND;
			default: specCtrl = C_ADD;
		endcase
	end
	
	always @(*) begin
		case (func)
			LSHI_L: shiftCtrl = C_SLL;
			LSHI_R: shiftCtrl = C_SRL;
			ASHUI_L: shiftCtrl = C_SLL;
			ASHUI_R: shiftCtrl = C_SAR;
			LSH: shiftCtrl = C_LSH;
			ASHU: shiftCtrl = C_ASHU;
			default: shiftCtrl = C_ADD;
		endcase
	end
	

endmodule
