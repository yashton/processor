`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: GPU line buffer.
// Module Name: line_buffer
// Project Name: CS3710
// Description: Provides memory for storing the line buffer updated state. Line
// buffer entries may be stale, so each pixel needs an updated flag. This state
// needs to updated by the current scan line, read by the back line output,
// and cleared once read. This is implemented by having three distributed RAM
// modules, each in a different cycle based off the current scanline address.
// The following table lists which cycle each buffer is going through, based on
// update_switch.
//		(update)	(read)	(clear)
// 0	back			middle	front
// 1	front			back		middle
// 2	middle		front		back
//////////////////////////////////////////////////////////////////////////////////
module pixel_updated
	(
		input clk,
		input [1:0] update_switch,
		input [7:0] pixel_addr,
		input write_pixel,
		input [3:0] pixel_write_updated,
		output [3:0] pixel_read_updated,
		// Dual port output
		input [9:0] x,
		output enable
	);
	
	reg [7:0] clear_x;
	always @(posedge clk) begin
		clear_x <= clear_x + 1;
	end
	
	wire write_updated_front, write_updated_middle, write_updated_back;
	assign write_updated_front = (write_pixel && update_switch == 1) || update_switch == 0;
	assign write_updated_middle = (write_pixel && update_switch == 2) || update_switch == 1;
	assign write_updated_back =  (write_pixel && update_switch == 0) || update_switch == 2;
	
	wire [7:0] partial_x;
	wire [1:0] offset_x;
	assign partial_x = x[9:2];
	assign offset_x = x[1:0];
	wire [7:0] clear_x;
	
	reg [7:0] front_addr, middle_addr, back_addr;
	wire [3:0] enable_block;
	reg [3:0] updated_data, updated_data_front, updated_data_middle, updated_data_back;
	wire [3:0] front_data, middle_data, back_data;
	
	assign updated_data = pixel_write_updated | pixel_read_updated;
	
	reg front_enable;
	reg middle_enable;
	reg back_enable;
	
	pixel_updated pixel_updated_front(.a(front_addr), .d(updated_data_front), .we(write_updated_front), .clk(clk), .spo(front_data));
	pixel_updated pixel_updated_middle(.a(middle_addr), .d(updated_data_middle), .we(write_updated_middle), .clk(clk), .spo(middle_data));
	pixel_updated pixel_updated_back(.a(back_addr), .d(updated_data_back), .we(write_updated_back), .clk(clk), .spo(back_data));
	
	always @(*) begin
		case(update_switch)
			0: front_addr <= clear_x;
			1: front_addr <= pixel_addr;
			2: front_addr <= partial_x;
			default: front_addr <= pixel_addr;
		endcase
	end
	
	always @(*) begin
		case(update_switch)
			0: middle_addr <= partial_x;
			1: middle_addr <= clear_x;
			2: middle_addr <= pixel_addr;
			default: middle_addr <= pixel_addr;
		endcase
	end
	
	always @(*) begin
		case(update_switch)
			0: back_addr <= pixel_addr;
			1: back_addr <= partial_x;
			2: back_addr <= clear_x;
			default: back_addr <= pixel_addr;
		endcase
	end
	
	always @(*) begin
		case(update_switch)
			1: updated_data_front <= updated_data;
			default: updated_data_front <= 4'h0;
		endcase
	end
	
	always @(*) begin
		case(update_switch)
			2: updated_data_middle <= updated_data;
			default: updated_data_middle <= 4'h0;
		endcase
	end
	
	always @(*) begin
		case(update_switch)
			0: updated_data_back <= updated_data;
			default: updated_data_back <= 4'h0;
		endcase
	end
	
	always @(*) begin
		case(update_switch)
			0: pixel_read_updated <= back_data;
			1: pixel_read_updated <= front_data;
			2: pixel_read_updated <= middle_data;
			default: pixel_read_updated <= front_data;
		endcase
	end
	
	always @(*) begin
		case(update_switch)
			0: enable_block <= middle_data;
			1: enable <= back_data;
			2: enable <= front_data;
			default: enable <= middle_data;
		endcase
	end
	
	// output switching of enable signal.
	always @(*) begin
		case (offset_x)
			0: enable <= enable_block[0];
			1: enable <= enable_block[1];
			2: enable <= enable_block[2];
			3: enable <= enable_block[3];
			default: enable <= enable_block[0];
		endcase
	end
endmodule
