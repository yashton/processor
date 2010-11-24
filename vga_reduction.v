`timescale 1ns / 1ps

module vga_reduce 
	(
		input [7:0] R, G, B,
		input [7:0] cutoff,
		output reduce_r, reduce_g, reduce_b
	);

	assign reduce_r = R > cutoff;
	assign reduce_g = G > cutoff;
	assign reduce_b = B > cutoff;

endmodule
