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
	
	reg [7:0] sfx0_data, sfx1_data, sfx2_data, sfx3_data, sfx4_data;
	reg [7:0] sfx5_data, sfx6_data, sfx7_data, sfx8_data;
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
	reg [23:0] s4_rom_addr;
	reg [31:0] s4_duration;
	reg [23:0] s5_rom_addr;
	reg [31:0] s5_duration;
	reg [23:0] s6_rom_addr;
	reg [31:0] s6_duration;
	reg [23:0] s7_rom_addr;
	reg [31:0] s7_duration;
	reg [23:0] s8_rom_addr;
	reg [31:0] s8_duration;

// states defined
	localparam [3:0] off_state = 4'b0, wait_state = 4'b01, valid_state = 4'b10, load_state = 4'b11;

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
localparam S4_SWITCH = 5;
localparam S5_SWITCH = 6;
localparam S6_SWITCH = 7;
localparam S7_SWITCH = 8;
localparam S8_SWITCH = 9;
reg [3:0] s_select;

always @(*) begin
	case(s_select)
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
		S4_SWITCH:
			rom_addr <= s4_rom_addr;
		S5_SWITCH:
			rom_addr <= s5_rom_addr;	
		S6_SWITCH:
			rom_addr <= s6_rom_addr;
		S7_SWITCH:
			rom_addr <= s7_rom_addr;
		S8_SWITCH:
			rom_addr <= s8_rom_addr;
		default:
			rom_addr <= b_rom_addr;
	endcase
end
	
	

always @(posedge clk) begin
	if(state == valid_state) begin
		case(s_select)
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
			S4_SWITCH:
				sfx4_data <= rom_data;
			S5_SWITCH:
				sfx5_data <= rom_data;	
			S6_SWITCH:
				sfx6_data <= rom_data;
			S7_SWITCH:
				sfx7_data <= rom_data;
			S8_SWITCH:
				sfx8_data <= rom_data;
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
			valid_state: if(s_select < MAX_SOUND) next_state = load_state;
				 else next_state = off_state;
			default: next_state = off_state;
		endcase
	end
	
	always @(posedge clk) begin
		if (!rst)
			s_select <= 0;
		else if (state == off_state)
			s_select <= 0;
		else if (state == valid_state)
			s_select <= s_select + 1;
		else
			s_select <= s_select;
	end
	
	assign rom_load = (state == load_state);
//stores sound data in registers
	reg [23:0] tmp_rom_addr;
	reg [3:0] tmp_amp;
	reg [15:0] tmp_duration, tmp_duration_total;
	always @(posedge clk) begin
		if (!rst) begin
			b_rom_addr <= 24'h0454B9;
			b_duration <= 32'h0B6000;
			b_duration_total <= 32'h0B6000;
			s0_rom_addr <= 0;
			s0_duration <= 0;
			s1_rom_addr <= 0;
			s1_duration <= 0;
			s2_rom_addr <= 0;
			s2_duration <= 0;
			s3_rom_addr <= 0;
			s3_duration <= 0;
			s4_rom_addr <= 0;
			s4_duration <= 0;
			s5_rom_addr <= 0;
			s5_duration <= 0;
			s6_rom_addr <= 0;
			s6_duration <= 0;
			s7_rom_addr <= 0;
			s7_duration <= 0;
			s8_rom_addr <= 0;
			s8_duration <= 0;
			bamp <= 0;
			sfx_amp0 <= 0;
			sfx_amp1 <= 0;
			sfx_amp2 <= 0;
			sfx_amp3 <= 0;
			sfx_amp4 <= 0;
			sfx_amp5 <= 0;
			sfx_amp6 <= 0;
			sfx_amp7 <= 0;
			sfx_amp8 <= 0;
		end
		else begin
			if(mem_en && memwrite) begin
				if (sound_select == 0 || sound_select == 5 || sound_select == 10 || sound_select == 15 ||
					sound_select == 20 || sound_select == 25 || sound_select == 30 || sound_select == 35 ||
					sound_select == 40 || sound_select == 45) begin
					tmp_rom_addr [15:0] <= writedata;
				end
				else if (sound_select == 1 || sound_select == 6 || sound_select == 11 || sound_select == 16 ||
					sound_select == 21 || sound_select == 26 || sound_select == 31 || sound_select == 36 ||
					sound_select == 41 || sound_select == 46) begin
					tmp_rom_addr [23:16] <= writedata;
				end
				else if (sound_select == 2 || sound_select == 7 || sound_select == 12 || sound_select == 17 ||
					sound_select == 22 || sound_select == 27 || sound_select == 32 || sound_select == 37 ||
					sound_select == 42 || sound_select == 47) begin
					tmp_amp <= writedata[3:0];
				end
				else if (sound_select == 3 || sound_select == 8 || sound_select == 13 || sound_select == 18 ||
					sound_select == 23 || sound_select == 28 || sound_select == 33 || sound_select == 38 ||
					sound_select == 43 || sound_select == 48) begin
					tmp_duration <= writedata;
					tmp_duration_total <= writedata;
				end
				else if (sound_select == 4) begin
					b_rom_addr <= tmp_rom_addr;
					bamp <= tmp_amp;
					b_duration <= {writedata, tmp_duration};
					b_duration_total <= {writedata, tmp_duration};
				end	
				else if (sound_select == 9) begin
					s0_rom_addr <= tmp_rom_addr;
					sfx_amp0 <= tmp_amp;
					s0_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 14) begin
					s1_rom_addr <= tmp_rom_addr;
					sfx_amp1 <= tmp_amp;
					s1_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 19) begin
					s2_rom_addr <= tmp_rom_addr;
					sfx_amp2 <= tmp_amp;
					s2_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 24) begin
					s3_rom_addr <= tmp_rom_addr;
					sfx_amp3 <= tmp_amp;
					s3_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 29) begin
					s4_rom_addr <= tmp_rom_addr;
					sfx_amp4 <= tmp_amp;
					s4_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 34) begin
					s5_rom_addr <= tmp_rom_addr;
					sfx_amp5 <= tmp_amp;
					s5_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 39) begin
					s6_rom_addr <= tmp_rom_addr;
					sfx_amp6 <= tmp_amp;
					s6_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 44) begin
					s7_rom_addr <= tmp_rom_addr;
					sfx_amp7 <= tmp_amp;
					s7_duration  <= {writedata, tmp_duration};
				end
				else if (sound_select == 49) begin
					s8_rom_addr <= tmp_rom_addr;
					sfx_amp8 <= tmp_amp;
					s8_duration  <= {writedata, tmp_duration};
				end
			end
			if (en && load) begin
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
			end
		end
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
	assign sfx1 = s1_duration ? sfx1_data : 8'b0;
	assign sfx2 = s2_duration ? sfx2_data : 8'b0;
	assign sfx3 = s3_duration ? sfx3_data : 8'b0;
	assign sfx4 = s4_duration ? sfx4_data : 8'b0;
	assign sfx5 = s5_duration ? sfx5_data : 8'b0;
	assign sfx6 = s6_duration ? sfx6_data : 8'b0;
	assign sfx7 = s7_duration ? sfx7_data : 8'b0;
	assign sfx8 = s8_duration ? sfx8_data : 8'b0;
endmodule

