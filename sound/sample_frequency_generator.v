`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    19:33:08 12/01/2010 
// Design Name: 
// Module Name:    timing_controller 
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
module sample_frequency_generator(
		input clk,
		input rst,
		output spi_mux,
		output flash_cs,
		output DAC_cs,
		output DAC_load,
		output sound_load
    );

	reg [10:0] count;
	always @(posedge clk) begin
		if(!rst)
			count <= 0;
		else if (count < 1134)
			count <= count + 1;
		else
			count <= 0;
	end
	assign sound_load = (count == 0);

	parameter flash_lt = 1100;
	assign DAC_cs = !flash_cs;
	assign flash_cs = !(count >= 0 & count < flash_lt);
	assign spi_mux = flash_cs;
	assign DAC_load = (count == flash_lt);
endmodule
