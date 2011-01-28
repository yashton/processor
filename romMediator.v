`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Flash ROM controller.
// Module Name: romMediator
// Project Name: CS3710
// Description: This module switches between two devices sharing access to the
// ROM.
////////////////////////////////////////////////////////////////////////////////
module romMediator
	#(
		parameter WIDTH = 16,
		parameter ROM_ADDR = 24,
	)
	(
		input clk,
		input rst,
		// romController interface A.
		input [ROM_ADDR-1:0] addrA,
		input loadA,
		input byteA,
		output readyA,
		output [WIDTH-1] dataA,
		// romController interface B
		input [ROM_ADDR-1:0] addrB,
		input loadB,
		input byteB,
		output readyB,
		output [WIDTH-1] dataB,
		// romController interface
		output [ROM_ADDR-1:0] rom_addr,
		output rom_load,
		output rom_byte,
		input [WIDTH-1:0] rom_data,
		input ready
	);
	
	reg [WIDTH-1:0] tmp_dataA, tmp_dataB;
	reg [ROM_ADDR-1:0] tmp_addrA, tmp_addrB;
	
	wire 
	always @(posedge clk) begin
		if (!rst) begin
			tmp_dataA <= 0;
			tmp_addrA <= 0;
		end
		else if (loadA) begin
			tmp_dataA <= 0;
			tmp_addrA <= 0;
		end
		
		
		if (!rst) begin
			tmp_dataB <= 0;
			tmp_addrB <= 0;
		end
		else if (loadB) begin
			tmp_dataB <= 0;
			tmp_addrB <= 0;
		end
	end
	
	assign data = rom_data;
	
endmodule
