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
	 input rst,
    input [9:0] y,
    input [9:0] x,
    output reg [8:0] indexOut,
	 output reg [4:0] bg_palette,
	 input [15:0] write_data,
	 input mem_write,
	 input mem_enable
    );
	
	parameter [9:0] stopSky = 10'd300;
	parameter [9:0] startGround = 10'd428;
	parameter [3:0] skyIndex = 4'b0101;
	parameter [3:0] groundIndex = 4'b0111;
	parameter [1:0] s0 = 2'b00, s1=2'b01, s2 = 2'b10;
	reg [1:0] state,next_state;
	reg [3:0] Xbyte;
	wire[10:0] addr;
	wire[8:0] dout;
	reg last_x;			//used to store previous value of x[0]
	
	always @(posedge clk) begin
		if(!rst) begin
			bg_palette = 0;
		end
		else if(mem_enable && mem_write) begin
			bg_palette = write_data[4:0];
		end
	end
	
	//state machine used in grass
	always @ (*) begin
		if(x == 10'b0)begin
			next_state <= s0;
		end
		else begin
			case(state)
				s0: next_state <= s1;
				s1: next_state <= s2;
				s2: next_state <= s0;
				default: next_state <= s0;
			endcase
		end
	end
	
	always @(posedge clk) begin
		if (!rst)
			Xbyte <= 4'b0;
		else if (state == s2)
			Xbyte <= Xbyte + 1;
	end
	
	always @(posedge clk) begin
		// logic for anytime the x value changes
		last_x <= x[0];
		if (!rst)
			state <= s0;
		if(x[0] != last_x)			//checks if x has changed
			state <= next_state;
	end
	
	//bg drawing logic
	always @(*) begin
		if (y < stopSky) begin
			indexOut <= {bg_palette,skyIndex}; // sky color index in pallette 0
		end
		else if (y < startGround) begin
			case (state)
				s0: indexOut <= {bg_palette,0,dout[8:6]};
				s1: indexOut <= {bg_palette,0,dout[5:3]};
				s2: indexOut <= {bg_palette,0,dout[2:0]};
				default indexOut <= {bg_palette,skyIndex}; // should never happen
			endcase
		end
		else begin
			indexOut <= {bg_palette,groundIndex}; // ground color index in pallette 0
		end
	end
	
	// background rom
	bg_rom background(
		.addra(addr), 
		.clka(clk), 
		.douta(dout)
	);
		
	assign addr = y - 300 + Xbyte;
	
endmodule
