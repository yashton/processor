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
		output reg [15:0] dst_data,
		output reg [15:0] src_data
	);
	
	reg [15:0] RAM [15:0];
	
	// write back
	always @(posedge clk) begin
		if (write) begin
			RAM[dst_addr] <= data;
		end
		dst_data <= RAM[dst_addr];
		src_data <= RAM[src_addr];
	end	

endmodule
