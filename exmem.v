`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Jacob Sanders
// 
// Design Name: Program Memory
// Module Name: exmem 
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module exmem #(parameter WIDTH = 16, RAM_ADDR_BITS = 13)
   (input clk, en,
    input memwrite,
    input [RAM_ADDR_BITS-1:0] adr, pcaddr,
    input [WIDTH-1:0] writedata,
    output reg [WIDTH-1:0] programout,
    output reg [WIDTH-1:0] instruction
    );

   reg [WIDTH-1:0] program_ram [(2**RAM_ADDR_BITS)-1:0];

	initial
		$readmemh("program.dat", program_ram);

   always @(posedge clk) begin
      if (en) begin
			if (memwrite)
				program_ram[adr] <= writedata;
			programout <= program_ram[adr];
      end
		instruction <= program_ram[pcaddr];
	end		
endmodule
