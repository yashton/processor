`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Jacob Sanders
// 
// Create Date:    	18:35:06 11/16/2010 
// Design Name: 		SNES Controller Input Module
// Module Name:    	snes_cont 
// Project Name:		CS3710
//////////////////////////////////////////////////////////////////////////////////
module snes_cont
	( 	
		input clk,
		input en, 
		input rst,
		input data,
		output reg latch,
		output reg pulse, 
		output [15:0] plyr_input
	);

	reg latch1, pulse1, data1;

	reg B, Y, select, start, up, down, left, right, A, X, L, R, N0, N1, N2, N3;
	reg B1, Y1, select1, start1, up1, down1, left1, right1, A1, X1, L1, R1, N01, N11, N21, N31;
	assign plyr_input = {N3,N2,N1,N0,left, right, up, down, A, B, X, Y, L, R, select, start};              

	reg [4:0] state, nextstate, returnstate, nextreturnstate;
	reg [11:0] count, nextcount; 

	parameter INIT = 0;
	parameter IDLE = 1;
	parameter LATCH = 2;
	parameter WAIT = 3;
	parameter PULSE = 4;
	parameter READ_B = 5;
	parameter READ_Y = 6;
	parameter READ_SEL = 7;
	parameter READ_STRT = 8;
	parameter READ_UP = 9;
	parameter READ_DOWN = 10;
	parameter READ_LEFT = 11;
	parameter READ_RIGHT = 12;
	parameter READ_A = 13;
	parameter READ_X = 14;
	parameter READ_L = 15;
	parameter READ_R = 16;
	parameter READ_N0 = 17;
	parameter READ_N1 = 18;
	parameter READ_N2 = 19;
	parameter READ_N3 = 20;
	
	parameter TWELVE_US = 12'h258;//count for 12 us on a 50 MHz clk
	parameter SIX_US = 12'h12c; 	//count for 6 us on a 50 MHz clk

	always @ (posedge clk)
	begin
		if (!rst) begin
			state <= INIT;
			returnstate <= INIT;
			count <= 0;
		end    
		else   begin
			state <= nextstate;
			returnstate <= nextreturnstate;
			count <= nextcount;
		end

		data1 <= data;
		latch <= latch1;
		pulse <= pulse1;
		left <= left1;
		right <= right1;
		up <= up1;
		down <= down1;
		A <= A1;
		B <= B1;
		select <= select1;
		start <= start1;
		X <= X1;
		Y <= Y1;
		L <= L1;
		R <= R1;
		N0<= N01;
		N1<= N11;
		N2<= N21;
		N3<= N31;
	end

	always @(*)
	begin
		//defaults
		nextstate = state;
		nextreturnstate = returnstate;
		nextcount = count;
		latch1 = latch;
		pulse1 = pulse;
		left1 = left;
		right1 = right;
		up1 = up;
		down1 = down;
		A1 = A;
		B1 = B;
		X1 = X;
		Y1 = Y;
		L1 = L;
		R1 = R;
		select1 = select;
		start1 = start;
		N01 = N0;
		N11 = N1;
		N21 = N2;
		N31 = N3;

		case (state)
			INIT:
			begin
				nextstate = IDLE;
				nextcount = 0;
			end
			IDLE:
			begin
				nextcount = 0;
				//get input at 60Hz
				if (en)
					nextstate = LATCH;
			end
			LATCH:
			begin
				//latch 12 us, then go to read A
				latch1 = 1;
				if (count == TWELVE_US) begin
					nextcount = 0;
					latch1 = 0;
					nextstate = READ_B;
				end
				else   nextcount = count + 1;
			end

			WAIT:
			begin
				//wait 6 us, then go to pulse
				if (count == SIX_US) begin
					nextcount = 0;
					nextstate = PULSE;

				end
				else
					nextcount = count + 1;
			end
			PULSE:
			begin
				//pulse 6 us, then go to returnstate and read data
				pulse1 = 1;
				if (count == SIX_US) begin
					nextcount = 0;
					pulse1 = 0;
					nextstate = returnstate;
				end
				else   
					nextcount = count + 1;
			end
			READ_B:
			begin
				B1 = ~data1;
				nextreturnstate = READ_Y;
				nextstate = WAIT;
			end
			READ_Y:
			begin
				Y1 = ~data1;
				nextreturnstate = READ_SEL;
				nextstate = WAIT;
			end
			READ_SEL:
			begin
				select1 = ~data1;
				nextreturnstate = READ_STRT;
				nextstate = WAIT;
			end
			READ_STRT:
			begin
				start1 = ~data1;
				nextreturnstate = READ_UP;
				nextstate = WAIT;
			end
			READ_UP:
			begin
				up1 = ~data1;
				nextreturnstate = READ_DOWN;
				nextstate = WAIT;
			end
			READ_DOWN:
			begin
				down1 = ~data1;
				nextreturnstate = READ_LEFT;
				nextstate = WAIT;
			end
			READ_LEFT:
			begin
				left1 = ~data1;
				nextreturnstate = READ_RIGHT;
				nextstate = WAIT;
			end
			READ_RIGHT:
			begin
				right1 = ~data1;
				nextreturnstate = READ_A;
				nextstate = WAIT;
			end
			READ_A:
			begin
				A1 = ~data;
				nextreturnstate = READ_X;
				nextstate = WAIT;
			end
			READ_X:
			begin
				X1 = ~data;
				nextreturnstate = READ_L;
				nextstate = WAIT;
			end
			READ_L:
			begin
				L1 = ~data;
				nextreturnstate = READ_R;
				nextstate = WAIT;
			end
			READ_R:
			begin
				R1 = ~data;
				nextreturnstate = READ_N0;
				nextstate = WAIT;
			end
			READ_N0:
			begin
				N01 = ~data;
				nextreturnstate = READ_N1;
				nextstate = WAIT;
			end	
			READ_N1:
			begin
				N11 = ~data;
				nextreturnstate = READ_N2;
				nextstate = WAIT;
			end	
			READ_N2:
			begin
				N21 = ~data;
				nextreturnstate = READ_N3;
				nextstate = WAIT;
			end			
			READ_N3:
			begin
				N31 = ~data;
				nextstate = IDLE;
			end
		endcase
	end
endmodule
