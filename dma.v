`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Direct memory access controller.
// Module Name: dma
// Project Name: CS3710
// Description: When activated through the memory mapped interface, halts execution
// of the processor until the amount specified is copied from the ROM into main
// memory.
//////////////////////////////////////////////////////////////////////////////////
module dma
	#(
		parameter WIDTH = 16,
		parameter ROM_ADDR = 24,
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
		output reg [ROM_ADDR-1:0] rom_addr,
		output reg load_rom,
		output byte,
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
	
	assign byte = 1'b1;
	assign rom_addr = {src_addr, 1'b0};
	
	reg [ROM_ADDR-2:0] src_addr;
	
	reg [15:0] amount;
	wire busy;
	
	assign dst_data = src_data;
	// Once the data has been loaded from ROM, write to memory
	assign dst_write = ready;
	// Runs until amount has been copied.
	assign busy = amount != 0;
	// As long as data is still being copied, suspend processor.
	assign proc_en = !busy;
	
	always @(posedge clk) begin
		if (!rst) begin
			src_addr <= 0;
			dst_addr <= 0;
			amount <= 0;
		end
		else if (en && write) begin
			// Multiplex the input from the memory map into appropriate registers
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
			// If the system is copying, wait until ready, then advance to next location.
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
