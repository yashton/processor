`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: GPU pixel combination.
// Module Name: pixel_logic
// Project Name: CS3710
// Description: Takes existing data provided from the current line back buffer
// and updates it with the 
//////////////////////////////////////////////////////////////////////////////////
module pixel_logic
	(
		input first,
		input [1:0] offset,
		input [1:0] line_z,
		input [3:0] line_palette,
		input [31:0] tile_data,
		input [11:0] previous,
		output [11:0] previous_out,
		input [31:0] pixel_in_data,
		input [3:0] pixel_in_updated,
		input [7:0] pixel_in_z,
		output [31:0] pixel_out_data,
		output [3:0] pixel_out_updated,
		output [7:0] pixel_out_z
	);

	wire [3:0] sliceA, sliceB, sliceC, sliceD, sliceE, sliceF, sliceG, sliceH;
	assign sliceA = tile_data[3:0];
	assign sliceB = tile_data[7:4];
	assign sliceC = tile_data[11:8];
	assign sliceD = tile_data[15:12];
	assign sliceE = tile_data[19:16];
	assign sliceF = tile_data[23:20];
	assign sliceG = tile_data[27:24];
	assign sliceH = tile_data[31:28];
	
	assign previous_out = {sliceH, sliceG, sliceF}; 
	
	wire [3:0] previousF, previousG, previousH;
	assign previousH = previous[11:8];
	assign previousG = previous[7:4];
	assign previousF = previous[3:0];
	
	// mux wires and conditions
	reg [3:0] dataW, dataX, dataY, dataZ;
	wire [2:0] test;
	assign test = {first, offset};
	
	always @(*) begin
		case (test)
			0: dataZ = sliceD;
			1: dataZ = sliceC;
			2: dataZ = sliceB;
			3: dataZ = sliceA;
			4: dataZ = sliceH;
			5: dataZ = sliceG;
			6: dataZ = sliceF;
			7: dataZ = sliceE;
			default: dataZ = sliceD;
		endcase
	end
	
	always @(*) begin
		case (test)
			0: dataY = sliceC;
			1: dataY = sliceB;
			2: dataY = sliceA;
			3: dataY = previousH;
			4: dataY = sliceG;
			5: dataY = sliceF;
			6: dataY = sliceE;
			7: dataY = sliceD;
			default: dataY = sliceC;
		endcase
	end
	
	always @(*) begin
		case (test)
			0: dataX = sliceB;
			1: dataX = sliceA;
			2: dataX = previousH;
			3: dataX = previousG;
			4: dataX = sliceG;
			5: dataX = sliceF;
			6: dataX = sliceE;
			7: dataX = sliceD;
			default: dataX = sliceB;
		endcase
	end
	
	always @(*) begin
		case (test)
			0: dataW = sliceA;
			1: dataW = previousH;
			2: dataW = previousG;
			3: dataW = previousF;
			4: dataW = sliceE;
			5: dataW = sliceD;
			6: dataW = sliceC;
			7: dataW = sliceB;
			default: dataW = sliceA;
		endcase
	end
	
	assign pixel_out_updated[3] = !pixel_in_updated[3] || ((dataZ != 0) && line_z > pixel_in_z[7:6]);
	assign pixel_out_updated[2] = !pixel_in_updated[2] || ((dataY != 0) && line_z > pixel_in_z[5:4]);
	assign pixel_out_updated[1] = !pixel_in_updated[1] || ((dataX != 0) && line_z > pixel_in_z[3:2]);
	assign pixel_out_updated[0] = !pixel_in_updated[0] || ((dataW != 0) && line_z > pixel_in_z[1:0]);
		
	assign pixel_out_z[7:6] = pixel_out_updated[3] ? line_z : pixel_in_z[7:6];
	assign pixel_out_z[5:4] = pixel_out_updated[2] ? line_z : pixel_in_z[5:4];
	assign pixel_out_z[3:2] = pixel_out_updated[1] ? line_z : pixel_in_z[3:2];
	assign pixel_out_z[1:0] = pixel_out_updated[0] ? line_z : pixel_in_z[1:0];
	
	wire [7:0] combined_z, combined_y, combined_x, combined_w;
	assign combined_z = {line_palette, dataZ};
	assign combined_y = {line_palette, dataY};
	assign combined_x = {line_palette, dataX};
	assign combined_w = {line_palette, dataW};
	
	assign pixel_out_data[31:24] = pixel_out_updated[3] ? combined_z : pixel_in_data[31:24];
	assign pixel_out_data[23:16] = pixel_out_updated[2] ? combined_y : pixel_in_data[23:16];
	assign pixel_out_data[15:8] = pixel_out_updated[1] ? combined_x : pixel_in_data[15:8];
	assign pixel_out_data[7:0] = pixel_out_updated[0] ? combined_w : pixel_in_data[7:0];
endmodule
