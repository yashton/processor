`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:38:08 11/30/2010 
// Design Name: 
// Module Name:    spi_flash_controller 
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
module spi_flash_controller(
		input clk,
		input [23:0] rom_addr,
		input en,
		input rst,
		input load,
		input MISO,
		output MOSI,
		output reg flash_ready,
		output SCK,
		output [7:0] rom_data
    );
	reg [39:0] data;
	reg [4:0] reduction_counter;
	always @ (posedge clk) begin
		if(reduction_counter)
			reduction_counter <= reduction_counter - 1;
		else
			reduction_counter <= 5;	
	end
	assign SCK = (reduction_counter == 0) ;
//Output Logic
	assign MOSI = data[39];
	assign rom_data = data[7:0];
	reg [5:0] count;
//parallel in serial out shift register for SPI flash 
   always @(posedge clk) begin
		
		if(count > 0)
			flash_ready <= 0;
		else
			flash_ready <= 1;
			
		if (!rst) begin
         data <= 0;
			count <= 0;
      end
      else if (flash_ready && load) begin
         data <= {8'b00000011, rom_addr, 8'b0};
			count <= 40;
      end
      else if (!flash_ready && SCK) begin
         data <= (data << 1) | MISO ;
			count <= count - 1;
      end
		
	end		

endmodule
