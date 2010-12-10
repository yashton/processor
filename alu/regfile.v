`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Matthew Steadman, Jacob Sanders
// 
// Design Name: Register file
// Module Name: regfile
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module regfile
	(
		input clk,
		input rst,
		input [3:0] dst_addr,
		input [3:0] src_addr,
		input [15:0] data,
		input write,
		output reg [15:0] dst_data,
		output reg [15:0] src_data
	);
	
	reg [15:0] RAM [15:0];
	
	initial begin
		RAM[0] <= 16'h0;
		RAM[1] <= 16'h0;
		RAM[2] <= 16'h0;
		RAM[3] <= 16'h0;
		RAM[4] <= 16'h0;
		RAM[5] <= 16'h0;
		RAM[6] <= 16'h0;
		RAM[6] <= 16'h0;
		RAM[7] <= 16'h0;
		RAM[8] <= 16'h0;
		RAM[9] <= 16'h0;
		RAM[10] <= 16'h0;
		RAM[11] <= 16'h0;
		RAM[12] <= 16'h0;
		RAM[13] <= 16'h0;
		RAM[14] <= 16'h0;
		RAM[15] <= 16'h0;
	end
	
	// write back
	always @(posedge clk) begin
		if (!rst) begin
			RAM[0] <= 16'h0;
			RAM[1] <= 16'h0;
			RAM[2] <= 16'h0;
			RAM[3] <= 16'h0;
			RAM[4] <= 16'h0;
			RAM[5] <= 16'h0;
			RAM[6] <= 16'h0;
			RAM[6] <= 16'h0;
			RAM[7] <= 16'h0;
			RAM[8] <= 16'h0;
			RAM[9] <= 16'h0;
			RAM[10] <= 16'h0;
			RAM[11] <= 16'h0;
			RAM[12] <= 16'h0;
			RAM[13] <= 16'h0;
			RAM[14] <= 16'h0;
			RAM[15] <= 16'h0;
		end
		else begin
			if (write) begin
				RAM[dst_addr] <= data;
			end
			dst_data <= RAM[dst_addr];
			src_data <= RAM[src_addr];
		end
	end	

endmodule
