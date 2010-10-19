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
		input [3:0] src_addr,
		input [15:0] data,
		input write,
		output [15:0] dst_data,
		output [15:0] src_data
	);
	
	reg [15:0] RAM [15:0];
	
	// write back
	always @(posedge clk)
		if (write) RAM[dst_addr] <= data;
		
	assign dst_data = dst_addr ? RAM[dst_addr] : 0;
	assign src_data = src_addr ? RAM[src_addr] : 0;	

endmodule
