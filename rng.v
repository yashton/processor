`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: Pseudo random number generator
// Module Name: rng
// Project Name: CS3710
// Description: 16-bit pseudo-random number generator.
// Each bit is fed by a 32 bit LFSR. Reading from the generator causes each 
// LFSR to shift. Writing a seed value writes the corresponding bit combined
// with each LFSR seed into each LFSR.
// 
// The seed values of each of the LFSR are as follows:
// 0x0
// 0xfe1910d
// 0x1fc3221a
// 0x2fa4b327
// 0x3f864434
// 0x4f67d541
// 0x5f49664e
// 0x6f2af75b
// 0x7f0c8868
// 0x8eee1975
// 0x9ecfaa82
// 0xaeb13b8f
// 0xbe92cc9c
// 0xce745da9
// 0xde55eeb6
// 0xee377fc3
// This isn't a perfect solution, but should be good enough.
//////////////////////////////////////////////////////////////////////////////////
module rng
	#(
		parameter WIDTH = 16
	)
	(
		input clk,
		input en,
		input rst,
		input write,
		input [WIDTH-1:0] seed,
		output [WIDTH-1:0] random
	);
	
	// Creates WIDTH lfsr instances
	genvar i;
	generate
		for (i = 0; i < WIDTH; i = i + 1) begin: bits
			lfsr #(.SEED(i*266440973)) stage (.clk(clk), .rst(rst), .en(en), 
				.write(write), .din(seed[i]), .rand_bit(random[i]));
		end
	endgenerate
endmodule
