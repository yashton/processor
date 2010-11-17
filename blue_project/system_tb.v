`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:43:45 11/10/2010
// Design Name:   system
// Module Name:   U:/blue/blue_project/system_tb.v
// Project Name:  blue
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: system
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module system_tb;

	// Inputs
	reg clk;
	reg rst;
	reg [7:0] switches;

	// Outputs
	wire [7:0] test_out;

	// Instantiate the Unit Under Test (UUT)
	system uut (
		.clk(clk), 
		.rst(rst), 
		.switches(switches)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 0;
		switches = 4;

		// Wait 100 ns for global reset to finish
		#100;
      rst = 1;
		// Add stimulus here

	end
      
	always begin
		#10 clk = ~clk;
	end
endmodule

