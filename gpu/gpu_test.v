// Verilog test fixture created from schematic /home/yashton/Desktop/blue/system.sch - Sun Oct 24 17:39:50 2010

`timescale 1ns / 1ps

module gpu_test();

// Inputs
   reg rst;
   reg clk;
   reg [7:0] brightness;
   reg [6:0] sprite_priority;

// Output
   wire [7:0] B;
   wire [7:0] G;
   wire [7:0] R;
   wire bright;
   wire vsync;
   wire hsync;
   wire vbright;
   wire hbright;

// Bidirs

// Instantiate the UUT
   gpu_test_system UUT (
		.B(B), 
		.G(G), 
		.R(R), 
		.bright(bright), 
		.vsync(vsync), 
		.hsync(hsync), 
		.rst(rst), 
		.clk(clk), 
		.vbright(vbright), 
		.hbright(hbright), 
		.brightness(brightness), 
		.sprite_priority(sprite_priority)
   );

// Initialize Inputs
	integer fileid;
	initial begin
		rst = 0;
		clk = 0;
		brightness = 255;
		sprite_priority = 0;
		
		fileid = $fopen("screen.dat", "w");
		#100;
		rst = 1;
	end

	always begin
		#10 clk = ~clk;
	end
	always @(posedge clk) begin
	 	if (UUT.vga_ctrl.vga_clk_enable && bright) begin
	 		$fdisplay(fileid, "%h%h%h", R, G, B);
	 	end
	 	if (!bright && UUT.vga_ctrl.vcount == 521) begin
	 		$fclose(fileid);
	 		$finish();
	 	end
	end
endmodule
