`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Team Blue
// 
// Design Name: Program Counter ALU
// Module Name: pcalu
// Project Name: CS3710
// Description: Always equal to the PC + 1.
//////////////////////////////////////////////////////////////////////////////////
module pc
	(
		input [15:0] data,
		input write,
		input clk,
		input rst,
		output reg [15:0] pc,
		output [15:0] pc_plus_one
	);
	assign pc_plus_one = pc + 1;
	always @(posedge clk, negedge rst) begin
		if (!rst) begin
			pc <= 0;
		end
		else if (write) begin
			pc <= data;
		end
	end
endmodule
