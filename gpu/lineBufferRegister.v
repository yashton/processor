`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
//
// Design Name: GPU line buffer.
// Module Name: line_buffer
// Project Name: CS3710
// Description: Provides 640 registers for storing the line back buffer and z priority;
// and 640 registers for the line front buffer, which is shifted out to the VGA output.
//////////////////////////////////////////////////////////////////////////////////
module line_buffer_register
	#(
		parameter WIDTH = 480
	)
	(
		input clk,
		input clear,
		input shift,
		input load,
		input copy,
		input [9:0] addr,
		input [15:0] data,
		input [1:0] z,
		input [3:0] palette,
		output busy,
		output [7:0] p_index
   );
	// Registers for latching inputs
	reg [15:0] line_data;
	reg [9:0] line_addr;
	reg [1:0] line_z;
	reg [3:0] line_palette;

	reg [1:0] pixel_z [WIDTH-1:0];
	// set of flags for values that need to be written. Transparent pixels are ignored.
	wire [3:0] need_write;
	assign need_write[0] = line_data[3:0] != 0;
	assign need_write[1] = line_data[7:4] != 0;
	assign need_write[2] = line_data[11:8] != 0;
	assign need_write[3] = line_data[15:12] != 0;
	
	// flags for each pixel already written to buffer.
	reg [3:0] written;
	
	// flags for values that have not been written yet.
	wire [3:0] unwritten;
	assign unwritten = need_write & ~written;
	
	// finds the right-most unwritten value.
	wire [3:0] next_write;
	assign next_write = (~unwritten + 1) & unwritten;
	
	// if there are unwritten values, load one
	wire load_pixel;
	wire load_z;
	reg [1:0] loaded_z;
	assign load_pixel = next_write != 0 && load_z;
	assign load_z = line_z > loaded_z;
	assign busy = load_pixel;

	// calulate which offset is needed
	reg [1:0] pixel_offset;
	always @(*) begin
		case (next_write)
			1: pixel_offset <= 0;
			2: pixel_offset <= 1;
			4: pixel_offset <= 2;
			8: pixel_offset <= 3;
			default: pixel_offset <= 0;
		endcase
	end
	
	// calculate the write offset.
	wire [9:0] pixel_addr;
	assign pixel_addr = line_addr + pixel_offset;
	
	// Switches the data written to pixel to the correct slice.
	reg [3:0] pixel_data;
	always @(*) begin
		case (pixel_offset)
			0: pixel_data <= line_data[3:0];
			1: pixel_data <= line_data[7:4];
			2: pixel_data <= line_data[11:8];
			3: pixel_data <= line_data[15:12];
			default: pixel_data <= line_data[3:0];
		endcase
	end

	always @(posedge clk) begin
		if (load) begin
			// need to latch z, data, addr, palette
			line_data <= data;
			line_addr <= addr;
			line_z <= z;
			line_palette <= palette;
			// reset the written register
			written <= 0;
		end
		else begin
			if (load_pixel) begin
				// adds the flag of the pixel currently being written to
				// the written register
				written <= written | next_write;
			end
		end
	end 
	
	always @(posedge clk) begin
		if (load_pixel) begin
			pixel_z[pixel_addr] <= line_z;
		end
		loaded_z <= pixel_z[pixel_addr];
	end	 
					
	wire [7:0] next [(WIDTH - 2):0];
	
	genvar i;
	generate
		for (i = 0; i < WIDTH; i = i + 1)
		begin:buffer
			wire select;
			assign select = load_pixel && (pixel_addr == i);
			
			if (i == 0) begin
				line_buffer_latch stage(clk, shift, select, copy, clear, pixel_data, line_palette, next[0], p_index);
			end
			else if (i == (WIDTH - 1)) begin
				line_buffer_latch stage(clk, shift, select, copy, clear, pixel_data, line_palette, 0, next[(WIDTH - 2)]);
			end
			else begin
				line_buffer_latch stage(clk, shift, select, copy, clear, pixel_data, line_palette, next[i], next[i-1]);
			end	
		end
	endgenerate
	
endmodule

module line_buffer_latch
	(
		input clk,
		input shift,
		input load,
		input copy,
		input clear,
		input [3:0] data,
		input [3:0] palette,
		input [7:0] shift_data,
		output reg [7:0] back
	);
//	reg [15:0] storage;
//	assign back = storage[15:8];
//	
//	always @(posedge clk) begin
//		if (!clear) begin
//			storage <= 0;
//		end
//		else if (copy) begin
//			storage <= storage << 8;
//		end
//		// write only if not transparent and higher priority
//		else if (load && shift) begin
//			storage <= {shift_data, palette, data};
//		end
//		else if (!load && shift) begin
//			storage <= {shift_data, storage[7:0]};
//		end
//		else if (load && !shift) begin
//			storage <= {storage[15:0], palette, data};
//		end
//	end
	reg [7:0] front;
	
	always @(posedge clk) begin
		if (!clear || copy) begin
			front <= 0;
		end
		// write only if not transparent and higher priority
		else if (load) begin
			front <= {palette, data};
		end
		
		if (!clear) begin
			back <= 0;
		end
		else if (copy) begin
			back <= front;
		end
		else if (shift) begin
			back <= shift_data;
		end
	end
endmodule
