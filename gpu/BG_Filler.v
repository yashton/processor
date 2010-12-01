`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:00:27 11/18/2010 
// Design Name: 
// Module Name:    BG_Filler 
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
module BG_Filler(
    input clk,
    input enable,
    input [8:0] indexIn,
    input [9:0] y,
    input [9:0] x,
    output [8:0] indexOut
    );
	 
	 assign indexOut = indexIn;


endmodule
