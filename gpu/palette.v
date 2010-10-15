`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: VGA pallete color lookup tables.
// Module Name: palette
// Project Name: CS3710
// Description: Generates a 24-bit color from a set of color palettes.
// A 256 color 24-bit color palette is 6144 bits or 768 bytes.
// Logically divided into 16 palettes, each with 16 colors. Color 0 is considered
// transparent, but does not have to any particular color. Upper 4 bits are the palette
// index and the lower 4 bits are the color index.
// Due to block ram implementation, the current palette uses a 256 x 32-bit block
// ram. Could possibly double the number of color palettes by increasing the size of the
// sprite object data palette number.
//////////////////////////////////////////////////////////////////////////////////
module palette
	(
		input clk,
		input [7:0] index,
		input write,
		input [23:0] data,
		input [7:0] brightness,
		input [7:0] outindex,
		output reg [7:0] red,
		output reg [7:0] green,
		output reg [7:0] blue
	);
	
	reg [31:0] colorData [255:0];
	
	initial begin
		$readmemh("paletteRGB.dat", redGreenData);
	end
	
	always @(posedge clk) begin
		if (write) begin
			colorData[index] <= data;
		end
		red <= colorData[outindex][23:16] > brightness ? redGreenData[outindex][23:16] - brightness : 0;
		green <= colorData[outindex][15:8] > brightness ? redGreenData[outindex][15:8] - brightness : 0;
		blue <= colorData[outindex][7:0] > brightness ? blueData[outindex][7:0] - brightness : 0;
	end
endmodule
