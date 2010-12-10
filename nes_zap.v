`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 		 Dave Kloster, Revised by Jacob Sanders
// http://web.mit.edu/6.111/www/s2004/PROJECTS/12/report12.pdf
// Create Date:    18:35:06 11/16/2010 
// Design Name: 	 NES Zapper Input Module
// Module Name:    nes_zap 
// Project Name:   CS3710
// Description: 	 Provides accurate and synchronized
//						 trigger and hit signals interfaced
//						 from the NES Zapper.
//
//////////////////////////////////////////////////////////////////////////////////
module nes_zap
	(
		input clk,
		input rst, 
		input sensor, 
		input trigger, 
		output blank_time_up, 
		output [15:0] plyr_input
	);
	//reg shot, hit;
	//reg sensor_sync, trigger_sync, sensor_temp, trigger_temp;
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


/*
	//TIMER INSTALL
	wire time_up;
	reg start, stop;
	
	shot_timer timer
	(
		.clk(clk),
		.rst(rst),
		.start(start),
		.stop(stop),
		.time_up(time_up)
	);
	
	//BLANK TIMER INSTALL
	reg blank_start, blank_stop;
	blank_timer timer2
	(
		.clk(clk),
		.rst(rst),
		.start(blank_start),
		.stop(blank_stop),
		.time_up(blank_time_up)
	);	

	reg [1:0] state, next;
	//FSM PARAMETERS
	parameter IDLE = 0;
	parameter LOOK = 1;
	parameter WAIT = 2;
	parameter BLANK = 3;
	//CLOCK LOOP
	always @ (posedge clk) begin
		//synchronize signals
		sensor_temp <= sensor;
		sensor_sync <= sensor_temp;
		trigger_temp <= ~trigger;
		trigger_sync <= trigger_temp;
		if (!rst) 
			state <= IDLE;
		else 
			state <= next;
	end // always @ (posedge clk or posedge reset)
	//FSM STATE IMPLEMENTATION
	always @ (*) begin
		//default values
		hit = 0;
		shot = 0;
		start = 0;
		blank_start = 0;
		blank_stop = 0;
		stop = 0;
		case (state)
			IDLE: 
			begin
				stop = 1;
				blank_stop = 1;
				if (trigger_sync) begin
					shot = 1;
					next = BLANK;
				end
				else 
					next = IDLE;
			end
			BLANK: 
			begin
				shot = 1;
				start = 1;
				blank_start = 1;
				if (blank_time_up) 
					next = LOOK;
				else 
					next = BLANK;
			end
			LOOK: 
			begin
				shot = 1;
				start = 1;
				blank_stop = 1;
				if (sensor_sync) begin
					hit = 1;
					next = WAIT;
				end
				else if (time_up) 
					next = IDLE;
				else 
					next = LOOK;
			end
			WAIT: 
			begin
				shot = 1;
				hit = 1;
				if (time_up) 
					next = IDLE;
				else 
					next = WAIT;
			end
			default: next = IDLE;
		endcase 
	end */
endmodule // gun_interface
