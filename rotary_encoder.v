`timescale 1ns / 1ps
module rotary_encoder
	(
		input clk,
		input rst,
		input rot_a, rot_b,
		output reg [15:0] count,
		input write,
		input en,
		input [15:0] writedata
	);
	reg rot_q1;
	reg rot_q2;
	
	always @(posedge clk) begin
		if (!(rot_a ^ rot_b)) begin
			rot_q1 <= rot_a;
		end 
	end
	
	always @(posedge clk) begin
		if (rot_a ^ rot_b) begin
			rot_q2 <= rot_a;
		end 
	end
	
	// Decode direction & event
	reg delay_q1;
	always @(posedge clk) begin
		delay_q1 <= rot_q1;
		
		if (!rst) begin
			count <= 0;
		end
		else if (en && write) begin
			count <= writedata;
		end
		else if (rot_q1 & !delay_q1) begin
			if (rot_q2) begin
				count <= count - 1;
			end
			else begin
				count <= count + 1;
			end
		end
	end
endmodule
