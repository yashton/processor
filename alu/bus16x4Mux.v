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
		output reg [WIDTH - 1:0] mout,
		input [1:0] c
	);
	always @(*) begin
		case(c)
			0: mout <= w;
			1: mout <= x;
			2: mout <= y;
			3: mout <= z;
			default: mout <= w;
		endcase
	end
endmodule
