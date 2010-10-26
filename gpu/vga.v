`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: VGA controller
// Module Name: vga
// Project Name: CS3710
// Description: VGA timing generation
//////////////////////////////////////////////////////////////////////////////////
module vga 
	#(
		parameter vPulse = 521,
		parameter vDisplay = 480,
		parameter vPulseWidth = 2,
		parameter vFrontPorch = 10,
		parameter vBackPorch = 29,
		parameter hPulse = 800,
		parameter hDisplay = 640,
		parameter hPulseWidth = 96,
		parameter hFrontPorch = 16,
		parameter hBackPorch = 48
	)
	(
		 input clk,
		 input rst,
		 output [9:0] x, // the screen x coordinate
		 output [9:0] y, // the screen y coordinate
		 output hbright,
		 output vbright,
		 output vlookahead,
		 output line_start,
		 output bright,
		 output hsync,
		 output vsync
    );
	
	reg [9:0] hcount, vcount;
	reg vga_clk_enable;
	
	// Vertical and horizontal output if count is inside Tdisplay
	assign hbright = (hcount >= (hPulseWidth + hBackPorch) && hcount < (hPulse - hFrontPorch));
	assign vbright = (vcount >= (vPulseWidth + vBackPorch) && vcount < (vPulse - vFrontPorch));
	assign vlookahead = (vcount >= (vPulseWidth + vBackPorch - 1) && vcount < (vPulse - vFrontPorch - 1));

	// bright if both horizontal and vertical outputs are enabled.
	assign bright = vbright && hbright;
	
	// The horizontal and vertical coordinates, calculated from
	// the horizontal counter and vertical counters.
	// will be zero if not inside the enabled range.
	assign x = hbright ? hcount - (hPulseWidth + hBackPorch) : 0;
	assign y = vlookahead ? vcount - (vPulseWidth + vBackPorch - 1) : 0;
	
	// Front buffer on even y, back buffer on odd y.
	assign line_start = vga_clk_enable && hcount == 0;
	
	// sync pulses on the first part of the count.
	assign hsync = !(hcount >= 0 && hcount < hPulseWidth);
	assign vsync = !(vcount >= 0 && vcount < vPulseWidth);
	
	// reduces the 50 mHz clock to 25 mHz enable signal.
	always @(posedge clk) begin
		if (!rst)
			vga_clk_enable <= 0;
		else
			vga_clk_enable <= !vga_clk_enable;
	end
	
	// Horizontal counter from 0 to hPulse, incremented every enable signal.
	always @(posedge clk) begin
		if (!rst) begin
			hcount <= 0;
		end
		else if (vga_clk_enable) begin
			if (hcount == hPulse)
				hcount <= 0;
			else
				hcount <= hcount + 1;
		end
	end
	
	// Vertical counter from 0 to vPulse, incremented every time hcount rolls over.
	always @(posedge clk) begin
		if (!rst) begin
			vcount <= 0;
		end
		else if (vga_clk_enable) begin
			if (vcount == vPulse)
				vcount <= 0;
			else if (hcount == hPulse)
				vcount <= vcount + 1;
		end
	end	
endmodule
