`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Background color selection mux
// Module Name: color_mux
// Project Name: CS3710
// Description: This module is responsible for switching between the background
// and the data from the sprite. Selects the sprite if enabled and not transparent.
//////////////////////////////////////////////////////////////////////////////////
module color_mux
	(
		input [8:0] sprite_index, bg_index,
		input sprite_enable,
		output [8:0] index
	);

	assign index = (sprite_enable && sprite_index[3:0] != 4'b0000) ? sprite_index : bg_index;
endmodule