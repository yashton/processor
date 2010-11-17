`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Direct memory access controller.
// Module Name: dma
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module dma
	#(
		parameter WIDTH = 16,
		parameter ROM_ADDR = 23,
		parameter WR_SRC_L = 0,
		parameter WR_SRC_U = 1,
		parameter WR_DST = 2,
		parameter WR_AMT = 3
	)
	(
		// system interface
		input clk,
		input rst,
		// romController interface
		output reg [ROM_ADDR-1:0] src_addr,
		output reg load_rom,
		input [WIDTH-1:0] src_data,
		input ready,
		// memory interface
		output reg [15:0] dst_addr,
		output dst_write,
		output [15:0] dst_data,
		output proc_en,
		// system interface
		input en,
		input write,
		input [1:0] wr_mode,
		input [WIDTH-1:0] ctrl_data
	);
	
	reg [15:0] amount;
	wire busy;
	
	assign dst_data = src_data;
	assign dst_write = ready;
	assign busy = amount != 0;
	assign proc_en = !busy;
	
	always @(posedge clk) begin
		if (!rst) begin
			src_addr <= 0;
			dst_addr <= 0;
			amount <= 0;
		end
		else if (en && write) begin
			case (wr_mode)
				WR_SRC_L: src_addr[WIDTH-1:0] <= ctrl_data;
				WR_SRC_U: src_addr[ROM_ADDR-1:WIDTH] <= ctrl_data;
				WR_DST: dst_addr <= ctrl_data;
				WR_AMT: begin
						amount <= ctrl_data;
						load_rom <= 1;
					end
			endcase
		end
		else if (busy && ready) begin
			src_addr <= src_addr + 1;
			dst_addr <= dst_addr + 1;
			amount <= amount - 1;
			load_rom <= 1;
		end
		else begin
			load_rom <= 0;
		end
	end
endmodule
