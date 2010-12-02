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
    input [9:0] y,
    input [9:0] x,
    output [8:0] indexOut
    );
	 
	 assign indexOut = 9'd0;
//	 
//	 always @(posedge clk) 
//	 begin
//		if (y<300)
//		begin
//			if (indexIn[3:0] == 4'b0000)
//			begin
//				indexOut <= 9'b00000000; // sky color index in pallette 0
//			end
//			else
//			begin
//				indexOut <= indexIn;
//			end
//		end
//		else if (y<400)
//		begin
//			// grass code goes here, msb of 3 bits we need is located at (x-1)%52*3+156*(y-300)
//		end
//		else
//		begin
//		if (indexIn[3:0] == 4'b0000)
//			begin
//				indexOut <= 9'b00000111; // ground color index in pallette 0
//			end
//			else
//			begin
//				indexOut <= indexIn;
//			end
//		end
//	end
	
endmodule
