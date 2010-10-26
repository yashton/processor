////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 1995-2010 Xilinx, Inc.  All rights reserved.
////////////////////////////////////////////////////////////////////////////////
//   ____  ____
//  /   /\/   /
// /___/  \  /    Vendor: Xilinx
// \   \   \/     Version: M.63c
//  \   \         Application: netgen
//  /   /         Filename: shift_ram.v
// /___/   /\     Timestamp: Thu Oct 21 04:50:19 2010
// \   \  /  \ 
//  \___\/\___\
//             
// Command	: -intstyle ise -w -sim -ofmt verilog ./tmp/_cg/shift_ram.ngc ./tmp/_cg/shift_ram.v 
// Device	: 3s500efg320-5
// Input file	: ./tmp/_cg/shift_ram.ngc
// Output file	: ./tmp/_cg/shift_ram.v
// # of Modules	: 1
// Design Name	: shift_ram
// Xilinx        : /opt/xilinx/12.2/ISE_DS/ISE/
//             
// Purpose:    
//     This verilog netlist is a verification model and uses simulation 
//     primitives which may not represent the true implementation of the 
//     device, however the netlist is functionally correct and should not 
//     be modified. This file cannot be synthesized and should only be used 
//     with supported simulation tools.
//             
// Reference:  
//     Command Line Tools User Guide, Chapter 23 and Synthesis and Simulation Design Guide, Chapter 6
//             
////////////////////////////////////////////////////////////////////////////////

