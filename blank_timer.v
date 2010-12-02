`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		University of Utah
// Engineer: 		Dave Kloster, Revised by Jacob Sanders
// 					http://web.mit.edu/6.111/www/s2004/PROJECTS/12/report12.pdf
// Create Date:   18:35:06 11/16/2010 
// Design Name: 		
// Module Name:   blank_timer
// Project Name:	CS3710
// Description:  	Sets the blanking time values for the shot/hit cycle
// 				  	for the gun interface of the NES Zapper.
//////////////////////////////////////////////////////////////////////////////////
module blank_timer
	(
		input clk, 
		input rst, 
		input start, 
		input stop, 
		output reg time_up
	);

	//SET TO THE AMOUNT OF TIME TO WAIT.
	//VALUE DEPENDS ON DESIRED TIME AND
	//THE FREQUENCE OF THE CLOCK.
	parameter TIMER_COUNT = 24'h1E8480;
	//USING 50MHz CLOCK, COUNTING TO 40 milli-SECONDs.
	reg [23:0] Q;
	reg on;
	always @ (posedge clk) begin
		if (!rst) begin
			Q <= 24'b0;
			time_up = 0;
			on = 0;
		end
		else if (stop) begin
			Q <= 24'b0;
			time_up = 0;
			on = 0;
		end
		else if (Q == TIMER_COUNT) begin
			time_up = 1;
			on = 0;
		end
		else if (on) begin
			Q <= Q + 1;
			on = 1;
		end
		else if (start) begin
			Q <= 24'b1;
			on = 1;
		end
	end // always @ (posedge clk or posedge rst)
endmodule // shot_timer
