`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:16:19 11/10/2010 
// Design Name: 
// Module Name:    psr 
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
module psr(
    input [4:0] psrWrEn,
    input [4:0] psrWrite,
	 input clk,
    output [4:0] psrRead
    );
	 
	 reg [4:0] psrReg;
	 
	 always@(posedge clk)
	 begin
		if (psrWrEn[0]) psrReg[0] <= psrWrite[0];
		if (psrWrEn[1]) psrReg[1] <= psrWrite[1];
		if (psrWrEn[2]) psrReg[2] <= psrWrite[2];
		if (psrWrEn[3]) psrReg[3] <= psrWrite[3];
		if (psrWrEn[4]) psrReg[4] <= psrWrite[4];
	 end
	 
endmodule
