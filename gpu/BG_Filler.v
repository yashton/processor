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
	 
/*	parameter [1:0] s0 = 2'b00, s1=2'b01, s2 = 2'b10;
	reg [1:0] state,next_state;
	reg [3:0] Xbyte;
	wire[10:0] addr;
	wire[8:0] dout;
	reg [8:0] indexOutR;
	
	//state machine used in grass
	always @ (*) begin
		if(x == 10'b0)begin
				Xbyte = 4'b0;
				state = s0;
				next_state = s0;
			end
		else begin
			case(state)
				s0: next_state = s1;
				s1: next_state = s2;
				s2: next_state = s0;
				default: next_state = s0;
			endcase
		end
	end
	
	
	// logic for anytime the x value changes
	always @(x) begin
		state <= next_state;
		if(state == s2) begin
			Xbyte = Xbyte + 1;
		end
	end
	
	//bg drawing logic
	always @(posedge clk)
	begin
	if (y<300)
		begin
			indexOutR = 9'b00000101; // sky color index in pallette 0
		end
	else if (y<428)
		begin
			case (state)
				s0: indexOutR = {5'b0,dout[8:6]};
				s1: indexOutR = {5'b0,dout[5:3]};
				s2: indexOutR = {5'b0,dout[2:0]};
				default indexOutR = 8'b00000101; // should never happen
			endcase
		end
		else
		begin
			indexOutR = 8'b00000111; // ground color index in pallette 0
		end
	end
	
	// background vram
	BG_vram BG_ram(
		.addra(addr), .dina(9'b0), .wea(1'b0), .clka(clk), .douta(dout));
		
	assign addr = y-300+Xbyte;
	assign indexOut = indexOutR;*/
	
endmodule
