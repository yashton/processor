`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Flash ROM controller.
// Module Name: gpu
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module romController
	(
		input [15:0] SF_D,
		output [23:0] SF_A,
		output SF_CE0,
		output SF_OE,
		output SF_WE,
		output SF_BYTE,
		output SF_STS,
	);
	
	

	
	always @(posedge clk) begin
		
	end
endmodule
