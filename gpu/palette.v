`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: VGA pallete color lookup tables.
// Module Name: palette
// Project Name: CS3710
// Description: Generates a 24-bit color from a set of color palettes.
// Logically divided into 32 palettes, each with 16 colors. Color 0 is considered
// transparent, but does not have to be any particular color. Upper 5 bits are the palette
// index and the lower 4 bits are the color index.
// Due to block ram implementation, the current palette uses a 512 x 32-bit block
// ram. When accessing colors using the system memory bus, even addresses are {green, red}
// and odd addresses are {unused, blue}.
// Brightness is a scaling factor used for screen fading. 0 is fully off, 255 is full brightness
//////////////////////////////////////////////////////////////////////////////////
module palette
	(
		input clk,
		input [7:0] brightness,
		input [8:0] index,
		output [7:0] red,
		output [7:0] green,
		output [7:0] blue,
		// System memory mapped hooks
		input memenable,
		input [9:0] memaddr,
		input memwrite,
		input [15:0] writedata,
		output [15:0] memdata
	);
	
	wire [31:0] colorData;
	wire [7:0] redData, greenData, blueData;
	assign redData = colorData[7:0];
	assign greenData = colorData[15:8];
	assign blueData = colorData[23:16];
	
	// Brightness is calculated by subtracting the amount left over from the color.
	wire [8:0] reducedRed, reducedGreen, reducedBlue;
	assign reducedRed = redData - (255 - brightness);
	assign reducedGreen = greenData - (255 - brightness);
	assign reducedBlue = blueData - (255 - brightness);
	
	// If the reduced value is positive, output the value, otherwise 0.
	assign red = !reducedRed[8] ? reducedRed[7:0] : 0;
	assign green = !reducedGreen[8] ? reducedGreen[7:0] : 0;
	assign blue = !reducedBlue[8] ? reducedBlue[7:0] : 0;
		
	palette_vram palette_ram(
		.addra(index), .dina(32'b0), .wea(1'b0), .clka(clk), .douta(colorData),
		.addrb(memaddr), .dinb(writedata), .enb(memenable), .web(memwrite), .clkb(clk), .doutb(memdata));
endmodule
