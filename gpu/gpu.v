`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: University of Utah
// Engineer: Ashton Snelgrove (snelgrov@eng.utah.edu)
// 
// Design Name: Graphics processing unit.
// Module Name: gpu
// Project Name: CS3710
// Description: 
//////////////////////////////////////////////////////////////////////////////////
module gpu
	#(
		parameter SIZE = 8,
		parameter COLOR = 8,
		parameter COUNT = 7,
		parameter SPRITE_COUNT = 256,
		parameter SPRITE_ADDR = 16'h4000,
		parameter SPRITE_ADDR_TOP = 16'h41ff,
		parameter PRIORITY_ADDR = 16'h4380,
		parameter BRIGHTNESS_ADDR = 16'h4381,
		parameter GPU_SR_ADDR = 16'h4382,
		parameter LOAD_Y = 1,
		parameter LOAD_X = 0,
		parameter LOAD_SLICE_WORD = 4,
		parameter WRITE_SLICE_WORD = 7,
		parameter START = 5,
		parameter INCR = 6
	)
	(
		input clk,
		input rst,
		// Processor memory mapped io inputs.
		input [15:0] adr,
		input memwrite,
		input [15:0] writedata,
		output reg [15:0] memdata,

		// VGA control
		input vga_clk_enable,
		input [9:0] hcount,
		input [9:0] vcount,
		input [9:0] x,
		input [9:0] y,
		input hbright,
		input vbright,
		input vlookahead,
		input bright,

		// palette control
		output reg [7:0] brightness,
		
		// line buffer outputs
		output line_shift,
		output reg line_load,
		output line_copy,
		output [9:0] line_addr,
		output reg [11:0] line_tile,
		output reg [1:0] line_z,
		output reg [3:0] line_palette,
		input line_busy
	);
	
	reg [6:0] sprite_priority;
	
	// RAM for sprite object data
	reg [15:0] sprites [4*SPRITE_COUNT-1:0];
	reg [31:0] loaded_sprite_data;

	initial begin
		$readmemh("sprite.dat", sprites);
	end
	
	// locals for examining a sprite
	reg [15:0] a, b;
	reg [2:0] sizeX;
	reg [2:0] sizeY;
	reg hFlip;
	reg vFlip;
	reg tileTable;
	reg [3:0] tileX, tileY;
	reg active;
	
	// sprite test wires
	wire xbounded;
	wire yintersect;
	reg [7:0] tile_word_loaded;
	wire [7:0] tile_word_next;
	wire [11:0] tile;
	wire [9:0] f;
	// Y lookup should be one line ahead of the current drawing scan line.
  	assign f = !vbright ? 0 : y + 1;
  
	sprite test (a, b, sizeX, sizeY, hFlip, vFlip, tileTable, tileX, tileY, f, xbounded, yintersect, tile_word_loaded, tile_word_next, tile);
	
	reg [1:0] tile_word_count;
	always @(*) begin
		case (tile_word_next)
			1: tile_word_count <= 0;
			2: tile_word_count <= 1;
			4: tile_word_count <= 2;
			8: tile_word_count <= 3;
			16: tile_word_count <= 4;
			32: tile_word_count <= 5;
			64: tile_word_count <= 6;
			128: tile_word_count <= 7;
			default: tile_word_count <= 0;
		endcase
	end
	
	// Copy line front buffer to back buffer at start of each horizontal scan line. Also clears front buffer.
	assign line_copy = hcount == 0;
	
	assign line_addr = a + 8 * tile_word_count;
	
	// every time x increments, shift the current index out.
	assign line_shift = hbright && vga_clk_enable;
	
	// State machine logic
	reg [4:0] state;
	reg [4:0] next_state;
	wire stalled;
	
	always @(posedge clk) begin
		if (!rst) begin
			state <= START;
		end
		else begin
			if (vlookahead) begin
				state <= next_state;
			end
		end
	end

	always @(*) begin
		if (hcount == 0) begin
			next_state <= START;
		end
		else begin
			case (state)
				START: next_state <= LOAD_META_A;
				INCR: next_state <= LOAD_Y;
				LOAD_Y: next_state <= active && yintersect ? LOAD_X : INCR;
				LOAD_X: next_state <= xbounded ? LOAD_SLICE_WORD : INCR;
				LOAD_SLICE_WORD: next_state <= WRITE_SLICE_WORD;
				WRITE_SLICE_WORD: begin
						if (!line_busy && tile_word_next != 0) begin
							next_state <= LOAD_SLICE_WORD;
						end
						else if (!line_busy && tile_word_next == 0) begin
							next_state <= INCR;
						end
						else begin
							next_state <= WRITE_SLICE_WORD;
						end
					end
				default: next_state <= START;
			endcase
		end
	end
	
	// sprite lookup calculations.
	reg [7:0] sprite_i;
	reg sprite_offset;
	wire [8:0] sprite_addr;
	assign sprite_addr = {sprite_i, sprite_offset}; // address is calculated by 2 * i + offset;
	always @(*) begin
		case (next_state)
			LOAD_X: sprite_offset <= 0;
			LOAD_Y: sprite_offset <= 1;
			default sprite_offset <= 0;
		endcase
	end
	
	// Data loading.
	always @(posedge clk) begin
		line_load <= 0;
		if (vlookahead) begin
			case (state)
				START: begin
						sprite_i <= sprite_priority;
					end
				INCR: begin
						sprite_i <= sprite_i + 1;
					end
				LOAD_Y: begin
						{sizeX, sizeY, hFlip, vFlip, line_z, active ,b} <= loaded_sprite_data;
					end
				LOAD_X: begin
						{line_palette, tileTable, tileX, tileY, a} <= loaded_sprite_data;
						tile_word_loaded <= 0;
					end
				LOAD_SLICE_WORD: begin
						line_load <= 1;
						// after this word has been loaded, add it to the loaded mask.
						tile_word_loaded <= tile_word_loaded | tile_word_next;
					end
			endcase
		end
	end
	
	// Memory mapped access - misc
	reg [15:0] other_memdata;
	always @(posedge clk) begin
		if (!rst) begin
			brightness <= 0;
			sprite_priority <= 0;
		end
		else begin
			if (adr == BRIGHTNESS_ADDR) begin
				if (memwrite) begin
					brightness <= writedata;
				end
				other_memdata <= brightness;
			end
			else if (adr == PRIORITY_ADDR) begin
				if (memwrite) begin
					sprite_priority <= writedata;
				end
				other_memdata <= sprite_priority;
			end
			else if (adr == GPU_SR_ADDR) begin
				other_memdata <= {hbright, vbright, 8'b00000000};
			end
		end
	end
	
	// Memory reads and writes for sprite object data.
	reg [8:0] smem;
	reg [15:0] sprite_memdata;
	always @(posedge clk) begin
		if (adr >= SPRITE_ADDR && adr <= SPRITE_ADDR_TOP) begin
			smem <= adr - SPRITE_ADDR;
			if (memwrite) begin
				sprites[smem] <= writedata;
			end
			sprite_memdata <= sprites[smem];
		end
		loaded_sprite_data <= sprites[sprite_addr];
	end
	
	// Decides which of the three memory regions will be output on memdata.
	always @(*) begin
		if (adr >= SPRITE_ADDR && adr <= SPRITE_ADDR_TOP) begin
			memdata <= sprite_memdata;
		end
		else begin
			memdata <= other_memdata;
		end
	end
endmodule
