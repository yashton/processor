`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:38:34 10/19/2010 
// Design Name: 
// Module Name:    signExtend 
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
module signExtend(
    input [7:0] immediate,
    input signExtImm,
    output [15:0] extImm
    );
	 
	 if (signExtImm)
		assign extImm = {{8{immediate[7]}},immediate};
		
	 else
		assign extImm = {{8{0}},immediate};

endmodule
