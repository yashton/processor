`timescale 1ns / 1ps
module bus16x4Mux 
	#(
		parameter WIDTH = 16
	)
	(
		input [WIDTH - 1:0] w,
		input [WIDTH - 1:0] x,
		input [WIDTH - 1:0] y,
		input [WIDTH - 1:0] z,
		output [WIDTH - 1:0] out,
		input [1:0] c
	);
	always @(*) begin
		case(c)
			0: out <= w;
			1: out <= x;
			2: out <= y;
			3: out <= z;
			default: out <= w;
		endcase
	end
endmodule