`timescale 1 ns/1 ps

module shift_ram (
  ce, clk, sset, d, q
)/* synthesis syn_black_box syn_noprune=1 */;
  input ce;
  input clk;
  input sset;
  input [31 : 0] d;
  output [31 : 0] q;
  
  // synthesis translate_off
  
  wire \BU2/sclr ;
  wire \BU2/sinit ;
  wire NLW_VCC_P_UNCONNECTED;
  wire NLW_GND_G_UNCONNECTED;
  wire [31 : 0] d_2;
  wire [31 : 0] q_3;
  wire [3 : 0] \BU2/a ;
  assign
    d_2[31] = d[31],
    d_2[30] = d[30],
    d_2[29] = d[29],
    d_2[28] = d[28],
    d_2[27] = d[27],
    d_2[26] = d[26],
    d_2[25] = d[25],
    d_2[24] = d[24],
    d_2[23] = d[23],
    d_2[22] = d[22],
    d_2[21] = d[21],
    d_2[20] = d[20],
    d_2[19] = d[19],
    d_2[18] = d[18],
    d_2[17] = d[17],
    d_2[16] = d[16],
    d_2[15] = d[15],
    d_2[14] = d[14],
    d_2[13] = d[13],
    d_2[12] = d[12],
    d_2[11] = d[11],
    d_2[10] = d[10],
    d_2[9] = d[9],
    d_2[8] = d[8],
    d_2[7] = d[7],
    d_2[6] = d[6],
    d_2[5] = d[5],
    d_2[4] = d[4],
    d_2[3] = d[3],
    d_2[2] = d[2],
    d_2[1] = d[1],
    d_2[0] = d[0],
    q[31] = q_3[31],
    q[30] = q_3[30],
    q[29] = q_3[29],
    q[28] = q_3[28],
    q[27] = q_3[27],
    q[26] = q_3[26],
    q[25] = q_3[25],
    q[24] = q_3[24],
    q[23] = q_3[23],
    q[22] = q_3[22],
    q[21] = q_3[21],
    q[20] = q_3[20],
    q[19] = q_3[19],
    q[18] = q_3[18],
    q[17] = q_3[17],
    q[16] = q_3[16],
    q[15] = q_3[15],
    q[14] = q_3[14],
    q[13] = q_3[13],
    q[12] = q_3[12],
    q[11] = q_3[11],
    q[10] = q_3[10],
    q[9] = q_3[9],
    q[8] = q_3[8],
    q[7] = q_3[7],
    q[6] = q_3[6],
    q[5] = q_3[5],
    q[4] = q_3[4],
    q[3] = q_3[3],
    q[2] = q_3[2],
    q[1] = q_3[1],
    q[0] = q_3[0];
  VCC   VCC_0 (
    .P(NLW_VCC_P_UNCONNECTED)
  );
  GND   GND_1 (
    .G(NLW_GND_G_UNCONNECTED)
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_32  (
    .C(clk),
    .CE(ce),
    .D(d_2[31]),
    .S(sset),
    .Q(q_3[31])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_31  (
    .C(clk),
    .CE(ce),
    .D(d_2[30]),
    .S(sset),
    .Q(q_3[30])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_30  (
    .C(clk),
    .CE(ce),
    .D(d_2[29]),
    .S(sset),
    .Q(q_3[29])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_29  (
    .C(clk),
    .CE(ce),
    .D(d_2[28]),
    .S(sset),
    .Q(q_3[28])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_28  (
    .C(clk),
    .CE(ce),
    .D(d_2[27]),
    .S(sset),
    .Q(q_3[27])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_27  (
    .C(clk),
    .CE(ce),
    .D(d_2[26]),
    .S(sset),
    .Q(q_3[26])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_26  (
    .C(clk),
    .CE(ce),
    .D(d_2[25]),
    .S(sset),
    .Q(q_3[25])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_25  (
    .C(clk),
    .CE(ce),
    .D(d_2[24]),
    .S(sset),
    .Q(q_3[24])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_24  (
    .C(clk),
    .CE(ce),
    .D(d_2[23]),
    .S(sset),
    .Q(q_3[23])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_23  (
    .C(clk),
    .CE(ce),
    .D(d_2[22]),
    .S(sset),
    .Q(q_3[22])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_22  (
    .C(clk),
    .CE(ce),
    .D(d_2[21]),
    .S(sset),
    .Q(q_3[21])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_21  (
    .C(clk),
    .CE(ce),
    .D(d_2[20]),
    .S(sset),
    .Q(q_3[20])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_20  (
    .C(clk),
    .CE(ce),
    .D(d_2[19]),
    .S(sset),
    .Q(q_3[19])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_19  (
    .C(clk),
    .CE(ce),
    .D(d_2[18]),
    .S(sset),
    .Q(q_3[18])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_18  (
    .C(clk),
    .CE(ce),
    .D(d_2[17]),
    .S(sset),
    .Q(q_3[17])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_17  (
    .C(clk),
    .CE(ce),
    .D(d_2[16]),
    .S(sset),
    .Q(q_3[16])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_16  (
    .C(clk),
    .CE(ce),
    .D(d_2[15]),
    .S(sset),
    .Q(q_3[15])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_15  (
    .C(clk),
    .CE(ce),
    .D(d_2[14]),
    .S(sset),
    .Q(q_3[14])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_14  (
    .C(clk),
    .CE(ce),
    .D(d_2[13]),
    .S(sset),
    .Q(q_3[13])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_13  (
    .C(clk),
    .CE(ce),
    .D(d_2[12]),
    .S(sset),
    .Q(q_3[12])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_12  (
    .C(clk),
    .CE(ce),
    .D(d_2[11]),
    .S(sset),
    .Q(q_3[11])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_11  (
    .C(clk),
    .CE(ce),
    .D(d_2[10]),
    .S(sset),
    .Q(q_3[10])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_10  (
    .C(clk),
    .CE(ce),
    .D(d_2[9]),
    .S(sset),
    .Q(q_3[9])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_9  (
    .C(clk),
    .CE(ce),
    .D(d_2[8]),
    .S(sset),
    .Q(q_3[8])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_8  (
    .C(clk),
    .CE(ce),
    .D(d_2[7]),
    .S(sset),
    .Q(q_3[7])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_7  (
    .C(clk),
    .CE(ce),
    .D(d_2[6]),
    .S(sset),
    .Q(q_3[6])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_6  (
    .C(clk),
    .CE(ce),
    .D(d_2[5]),
    .S(sset),
    .Q(q_3[5])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_5  (
    .C(clk),
    .CE(ce),
    .D(d_2[4]),
    .S(sset),
    .Q(q_3[4])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_4  (
    .C(clk),
    .CE(ce),
    .D(d_2[3]),
    .S(sset),
    .Q(q_3[3])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_3  (
    .C(clk),
    .CE(ce),
    .D(d_2[2]),
    .S(sset),
    .Q(q_3[2])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_2  (
    .C(clk),
    .CE(ce),
    .D(d_2[1]),
    .S(sset),
    .Q(q_3[1])
  );
  FDSE #(
    .INIT ( 1'b1 ))
  \BU2/U0/i_bb_inst/gen_output_regs.output_regs/fd/output_1  (
    .C(clk),
    .CE(ce),
    .D(d_2[0]),
    .S(sset),
    .Q(q_3[0])
  );

// synthesis translate_on

endmodule

// synthesis translate_off

`ifndef GLBL
`define GLBL

`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (weak1, weak0) GSR = GSR_int;
    assign (weak1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule

`endif

// synthesis translate_on
