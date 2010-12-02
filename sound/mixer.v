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
module mixer(
		//input clk,
		input [7:0] bground,
		input [3:0] bg_amp,
		input [7:0] sfx0, sfx1, sfx2, sfx3, sfx4, sfx5, sfx6, sfx7, sfx8,
		
		input [3:0] sfx_amp0,
		input [3:0] sfx_amp1,
		input [3:0] sfx_amp2,
		input [3:0] sfx_amp3,
		input [3:0] sfx_amp4,
		input [3:0] sfx_amp5,
		input [3:0] sfx_amp6,
		input [3:0] sfx_amp7,
		input [3:0] sfx_amp8,
		output [11:0] data	//might have to be a 24bit word since that is what DAC is expecting
    );
	
		assign data = (sfx0 >> sfx_amp0) 
				+ (sfx1 >> sfx_amp1)
				+ (sfx2 >> sfx_amp2)
				+ (sfx3 >> sfx_amp3)
			   + (sfx4 >> sfx_amp4)
			   + (sfx5 >> sfx_amp5)
			   + (sfx6 >> sfx_amp6)
				+ (sfx7 >> sfx_amp7)
				+ (sfx8 >> sfx_amp8)
				+ (bground >> bg_amp);


endmodule
