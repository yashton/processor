`timescale 1ns / 1ps
module bus4Mux 
	#(
		parameter WIDTH = 4
	)
	(
		input [WIDTH - 1:0] x,
		input [WIDTH - 1:0] y,
		output [WIDTH - 1:0] z,
		input c
	);
	assign z = c ? y : x;
endmodule
