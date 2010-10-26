--------------------------------------------------------------------------------
--     This file is owned and controlled by Xilinx and must be used           --
--     solely for design, simulation, implementation and creation of          --
--     design files limited to Xilinx devices or technologies. Use            --
--     with non-Xilinx devices or technologies is expressly prohibited        --
--     and immediately terminates your license.                               --
--                                                                            --
--     XILINX IS PROVIDING THIS DESIGN, CODE, OR INFORMATION "AS IS"          --
--     SOLELY FOR USE IN DEVELOPING PROGRAMS AND SOLUTIONS FOR                --
--     XILINX DEVICES.  BY PROVIDING THIS DESIGN, CODE, OR INFORMATION        --
--     AS ONE POSSIBLE IMPLEMENTATION OF THIS FEATURE, APPLICATION            --
--     OR STANDARD, XILINX IS MAKING NO REPRESENTATION THAT THIS              --
--     IMPLEMENTATION IS FREE FROM ANY CLAIMS OF INFRINGEMENT,                --
--     AND YOU ARE RESPONSIBLE FOR OBTAINING ANY RIGHTS YOU MAY REQUIRE       --
--     FOR YOUR IMPLEMENTATION.  XILINX EXPRESSLY DISCLAIMS ANY               --
--     WARRANTY WHATSOEVER WITH RESPECT TO THE ADEQUACY OF THE                --
--     IMPLEMENTATION, INCLUDING BUT NOT LIMITED TO ANY WARRANTIES OR         --
--     REPRESENTATIONS THAT THIS IMPLEMENTATION IS FREE FROM CLAIMS OF        --
--     INFRINGEMENT, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS        --
--     FOR A PARTICULAR PURPOSE.                                              --
--                                                                            --
--     Xilinx products are not intended for use in life support               --
--     appliances, devices, or systems. Use in such applications are          --
--     expressly prohibited.                                                  --
--                                                                            --
--     (c) Copyright 1995-2009 Xilinx, Inc.                                   --
--     All rights reserved.                                                   --
--------------------------------------------------------------------------------
-- You must compile the wrapper file shift_ram.vhd when simulating
-- the core, shift_ram. When compiling the wrapper file, be sure to
-- reference the XilinxCoreLib VHDL simulation library. For detailed
-- instructions, please refer to the "CORE Generator Help".

-- The synthesis directives "translate_off/translate_on" specified
-- below are supported by Xilinx, Mentor Graphics and Synplicity
-- synthesis tools. Ensure they are correct for your synthesis tool(s).

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
-- synthesis translate_off
Library XilinxCoreLib;
-- synthesis translate_on
ENTITY shift_ram IS
	port (
	d: IN std_logic_VECTOR(31 downto 0);
	clk: IN std_logic;
	ce: IN std_logic;
	sset: IN std_logic;
	q: OUT std_logic_VECTOR(31 downto 0));
END shift_ram;

ARCHITECTURE shift_ram_a OF shift_ram IS
-- synthesis translate_off
component wrapped_shift_ram
	port (
	d: IN std_logic_VECTOR(31 downto 0);
	clk: IN std_logic;
	ce: IN std_logic;
	sset: IN std_logic;
	q: OUT std_logic_VECTOR(31 downto 0));
end component;

-- Configuration specification 
	for all : wrapped_shift_ram use entity XilinxCoreLib.c_shift_ram_v11_0(behavioral)
		generic map(
			c_parser_type => 1,
			c_read_mif => 0,
			c_has_a => 0,
			c_sync_priority => 1,
			c_opt_goal => 0,
			c_has_sclr => 0,
			c_width => 32,
			c_verbosity => 0,
			c_ainit_val => "1011101001010100100101110100001000111100010100001101111001100011",
			c_has_ce => 1,
			c_sync_enable => 0,
			c_depth => 1,
			c_sinit_val => "00000000000000000000000000000000",
			c_has_sset => 1,
			c_has_sinit => 0,
			c_mem_init_file => "no_coe_file_loaded",
			c_shift_type => 0,
			c_default_data => "1100110011000011000101010011001111111011100010110000011011001001",
			c_reg_last_bit => 1,
			c_xdevicefamily => "spartan3e",
			c_addr_width => 4);
-- synthesis translate_on
BEGIN
-- synthesis translate_off
U0 : wrapped_shift_ram
		port map (
			d => d,
			clk => clk,
			ce => ce,
			sset => sset,
			q => q);
-- synthesis translate_on

END shift_ram_a;

