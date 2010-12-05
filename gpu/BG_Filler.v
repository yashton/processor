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
	 
	parameter [4:0] palette = 5'b00000;
	parameter [9:0] stopSky = 10'd300;
	parameter [9:0] startGround = 10'd428;
	parameter [3:0] skyIndex = 4'b0101;
	parameter [3:0] groundIndex = 4'b0111;
	parameter [1:0] s0 = 2'b00, s1=2'b01, s2 = 2'b10;
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
	if (y<stopSky)
		begin
			indexOutR = {palette,skyIndex}; // sky color index in pallette 0
		end
	else if (y<startGround)
		begin
			case (state)
				s0: indexOutR = {palette,dout[8:6]};
				s1: indexOutR = {palette,dout[5:3]};
				s2: indexOutR = {palette,dout[2:0]};
				default indexOutR = {palette,skyIndex}; // should never happen
			endcase
		end
		else
		begin
			indexOutR = {palette,groundIndex}; // ground color index in pallette 0
		end
	end
	
	// background vram
	BG_vram BG_ram(
		.addra(addr), .dina(9'b0), .wea(1'b0), .clka(clk), .douta(dout));
		
	assign addr = y-300+Xbyte;
	assign indexOut = indexOutR;
	
endmodule
