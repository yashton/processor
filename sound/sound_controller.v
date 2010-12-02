`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:08:07 11/15/2010 
// Design Name: 
// Module Name:    sound_controller 
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
module sound_controller
	#(
		parameter MAX_SOUND = 5
	)
	(
		input clk,
		input rst,
		input load,
		input en,
		// mem map
		input mem_en,
		input memwrite,
		input [15:0] writedata,
		input [6:0] sound_select,
		output reg [15:0] mem_data,
		
		// ROM
		input [7:0] rom_data,
		input rom_ready,
		input [7:0] sound,
		output rom_load,
		output reg [23:0] rom_addr,
		
		// mixer outputs
		output reg [7:0] bground,
		output reg [3:0] bamp,
		output [7:0] sfx0, sfx1, sfx2, sfx3, sfx4, sfx5, sfx6, sfx7, sfx8,
		
		output reg [3:0] sfx_amp0,
		output reg [3:0] sfx_amp1,
		output reg [3:0] sfx_amp2,
		output reg [3:0] sfx_amp3,
		output reg [3:0] sfx_amp4,
		output reg [3:0] sfx_amp5,
		output reg [3:0] sfx_amp6,
		output reg [3:0] sfx_amp7,
		output reg [3:0] sfx_amp8
    );
	
	reg [7:0] sfx0_data, sfx1_data, sfx2_data, sfx3_data;
// registers to store sound data
	reg [23:0] b_rom_addr;
	reg [31:0] b_duration;
	reg [31:0] b_duration_total;
	reg [23:0] s0_rom_addr;
	reg [31:0] s0_duration;
	reg [23:0] s1_rom_addr;
	reg [31:0] s1_duration;
	reg [23:0] s2_rom_addr;
	reg [31:0] s2_duration;
	reg [23:0] s3_rom_addr;
	reg [31:0] s3_duration;
//	reg [23:0] s4_rom_addr;
//	reg [31:0] s4_duration;
//	reg [23:0] s5_rom_addr;
//	reg [31:0] s5_duration;
//	reg [23:0] s6_rom_addr;
//	reg [31:0] s6_duration;
//	reg [23:0] s7_rom_addr;
//	reg [31:0] s7_duration;
//	reg [23:0] s8_rom_addr;
//	reg [31:0] s8_duration;

// states defined
	parameter [1:0] off_state = 2'b0, wait_state = 2'b01, valid_state = 2'b10, load_state = 2'b11;

	reg [3:0] state, next_state;
	initial state = off_state;
	
// synchronous active-low reset	
	always @(posedge clk)
	begin
		if (!rst) state <= off_state;
		else if (en) state <= next_state;
	end

localparam BG_SWITCH = 0;
localparam S0_SWITCH = 1;
localparam S1_SWITCH = 2;
localparam S2_SWITCH = 3;
localparam S3_SWITCH = 4;
//localparam S4_SWITCH = 5;
//localparam S5_SWITCH = 6;
//localparam S6_SWITCH = 7;
//localparam S7_SWITCH = 8;
//localparam S8_SWITCH = 9;
reg [3:0] sound_sound_select;

always @(*) begin
	case(sound_sound_select)
		BG_SWITCH:
			rom_addr <= b_rom_addr;
		S0_SWITCH:
			rom_addr <= s0_rom_addr;
		S1_SWITCH:
			rom_addr <= s1_rom_addr;
		S2_SWITCH:
			rom_addr <= s2_rom_addr;
		S3_SWITCH:
			rom_addr <= s3_rom_addr;
//		S4_SWITCH:
//			rom_addr <= s4_rom_addr;
//		S5_SWITCH:
//			rom_addr <= s5_rom_addr;	
//		S6_SWITCH:
//			rom_addr <= s6_rom_addr;
//		S7_SWITCH:
//			rom_addr <= s7_rom_addr;
//		S8_SWITCH:
//			rom_addr <= s8_rom_addr;
	endcase
end
	
	

always @(*) begin
	if(state == valid_state) begin
		case(sound_sound_select)
			BG_SWITCH:
				bground <= rom_data;
			S0_SWITCH:
				sfx0_data <= rom_data;
			S1_SWITCH:
				sfx1_data <= rom_data;
			S2_SWITCH:
				sfx2_data <= rom_data;
			S3_SWITCH:
				sfx3_data <= rom_data;
//			S4_SWITCH:
//				sfx4 <= rom_data;
//			S5_SWITCH:
//				sfx5 <= rom_data;	
//			S6_SWITCH:
//				sfx6 <= rom_data;
//			S7_SWITCH:
//				sfx7 <= rom_data;
//			S8_SWITCH:
//				sfx8 <= rom_data;
		endcase
	end
end

//counter
	reg count;
	always @(posedge clk)
	begin
		if(count < 40)
			count <= count + 1;
		else
			count <= 0;
	end
	
//define cominational logic for next_state
	always @(*)
	begin
		case (state)
			off_state: if(!load) next_state = off_state;
				 else next_state = load_state;
			load_state: next_state = wait_state;
			wait_state: if(!rom_ready) next_state = wait_state;
				 else next_state = valid_state;
			valid_state: if(sound_sound_select < MAX_SOUND) next_state = load_state;
				 else next_state = off_state;
			default: next_state = off_state;
		endcase
	end
	
	always @(posedge clk) begin
		if (!rst)
			sound_sound_select <= 0;
		else if (state == off_state)
			sound_sound_select <= 0;
		else if (state == valid_state)
			sound_sound_select <= sound_sound_select + 1;
		else
			sound_sound_select <= sound_sound_select;
	end
	
	assign rom_load = (state == load_state);
//stores sound data in registers 
	always @(posedge clk) begin
		case (sound_select)
			0: b_rom_addr [15:0] <= writedata;
			1: b_rom_addr [23:16] <= writedata;
			2: bamp [3:0] <= writedata;
			3: begin 
					b_duration [15:0] <= writedata;
					b_duration_total [15:0] <= writedata;
				end
			4: begin
					b_duration [31:16] <= writedata;
					b_duration_total [31:16] <= writedata;
				end
			5: s0_rom_addr [15:0] <= writedata;
			6: s0_rom_addr [23:16] <= writedata;
			7: sfx_amp0 [3:0] <= writedata;
			8: s0_duration [15:0] <= writedata;
			9: s0_duration [31:16] <= writedata;
			10: s1_rom_addr [15:0] <= writedata;
			11: s1_rom_addr [20:16] <= writedata;
			12: sfx_amp1 [3:0] <= writedata;
			13: s1_duration [15:0] <= writedata;
			14: s1_duration [31:16] <= writedata;
			15: s2_rom_addr [15:0] <= writedata;
			16: s2_rom_addr [23:16] <= writedata;
			17: sfx_amp2 [3:0] <= writedata;
			18: s2_duration [15:0] <= writedata;
			19: s2_duration [31:16] <= writedata;
			20: s3_rom_addr [15:0] <= writedata;
			21: s3_rom_addr [23:16] <= writedata;
			22: sfx_amp3 [3:0] <= writedata;
			23: s3_duration [15:0] <= writedata;
			24: s3_duration [31:16] <= writedata;
//			25: s4_rom_addr [15:0] <= writedata;
//			26: s4_rom_addr [23:16] <= writedata;
//			27: sfx_amp4 [3:0] <= writedata;
//			28: s4_duration [15:0] <= writedata;
//			29: s4_duration [31:16] <= writedata;
//			30: s5_rom_addr [15:0] <= writedata;
//			31: s5_rom_addr [23:16] <= writedata;
//			32: sfx_amp5 [3:0] <= writedata;
//			33: s5_duration [15:0] <= writedata;
//			34: s5_duration [31:16] <= writedata;
//			35: s6_rom_addr [15:0] <= writedata;
//			36: s6_rom_addr [23:16] <= writedata;
//			37: sfx_amp6 [3:0] <= writedata;
//			38: s6_duration [15:0] <= writedata;
//			39: s6_duration [31:16] <= writedata;
//			40: s7_rom_addr [15:0] <= writedata;
//			41: s7_rom_addr [23:16] <= writedata;
//			42: sfx_amp7 [3:0] <= writedata;
//			43: s7_duration [15:0] <= writedata;
//			44: s7_duration [31:16] <= writedata;
//			45: s8_rom_addr [15:0] <= writedata;
//			46: s8_rom_addr [23:16] <= writedata;
//			47: sfx_amp8 [3:0] <= writedata;
//			48: s8_duration [15:0] <= writedata;
//			49: s8_duration [31:16] <= writedata;		
		endcase
	end
	
	always @(posedge clk) begin
		case (sound_select)
			0:  mem_data <= b_rom_addr [15:0];
			1:  mem_data <= b_rom_addr [23:16];
			2:  mem_data <= bamp [3:0];
			3:	 mem_data <= b_duration[15:0];
			4:  mem_data <= b_duration[31:16];
			5:  mem_data <= s0_rom_addr [15:0];
			6:  mem_data <= s0_rom_addr [23:16];
			7:  mem_data <= sfx_amp0[3:0];
			8:  mem_data <= s0_duration [15:0];
			9:  mem_data <= s0_duration [31:16];
			10: mem_data <= s1_rom_addr [15:0];
			11: mem_data <= s1_rom_addr [20:16];
			12: mem_data <= sfx_amp1 [3:0];
			13: mem_data <= s1_duration [15:0];
			14: mem_data <= s1_duration [31:16];
			15: mem_data <= s2_rom_addr [15:0];
			16: mem_data <= s2_rom_addr [23:16];
			17: mem_data <= sfx_amp2 [3:0];
			18: mem_data <= s2_duration [15:0];
			19: mem_data <= s2_duration [31:16];
			20: mem_data <= s3_rom_addr [15:0];
			21: mem_data <= s3_rom_addr [23:16];
			22: mem_data <= sfx_amp3 [3:0];
			23: mem_data <= s3_duration [15:0];
			24: mem_data <= s3_duration [31:16];	
		endcase
	end
	
	
	assign sfx0 = s0_duration ? sfx0_data : 8'b0;
	assign sfx1 = s1_duration ? sfx0_data : 8'b0;
	assign sfx2 = s2_duration ? sfx0_data : 8'b0;
	assign sfx3 = s3_duration ? sfx0_data : 8'b0;
	//assign sfx4 = s4_duration ? sfx0_data : 8'b0;
	//assign sfx5 = s5_duration ? sfx0_data : 8'b0;
	//assign sfx6 = s6_duration ? sfx0_data : 8'b0;
	//assign sfx7 = s7_duration ? sfx0_data : 8'b0;
	
	always @(posedge clk) begin
		if (en) begin
			b_rom_addr <= b_rom_addr + 1;
			if (b_duration == 0)
				b_duration <= b_duration_total;
			else
				b_duration  <= b_duration - 1;
			
			s0_rom_addr <= s0_rom_addr + 1;
			if(s0_duration)
				s0_duration <= s0_duration - 1;
			s1_rom_addr <= s1_rom_addr + 1;
			if (s1_duration)
				s1_duration <= s1_duration - 1;
			s2_rom_addr <= s2_rom_addr + 1;
			if(s2_duration)
				s2_duration <= s2_duration - 1;
			s3_rom_addr <= s3_rom_addr + 1;
			if (s3_duration)
				s3_duration <= s3_duration - 1;
//			s4_rom_addr <= s4_rom_addr + 1;
//			if(s4_duration)
//				s4_duration <= s4_duration - 1;
//			s5_rom_addr <= s5_rom_addr + 1;
//			if(s5_duration)
//				s5_duration <= s5_duration - 1;
//			s6_rom_addr <= s6_rom_addr + 1;
//			if (s6_duration)
//				s6_duration <= s6_duration - 1;
//			s7_rom_addr <= s7_rom_addr + 1;
//			if(s7_duration)
//				s7_duration <= s7_duration - 1;
//			s8_rom_addr <= s8_rom_addr + 1;
//			if (s8_duration)
//				s8_duration <= s8_duration - 1;
		end
	end
endmodule

