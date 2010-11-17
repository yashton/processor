`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: Linear feedback shift register
// Module Name: lfsr
// Project Name: CS3710
// Description: Generic 4 tap LFSR.
//////////////////////////////////////////////////////////////////////////////////
module lfsr
	#(
		parameter WIDTH = 32,
		parameter SEED = 32'h00000000,
		parameter TAP_0 = 31,
		parameter TAP_1 = 27,
		parameter TAP_2 = 8,
		parameter TAP_3 = 6
	)
	(
		input clk,
		input en,
		input rst,
		input write,
		input din,
		output bit
	);	
	reg [WIDTH-1:0] data;
  assign bit = data[0];
  
	always @(posedge clk) begin
		if (!rst) begin
			data <= SEED;
		end
		else if (en) begin
			if (write) begin
				data[WIDTH-2:0] <= SEED;
				data[WIDTH-1] <= din;
			end
			else begin
				data[WIDTH-1:1] <= data[WIDTH-2:0];
				data[0] <= data[TAP_0] ^ data[TAP_1] ^ data[TAP_2] ^ data[TAP_3];
			end
		end
	end
endmodule
