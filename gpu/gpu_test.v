`timescale 1ns / 1ps
////////////////////////////////////////////////////////////
// Run simulation on continuous mode. Once a single frame has been drawn, the simulation will exit.
// A file in the project directory called "screen.dat" will be created.
// There is a bash script in blue/gpu/utils/screen which contains the commands for converting to a 
// png image.
////////////////////////////////////////////////////////////
module gpu_test();

// Inputs
   reg rst;
   reg clk;
   reg [7:0] brightness;
   reg [7:0] sprite_priority;

// Output
   wire [7:0] B;
   wire [7:0] G;
   wire [7:0] R;
   wire bright;
   wire vsync;
   wire hsync;
   wire vbright;
   wire hbright;
	
	wire [9:0] x, y;
	wire vlookahead;
	wire line_start;
// Bidirs

// Instantiate the UUT
   gpu_schematic UUT (
		.B(B), 
		.G(G), 
		.R(R), 
		.y(y),
		.x(x),
		.line_start(line_start),
		.vlookahead(vlookahead),
		.rst(rst), 
		.clk(clk),
		.brightness(brightness), 
		.sprite_priority(sprite_priority)
   );
	
	vga vga_ctrl (
		.clk(clk),
		.rst(rst),
		.x(x),
		.y(y),
		.hbright(hbright),
		.vbright(vbright),	
		.vlookahead(vlookahead),
		.line_start,
		.bright(bright),
		.hsync(hsync),
		.vsync(vsync)
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
	 	if (vga_ctrl.vga_clk_enable && bright) begin
			// Every time a pixel would be drawn to screen, write it to file.
	 		$fdisplay(fileid, "%h%h%h", R, G, B);
	 	end
	 	if (!bright && vga_ctrl.vcount == 521) begin
			// Once a single frame has elapsed, close the file and end the simulation.
	 		$fclose(fileid);
	 		$finish();
	 	end
	end
endmodule
