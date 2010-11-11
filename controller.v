`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:03 10/28/2010 
// Design Name: 
// Module Name:    controller 
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
module controller(
		input clk,
		input rst,
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
	parameter register = 4'b0000, andi = 4'b0001, ori= 4'b0010, xori= 4'b0011, special= 4'b0100, addi= 4'b0101, addui= 4'b0110;
	parameter addci= 4'b0111, shift= 4'b1000, subi= 4'b1001, subci= 4'b1010, cmpi= 4'b1011, bcond= 4'b1100, movi= 4'b1101, muli= 4'b1110, lui= 4'b1111;

	//shift function codes
	parameter lshil = 4'b0000, lshir = 4'b0001, ashuil= 4'b0010, ashuir= 4'b0011, lsh= 4'b0100, ashu= 4'b0110;

	//registers
	parameter fand = 4'b0001, fuor= 4'b0010, fxor= 4'b0011, fnot= 4'b0100, fadd= 4'b0101, faddu= 4'b0110;
	parameter faddc= 4'b0111, fsub= 4'b1001, fsubc= 4'b1010, fcmp= 4'b1011, fmov= 4'b1101, fmul= 4'b1110, ftest= 4'b1111;
	
	//special
	parameter load = 4'b0000, stor = 4'b0100, jal= 4'b1000, jcond= 4'b1100, scond= 4'b1101;
	
	// state machine
	parameter [1:0] DECODE = 0, CALCULATE = 1, LOAD = 2, BOOT = 3;
	reg [1:0]state, nextstate;
	
	assign oper = instruction[15:12];
	assign func = instruction[7:4];
	assign cond = (oper == special && func == scond) ?  instruction[3:0] : instruction[7:4];
	assign immediate = instruction[7:0];
	
	assign srcaddr = instruction[3:0];
	assign dstaddr = instruction[11:8];
	
	assign pcsrc = !alusrca;
	assign pcwrite = (oper == special && func == load) ? state == LOAD : state == CALCULATE;
	assign pcaddrsrc[1] = !pcwrite;
	assign pcaddrsrc[0] = state == BOOT ? 0 : pcsrc;

	assign alusrca = !(oper == bcond 
			|| (oper == special && (func == load || func == jal)));
	assign alusrcb = (oper[1:0] != 2'b00) 
			|| (oper == shift && func[3:2] == 2'b00);
	
	assign sign_ext_imm = ((oper[3:2] == 2'b01 ||  oper[3:2] == 2'b10) && (oper[1:0] != 2'b00))
			|| oper == bcond || oper == muli;
	
	assign memwrite = oper == special && func == stor && state == CALCULATE;
	
	assign regwrite = state == LOAD 
			|| (state == CALCULATE 
					&& !(oper == cmpi 
						|| oper == bcond 
						|| (oper == register && (func == fcmp || func == 4'b000)) 
						|| (oper == special && (func == stor || func == jcond || func == load))));  

	always @(*) begin
		if (oper == special && func == jal)
			regsrc <= 2'b01;
		else if (oper == special && func == load)
			regsrc <= 2'b10;
		else
			regsrc <= 2'b00;
	end

	always @(posedge clk) begin
		if (!rst)
			state <= BOOT;
		else
			state <= nextstate;
	end 

	always @(*) begin
		case (state)
			BOOT:
				nextstate <= DECODE;
			DECODE: 
				nextstate <= CALCULATE;
			CALCULATE:
				begin
				if (oper == special && func == load)
					nextstate <= LOAD;
				else 
					nextstate <= DECODE;
				end
			LOAD:
				nextstate <= DECODE;
			default:
				nextstate <= DECODE;
		endcase
	end


endmodule
