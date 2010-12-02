`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		University of Utah
// Engineer: 		Dave Kloster, Revised by Jacob Sanders
// 					http://web.mit.edu/6.111/www/s2004/PROJECTS/12/report12.pdf
// Create Date:   18:35:06 11/16/2010 
// Design Name: 		
// Module Name:   shot_timer
// Project Name:	CS3710
// Description:  	Sets the time values for the shot/hit cycle
// 				  	for the gun interface of the NES Zapper.
//////////////////////////////////////////////////////////////////////////////////
module shot_timer
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
	parameter TIMER_COUNT = 24'h186A00;
	//USING 50MHz CLOCK, COUNTING TO .32 SECONDs.

	reg [21:0] Q;
	reg on;
	always @ (posedge clk) begin
		if (!rst) begin
			Q <= 22'b0;
			time_up = 0;
			on = 0;
		end
		else if (stop) begin
			Q <= 22'b0;
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
			Q <= 22'b1;
			on = 1;
		end
	end // always @ (posedge clk or posedge rst)
endmodule // shot_timer