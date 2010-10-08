`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Team Blue
// 
// Design Name: Register file
// Module Name: regfile
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module regfile
	(
		input clk,
		input [3:0] dst_addr,
		input [3:0] src_addr
		input [15:0] data,
		input write,
		output [15:0] dst_data,
		output [15:0] src_data
	);
	
	always @(posedge clk) begin
		// insert code here.
	end
endmodule
