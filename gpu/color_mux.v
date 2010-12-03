module color_mux
	(
	input [8:0] sprite_index, bg_index,
	input sprite_enable,
	output [8:0] index
	);
	
	assign index = (sprite_enable && sprite_index[3:0] != 4'b0000) ? sprite_index : bg_index;
endmodule