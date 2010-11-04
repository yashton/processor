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
    output reg [15:0] extImm
    );
	 always @(*) begin
		if (signExtImm)
			extImm <= {{8{immediate[7]}},immediate};	
		else
			extImm <= {{8{0}},immediate};
	end
endmodule
