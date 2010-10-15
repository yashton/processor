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
		output reg [15:0] pc_plus_one
	);
	
	always @(posedge clk) begin
		if (!rst) begin
			pc <= 0;
		end
		else begin
			if (write) begin
				pc <= data;
			end
			pc <= pc + 1;
		end
	end
endmodule
