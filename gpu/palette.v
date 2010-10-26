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
// transparent, but does not have to be any particular color. Upper 4 bits are the palette
// index and the lower 4 bits are the color index.
// Due to block ram implementation, the current palette uses a 256 x 32-bit block
// ram. Could possibly double the number of color palettes by increasing the size of the
// sprite object data palette number.
//////////////////////////////////////////////////////////////////////////////////
module palette
	(
		input clk,
		input [7:0] wrindex,
		input write,
		input [23:0] data,
		input enable,
		input [7:0] brightness,
		input [7:0] index,
		output [7:0] red,
		output [7:0] green,
		output [7:0] blue
	);
	
	reg [23:0] colorData [255:0];
	reg [7:0] redData, greenData, blueData;
	initial begin
		$readmemh("paletteRGB.dat", colorData);
	end
	
	wire [8:0] reducedRed, reducedGreen, reducedBlue;
	assign reducedRed = redData - (255 - brightness);
	assign reducedGreen = greenData - (255 - brightness);
	assign reducedBlue = blueData - (255 - brightness);
	
	// If the reduced value is positive, output the value, otherwise 0.
	assign red = !reducedRed[8] ? reducedRed[7:0] : 0;
	assign green = !reducedGreen[8] ? reducedGreen[7:0] : 0;
	assign blue = !reducedBlue[8] ? reducedBlue[7:0] : 0;
		
	always @(posedge clk) begin
		if (write) begin
			colorData[wrindex] <= data;
		end
		if (enable) begin
			redData <= colorData[index][23:16];
			greenData <= colorData[index][15:8];
			blueData <= colorData[index][7:0];
		end
		else begin
			redData <= 0;
			greenData <= 0;
			blueData <= 0;
		end
		
	end
endmodule
