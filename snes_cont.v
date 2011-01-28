`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Jacob Sanders
// 
// Create Date:    	18:35:06 11/16/2010 
// Design Name: 		SNES Controller Input Module
// Module Name:    	snes_cont 
// Project Name:		CS3710
//////////////////////////////////////////////////////////////////////////////////
module snes_controller
	( 	
		input clk,
		input en, 
		input rst,
		input load,
		// Shift register interface
		input data,
		output reg latch,
		output reg pulse, 
		// Read data
		output reg [15:0] player_input,
		output reg [15:0] player_changed
	);

	reg [15:0] shift;
	always (posedge clk) begin
		if (finished) begin
			player_input <= shift;
			player_changed <= shift ^ player_input;
		end
	end

endmodule
