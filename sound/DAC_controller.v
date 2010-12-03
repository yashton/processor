`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:51 11/14/2010 
// Design Name: 
// Module Name:    DAC_controller 
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
module DAC_controller
	#(
		parameter COMMAND = 4'b0011,
		parameter ADDR = 4'b0
	)
	(
		input clk, 
		input rst,
		input load,
		input en,
		input [11:0] total_sound,
		output MOSI,
		output SCK
    );
	 	 
	reg [31:0] data;
	reg [4:0] count;
	assign MOSI = data[0];
	assign SCK = clk;
	
	//parallel in serial out shift register 
   always @(posedge clk) begin
      if (!rst) begin
         data <= 0;
      end
      else if (load && SCK) begin
         data <= {8'b11111111, COMMAND, ADDR, total_sound, 4'b0};
      end
      else if (en && SCK && count < 32) begin
         data <= data >> 1;
			count <= count + 1;
      end
	end
					
endmodule
