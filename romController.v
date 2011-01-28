`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Flash ROM controller.
// Module Name: romController
// Project Name: CS3710
// Description: This is an access module for the Intel StrataFlash ROM running
// in paged read mode.
// When load is asserted, the controller handles data aquisition from the ROM at
// the given address. When the data is available to be used, the ready line is 
// asserted. 
// Addressing is by byte. For 16 byte reads, set byte to high, and assert the 
// word address as a byte address (shift left by 1). 
// If data is
//////////////////////////////////////////////////////////////////////////////////
module romController
	#(
		parameter WIDTH = 16,
		parameter ROM_ADDR = 24,
		parameter PAGE_SIZE = 4,
		parameter P_MISS = 4, // clock cycles required for a page miss
		parameter P_HIT = 2 // clock cycles require for page hit
	)
	(
		input clk,
		input rst,
		// system interface.
		input [ROM_ADDR-1:0] addr,
		input load,
		input byte,
		output [WIDTH-1:0] data,
		output ready,
		// pin interface
		input [WIDTH-1:0] SF_D,
		output [ROM_ADDR-1:0] SF_A,
		output SF_CE0,
		output SF_OE,
		output SF_WE,
		output SF_BYTE
	);
	reg [ROM_ADDR-1:PAGE_SIZE] page;
	reg [PAGE_SIZE-1:0] word;
	// These registers should be [log2(P_MISS)+1:0]. These just have extra.
	reg [P_MISS:0] top;
	reg [P_MISS:0] delay;
	
	// See the StrataFlash data sheet.
	// These signals configure a read mode.
	assign SF_CE0 = 0;
	assign SF_OE = 0;
	assign SF_WE = 1;
	// Configures in byte or word mode. Active low for byte
	assign SF_BYTE = byte;
	// SF_A addresses are byte addresses
	assign SF_A = {page, word};

	assign data = SF_D;

	// Data is ready after the specified number of delay cycles is up.
	assign ready = !(delay < top);

	always @(posedge clk)	begin
		if (!rst) begin
			top <= P_MISS - 1;
			page <= 0;
			word <= 0;
			delay <= 0;
		end
		else if (load) begin
			top <= (page == addr[ROM_ADDR-1:PAGE_SIZE]) ? P_HIT - 1: P_MISS - 1;
			page <= addr[ROM_ADDR-1:PAGE_SIZE];
			word <= addr[PAGE_SIZE-1:0];
			delay <= 0;
		end
		else if (!ready) begin
			delay <= delay + 1;
		end
	end
	
endmodule
