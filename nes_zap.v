`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Jacob Sanders
// Create Date:    18:35:06 11/16/2010 
// Design Name: 	 NES Zapper Input Module
// Module Name:    nes_zap 
// Project Name:   CS3710
// Description: 	 Provides accurate and synchronized
//						 trigger and hit signals interfaced
//						 from the NES Zapper.
//
//////////////////////////////////////////////////////////////////////////////////
/*
		NES ZAPPER MODULE
		
		The NES controller connects to the system via 4 wires.
		2 wires are power and ground
		The others 2 are Sensor and Trigger signals
		Sensor and trigger are signals from the controller to the zapper interface
		The sensor sends a 5 ms active high pulse when light is detected from the
		CRT television.  When the trigger is pulled, a 50 ms active low signal is 
		sent out of the gun.
		
		This module simply sets a shot signal high when the trigger input is high,
		and sets the hit signal high when the trigger and sensor inputs are high.
		
*/
module nes_zap
	(
		input clk,
		input rst, 
		input sensor, 
		input trigger, 
		output blank_time_up, 
		output [15:0] plyr_input
	);

	reg shot, hit;
	// Use for game
	assign plyr_input = {hit, shot};
	
	always@(posedge clk) begin
		if( !rst ) begin
			hit 	<= 0;
			shot 	<= 0;
		end
		//if sensor && trigger is pulled
		else if ( sensor && !trigger) begin
			hit <= 1;
			shot<=1;
		end
		//if trigger is pulled and sensor not detected
		else if ( !sensor && !trigger ) begin
			shot <= 1;
			hit <= 0;
		end
		else begin
			shot <=0;
			hit <=0;
		end
	end
endmodule // gun_interface
