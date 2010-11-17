`timescale 1ns / 1ps
module rotary_encoder
	(
		input clk,
		input rst,
		input rot_a, rot_b,
		output reg [15:0] count,
		input write,
		input en,
		input [15:0] writedata
	);
	
	localparam WAIT = 0, R_START = 1, R_TRANS = 2, R_FINISH = 3;
	localparam L_START = 4, L_TRANS = 5, L_FINISH = 6;
	
	wire [1:0] rot;
	assign rot = {rot_a, rot_b};
	
	reg [3:0] state, next_state;
	
	always @(posedge clk) begin
		if (!rst) begin
			state <= WAIT;
		end
		else begin
			state <= next_state;
		end
	end
	
	always @(posedge clk) begin
		if (en && write) begin
			count <= writedata;
		end
		if (state == L_FINISH) begin
			count <= count - 1;
		end
		else if (state == R_FINISH) begin
			count <= count + 1;
		end
	end
	
	always @(*) begin
		case(state)
			WAIT: begin
					if (rot == 2'b10)
						next_state <= R_START;
					else if (rot == 2'b01)
						next_state <= L_START;
					else
						next_state <= WAIT;
				end
			R_START: next_state <= rot == 2'b11 ? R_TRANS : R_START;
			R_TRANS: next_state <= rot == 2'b01 ? R_FINISH : R_TRANS;
			R_FINISH: next_state <= rot == 2'b00 ? WAIT : R_FINISH;
			L_START: next_state <= rot == 2'b11 ? L_TRANS : L_START;
			L_TRANS: next_state <= rot == 2'b10 ? L_FINISH : L_TRANS;
			L_FINISH: next_state <= rot == 2'b00 ? WAIT : L_FINISH;
			default: next_state <= WAIT;
		endcase
	end
endmodule
