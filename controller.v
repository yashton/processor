`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: William Graham, Ashton Snelgrove
// 
// Design Name: Processor controller
// Module Name: controller 
// Project Name: blue
// Description: Instruction decoding and processor control state machine.
//////////////////////////////////////////////////////////////////////////////////
module controller(
		input clk,
		input rst,
		input en,
		input [15:0] instruction,
		output [3:0] oper, func, cond,
		output [7:0] immediate,
		output [3:0] dstaddr, srcaddr,
		output alusrca, alusrcb,
		output memwrite,	
		output regwrite,
		output reg [1:0] regsrc,
		output pcwrite,
		output pcsrc,
		output [1:0] pcaddrsrc,
		output sign_ext_imm
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
	parameter LOAD = 4'b0000, STOR = 4'b0100, JAL= 4'b1000, JCOND= 4'b1100, SCOND= 4'b1101;
		
	// state machine
	parameter [1:0] DECODE = 0, CALCULATE = 1, LOAD_STATE = 2, BOOT = 3;
	reg [1:0] state, nextstate;
	
	// ALU function operands
	assign oper = instruction[15:12];
	assign func = instruction[7:4];
	assign cond = (oper == SPECIAL && func == SCOND) ?  instruction[3:0] : instruction[11:8];
	
	// Immediate values
	assign immediate = instruction[7:0];
	
	// Register decoding
	assign srcaddr = instruction[3:0];
	assign dstaddr = instruction[11:8];
	
	// Program counter mux bits
	assign pcsrc = !alusrca;
	assign pcwrite = (oper == SPECIAL && func == LOAD) ? state == LOAD_STATE : state == CALCULATE;
	assign pcaddrsrc[1] = !pcwrite;
	assign pcaddrsrc[0] = state == BOOT ? 0 : pcsrc;

	// ALU mux source bits
	assign alusrca = !(oper == BCOND 
			|| (oper == SPECIAL && (func == JCOND || func == JAL)));
	assign alusrcb = (oper[1:0] != 2'b00) 
			|| (oper == SHIFT && func[3:2] == 2'b00)
			|| oper == BCOND;
	
	// Sign extend immediate control
	assign sign_ext_imm = ((oper[3:2] == 2'b01 ||  oper[3:2] == 2'b10) && (oper[1:0] != 2'b00))
			|| oper == BCOND || oper == MULI;
	
	// Memory write signal
	assign memwrite = oper == SPECIAL && func == STOR && state == CALCULATE;
	
	// Register update signal
	assign regwrite = state == LOAD_STATE
			|| (state == CALCULATE 
					&& !(oper == CMPI 
						|| oper == BCOND 
						|| (oper == REGISTER && (func == F_CMP || func == 4'b000)) 
						|| (oper == SPECIAL && (func == STOR || func == JCOND || func == LOAD))));  

	// Register source mux control
	always @(*) begin
		if (oper == SPECIAL && func == JAL)
			regsrc <= 2'b01;
		else if (oper == SPECIAL && func == LOAD)
			regsrc <= 2'b10;
		else
			regsrc <= 2'b00;
	end

	// State machine progression
	always @(posedge clk) begin
		if (!rst) begin
			state <= BOOT;
		end
		else if (en) begin
			state <= nextstate;
		end
	end 

	// Next state logic.
	always @(*) begin
		case (state)
			BOOT:
				nextstate <= DECODE;
			DECODE: 
				nextstate <= CALCULATE;
			CALCULATE:
				begin
				if (oper == SPECIAL && func == LOAD)
					nextstate <= LOAD_STATE;
				else 
					nextstate <= DECODE;
				end
			LOAD_STATE:
				nextstate <= DECODE;
			default:
				nextstate <= DECODE;
		endcase
	end
endmodule
