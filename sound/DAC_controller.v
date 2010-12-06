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
		parameter ADDR = 4'b1111
	)
	(
		input clk, 
		input rst,
		input load,
		input cs,
		input [11:0] total_sound,
		output MOSI,
		output reg SCK,
		output CLR
    );
	 	 
	reg [31:0] data;
	reg [5:0] count;
	assign MOSI = data[31];
	always @(posedge clk) begin
		if (!rst)
			SCK <= 0;
		else
			SCK <= !SCK;
	end
	assign CLR = 1;
	//parallel in serial out shift register 
   always @(posedge clk) begin
      if (!rst) begin
         data <= 0;
			count <= 0;
      end
      else if (load) begin
         data <= {8'b11111111, COMMAND, ADDR, total_sound, 4'b0};
			count <= 6'd32;
      end
      else if (!cs && SCK && count > 0) begin
         data <= data << 1;
			count <= count - 1;
      end
			
	end
					
endmodule
