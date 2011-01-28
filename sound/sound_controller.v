`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////
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
////////////////////////////////////////////////////////////////////////////////
module sound_controller
	#(
		parameter BIT_DEPTH = 8,
		parameter DAC_BIT_DEPTH = 12,
		parameter SOUNDS = 9
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
		output rom_byte,
		output rom_load,
		output reg [23:0] rom_addr,
		
		// DAC outputs
		output [DAC_BIT_DEPTH-1:0] data
	);
	
	// Active low if byte addressed
	assign rom_byte = 1'b0;
	
	reg [7:0] sfx_out [SOUNDS-1:0];
	reg [7:0] sfx_data [SOUNDS-1:0];
	reg [3:0] sfx_amp [SOUNDS-1:0];
	
	// registers to store sound data
	reg [23:0] b_rom_addr;
	reg [31:0] b_duration;
	reg [31:0] b_duration_total;
	reg [23:0] s_rom_addr [SOUNDS-1:0];
	reg [31:0] s_duration [SOUNDS-1:0];

	// states defined
	localparam [3:0] off_state = 4'b0, wait_state = 4'b01, valid_state = 4'b10;
	localparam [3:0] load_state = 4'b11;

	reg [3:0] state, next_state;
	initial state = off_state;
	
	// synchronous active-low reset	
	always @(posedge clk)
	begin
		if (!rst) state <= off_state;
		else if (en) state <= next_state;
	end

	reg [3:0] s_select;

	always @(*) begin
		case(s_select)
			0: rom_addr <= b_rom_addr;
				
			genvar m;
			generate
				for (m = 0; m < SOUNDS; m = m + 1) begin: rom_addr_gen
					(1 + m): rom_addr <= s_rom_addr[m];
				end
			endgenerate
			
			default:
				rom_addr <= b_rom_addr;
		endcase
	end
	
	always @(posedge clk) begin
		if(state == valid_state) begin
			case(s_select)
				0: bground <= rom_data;
				
				genvar n;
				generate
					for (n = 0; n < SOUNDS; n = n + 1) begin: rom_addr_gen
						(1 + n): sfx_data[n] <= rom_data;
					end
				endgenerate
				
			endcase
		end
	end
	
	//define cominational logic for next_state
	always @(*)
	begin
		case (state)
			off_state: next_state <= !load ? off_state : load_state;
			load_state: next_state <= wait_state;
			wait_state: next_state <= !rom_ready ? wait_state : valid_state;
			valid_state: next_state <= (s_select < SOUND) ? load_state : off_state;
			default: next_state <= off_state;
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
	reg [15:0] tmp_duration;
	reg [23:0] b_rom_addr_first;
	always @(posedge clk) begin
		// reset states
		if (!rst) begin
			tmp_rom_addr <= 24'h0;
			tmp_amp <= 4'h0;
			tmp_duration <= 16'h0;
			b_rom_addr_first <= 24'h0;
			b_rom_addr <= 24'h0;
			b_rom_addr_first <= 24'h0;
			bamp <= 4'h0;
			b_duration <= 32'h0;
			b_duration_total <= 32'h0;
			
			genvar l;
			generate
				for (l = 0; l < SOUNDS; l = l + 1) begin: rst_gen
					s_rom_addr[l] <= 24'h0;
					s_duration[l] <= 32'h0;
					sfx_amp[l] <= 4'h0;
				end
			endgenerate
			
		end
		else begin
			// Temporary memory mapped registers. Upon write to duration_upper
			// all temporary registers are copied to the correct registers.
			if(mem_en && memwrite) begin
				if (sound_select == 0) begin
					tmp_rom_addr [15:0] <= writedata;
				end
				else if (sound_select == 1) begin
					tmp_rom_addr [23:16] <= writedata;
				end
				else if (sound_select == 2) begin
					tmp_amp <= writedata[3:0];
				end
				else if (sound_select == 3) begin
					tmp_duration <= writedata;
				end
			end
			
			// Background sound write
			if (mem_en && memwrite && sound_select == 4) begin
				b_rom_addr <= tmp_rom_addr;
				bamp <= tmp_amp;
				b_duration <= {writedata, tmp_duration};
				b_rom_addr_first <= tmp_rom_addr;
				b_duration_total <= {writedata, tmp_duration};
			end	
			else if (en && load) begin
				if (b_duration == 0) begin
					b_rom_addr <= b_rom_addr_first;
					b_duration <= b_duration_total;
				end
				else begin
					b_rom_addr <= b_rom_addr + 1;
					b_duration  <= b_duration - 1;
				end
			end
			
			// Generate statement generating register locations for each sound
			genvar k;
			generate
				for (k = 0; k < SOUNDS; k = k + 1) begin: memwrite_gen
					if (mem_en && memwrite && sound_select == (k + 5)) begin
						s_rom_addr[k] <= tmp_rom_addr;
						sfx_amp[k] <= tmp_amp;
						s_duration[k]  <= {writedata, tmp_duration};
					end
					else if (en && load && s_duration[k]) begin
						s_rom_addr[k] <= s_rom_addr[k] + 1;
						s_duration[k] <= s_duration[k] - 1;
					end
				end
			endgenerate
		end
	end
	
	assign memdata = 16'h0;
	
	// Outputs only the sounds which have not finished.
	genvar i;
	generate
		for (i = 0; i < SOUNDS; i = i + 1) begin: sfx_gen
			assign sfx_out[i] = s_duration[i] ? sfx_data[i] : 8'b0;
		end
	endgenerate
	
	// Sum the output of each sound
	wire [DAC_BIT_DEPTH-1:0] sum [SOUNDS-1:0];
	
	assign data = sum[0];
	assign sum[0] = ({bground, 3'b00} >> bg_amp)
		 + ({sfx_out[0], 2'b00} >> sfx_amp[0]);

	genvar j;
	generate
		for (j = 1; j < SOUNDS; j = j + 1) begin: sum_stage
			assign sum[i] = ({sfx_out[j], 2'b00} >> sfx_amp[j]) + sum[j-1];
		end
	endgenerate

endmodule

