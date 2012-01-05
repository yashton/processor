`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    10:50:51 11/14/2010 
// Design Name: 
// Module Name:    mixer 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module mixer
	#(
		parameter BIT_DEPTH = 8,
		parameter DAC_BIT_DEPTH = 12,
		parameter SOUNDS = 9
	)
	(
		//input clk,
		input [BIT_DEPTH-1:0] bground,
		input [3:0] bg_amp,
		
		input [(SOUNDS*BIT_DEPTH)-1:0] sfx,
		input [(SOUNDS*4)-1:0] sfx_amp,
		
		output [DAC_BIT_DEPTH-1:0] data
	);
	
	wire [DAC_BIT_DEPTH-1:0] sum [SOUNDS-1:0];
	
	assign data = sum[0];
	
	genvar i;
	generate
		for (i = 1; i < SOUNDS; i = i + 1) begin: sum_stage
			assign sum[i] = 
				({sfx[SOUNDS*(i+1)-1:SOUND(i)], 2'b00} >> sfx_amp[SOUNDS*(i+1)-1:SOUND(i)])
				 + sum[i-1];
		end
		assign sum[SOUNDS-1] = ({bground, 3'b00} >> bg_amp) +
			({sfx[SOUNDS-1:0], 2'b00} >> sfx_amp[SOUNDS-1:0]);
	endgenerate


endmodule
