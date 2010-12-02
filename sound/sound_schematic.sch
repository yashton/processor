<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_34" />
        <signal name="XLXN_38" />
        <signal name="XLXN_39" />
        <signal name="XLXN_40(11:0)" />
        <signal name="XLXN_41" />
        <signal name="XLXN_42" />
        <signal name="XLXN_47" />
        <signal name="XLXN_79(7:0)" />
        <signal name="XLXN_80" />
        <signal name="XLXN_1(7:0)" />
        <signal name="XLXN_2(3:0)" />
        <signal name="XLXN_3(7:0)" />
        <signal name="XLXN_4(7:0)" />
        <signal name="XLXN_5(7:0)" />
        <signal name="XLXN_6(7:0)" />
        <signal name="XLXN_7(7:0)" />
        <signal name="XLXN_8(7:0)" />
        <signal name="XLXN_9(7:0)" />
        <signal name="XLXN_10(7:0)" />
        <signal name="XLXN_11(7:0)" />
        <signal name="XLXN_12(3:0)" />
        <signal name="XLXN_13(3:0)" />
        <signal name="XLXN_14(3:0)" />
        <signal name="XLXN_15(3:0)" />
        <signal name="XLXN_16(3:0)" />
        <signal name="XLXN_17(3:0)" />
        <signal name="XLXN_18(3:0)" />
        <signal name="XLXN_19(3:0)" />
        <signal name="XLXN_20(3:0)" />
        <signal name="XLXN_21(11:0)" />
        <signal name="XLXN_28(7:0)" />
        <signal name="XLXN_118(7:0)" />
        <signal name="XLXN_119" />
        <signal name="XLXN_29" />
        <signal name="writedata(15:0)" />
        <signal name="select(6:0)" />
        <signal name="mem_en" />
        <signal name="memwrite" />
        <signal name="rst" />
        <signal name="XLXN_22(23:0)" />
        <signal name="XLXN_23" />
        <signal name="en" />
        <signal name="clk" />
        <signal name="MISO" />
        <signal name="XLXN_54" />
        <signal name="XLXN_55" />
        <signal name="XLXN_140" />
        <signal name="XLXN_141" />
        <signal name="MOSI" />
        <signal name="SCK" />
        <signal name="flash_cs" />
        <signal name="DAC_cs" />
        <signal name="XLXN_147" />
        <signal name="XLXN_148" />
        <signal name="XLXN_149" />
        <signal name="XLXN_150" />
        <signal name="XLXN_151" />
        <signal name="XLXN_152" />
        <signal name="XLXN_155" />
        <signal name="XLXN_156" />
        <port polarity="Input" name="writedata(15:0)" />
        <port polarity="Input" name="select(6:0)" />
        <port polarity="Input" name="mem_en" />
        <port polarity="Input" name="memwrite" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="en" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="MISO" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Output" name="SCK" />
        <port polarity="Output" name="flash_cs" />
        <port polarity="Output" name="DAC_cs" />
        <blockdef name="mixer">
            <timestamp>2010-12-2T1:33:46</timestamp>
            <rect width="256" x="64" y="-1280" height="1280" />
            <rect width="64" x="0" y="-1260" height="24" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <rect width="64" x="0" y="-1196" height="24" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <rect width="64" x="0" y="-1132" height="24" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-940" height="24" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-1260" height="24" />
            <line x2="384" y1="-1248" y2="-1248" x1="320" />
        </blockdef>
        <blockdef name="sound_controller">
            <timestamp>2010-12-2T2:12:14</timestamp>
            <line x2="0" y1="-1376" y2="-1376" x1="64" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="400" y="-1260" height="24" />
            <line x2="464" y1="-1248" y2="-1248" x1="400" />
            <rect width="64" x="400" y="-1196" height="24" />
            <line x2="464" y1="-1184" y2="-1184" x1="400" />
            <rect width="64" x="400" y="-1132" height="24" />
            <line x2="464" y1="-1120" y2="-1120" x1="400" />
            <rect width="64" x="400" y="-1068" height="24" />
            <line x2="464" y1="-1056" y2="-1056" x1="400" />
            <rect width="64" x="400" y="-1004" height="24" />
            <line x2="464" y1="-992" y2="-992" x1="400" />
            <rect width="64" x="400" y="-940" height="24" />
            <line x2="464" y1="-928" y2="-928" x1="400" />
            <rect width="64" x="400" y="-876" height="24" />
            <line x2="464" y1="-864" y2="-864" x1="400" />
            <rect width="64" x="400" y="-812" height="24" />
            <line x2="464" y1="-800" y2="-800" x1="400" />
            <rect width="64" x="400" y="-748" height="24" />
            <line x2="464" y1="-736" y2="-736" x1="400" />
            <rect width="64" x="400" y="-684" height="24" />
            <line x2="464" y1="-672" y2="-672" x1="400" />
            <rect width="64" x="400" y="-620" height="24" />
            <line x2="464" y1="-608" y2="-608" x1="400" />
            <rect width="64" x="400" y="-556" height="24" />
            <line x2="464" y1="-544" y2="-544" x1="400" />
            <rect width="64" x="400" y="-492" height="24" />
            <line x2="464" y1="-480" y2="-480" x1="400" />
            <rect width="64" x="400" y="-428" height="24" />
            <line x2="464" y1="-416" y2="-416" x1="400" />
            <rect width="64" x="400" y="-364" height="24" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <rect width="64" x="400" y="-300" height="24" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="64" x="400" y="-236" height="24" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <rect width="64" x="400" y="-172" height="24" />
            <line x2="464" y1="-160" y2="-160" x1="400" />
            <rect width="64" x="400" y="-108" height="24" />
            <line x2="464" y1="-96" y2="-96" x1="400" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="464" y1="-32" y2="-32" x1="400" />
            <rect width="336" x="64" y="-1504" height="1504" />
            <line x2="464" y1="-1440" y2="-1440" x1="400" />
            <line x2="464" y1="-1376" y2="-1376" x1="400" />
            <rect width="64" x="400" y="-1388" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="DAC_controller">
            <timestamp>2010-12-2T1:56:28</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="spi_flash_controller">
            <timestamp>2010-12-2T2:9:40</timestamp>
            <rect width="304" x="64" y="-384" height="384" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="432" y1="-288" y2="-288" x1="368" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
        </blockdef>
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <blockdef name="sample_frequency_generator">
            <timestamp>2010-12-2T3:18:38</timestamp>
            <rect width="256" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <block symbolname="sound_controller" name="XLXI_4">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_149" name="load" />
            <blockpin signalname="en" name="en" />
            <blockpin signalname="mem_en" name="mem_en" />
            <blockpin signalname="memwrite" name="memwrite" />
            <blockpin signalname="writedata(15:0)" name="writedata(15:0)" />
            <blockpin signalname="select(6:0)" name="select(6:0)" />
            <blockpin signalname="XLXN_28(7:0)" name="rom_data(7:0)" />
            <blockpin signalname="XLXN_1(7:0)" name="bground(7:0)" />
            <blockpin signalname="XLXN_2(3:0)" name="bamp(3:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="sfx0(7:0)" />
            <blockpin signalname="XLXN_4(7:0)" name="sfx1(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="sfx2(7:0)" />
            <blockpin signalname="XLXN_6(7:0)" name="sfx3(7:0)" />
            <blockpin signalname="XLXN_7(7:0)" name="sfx4(7:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="sfx5(7:0)" />
            <blockpin signalname="XLXN_9(7:0)" name="sfx6(7:0)" />
            <blockpin signalname="XLXN_10(7:0)" name="sfx7(7:0)" />
            <blockpin signalname="XLXN_11(7:0)" name="sfx8(7:0)" />
            <blockpin signalname="XLXN_12(3:0)" name="sfx_amp0(3:0)" />
            <blockpin signalname="XLXN_13(3:0)" name="sfx_amp1(3:0)" />
            <blockpin signalname="XLXN_14(3:0)" name="sfx_amp2(3:0)" />
            <blockpin signalname="XLXN_15(3:0)" name="sfx_amp3(3:0)" />
            <blockpin signalname="XLXN_16(3:0)" name="sfx_amp4(3:0)" />
            <blockpin signalname="XLXN_17(3:0)" name="sfx_amp5(3:0)" />
            <blockpin signalname="XLXN_18(3:0)" name="sfx_amp6(3:0)" />
            <blockpin signalname="XLXN_19(3:0)" name="sfx_amp7(3:0)" />
            <blockpin signalname="XLXN_20(3:0)" name="sfx_amp8(3:0)" />
            <blockpin signalname="XLXN_23" name="rom_load" />
            <blockpin signalname="XLXN_22(23:0)" name="rom_addr(23:0)" />
            <blockpin signalname="XLXN_29" name="rom_ready" />
        </block>
        <block symbolname="mixer" name="XLXI_3">
            <blockpin signalname="XLXN_1(7:0)" name="bground(7:0)" />
            <blockpin signalname="XLXN_2(3:0)" name="bg_amp(3:0)" />
            <blockpin signalname="XLXN_3(7:0)" name="sfx0(7:0)" />
            <blockpin signalname="XLXN_4(7:0)" name="sfx1(7:0)" />
            <blockpin signalname="XLXN_5(7:0)" name="sfx2(7:0)" />
            <blockpin signalname="XLXN_6(7:0)" name="sfx3(7:0)" />
            <blockpin signalname="XLXN_7(7:0)" name="sfx4(7:0)" />
            <blockpin signalname="XLXN_8(7:0)" name="sfx5(7:0)" />
            <blockpin signalname="XLXN_9(7:0)" name="sfx6(7:0)" />
            <blockpin signalname="XLXN_10(7:0)" name="sfx7(7:0)" />
            <blockpin signalname="XLXN_11(7:0)" name="sfx8(7:0)" />
            <blockpin signalname="XLXN_12(3:0)" name="sfx_amp0(3:0)" />
            <blockpin signalname="XLXN_13(3:0)" name="sfx_amp1(3:0)" />
            <blockpin signalname="XLXN_14(3:0)" name="sfx_amp2(3:0)" />
            <blockpin signalname="XLXN_15(3:0)" name="sfx_amp3(3:0)" />
            <blockpin signalname="XLXN_16(3:0)" name="sfx_amp4(3:0)" />
            <blockpin signalname="XLXN_17(3:0)" name="sfx_amp5(3:0)" />
            <blockpin signalname="XLXN_18(3:0)" name="sfx_amp6(3:0)" />
            <blockpin signalname="XLXN_19(3:0)" name="sfx_amp7(3:0)" />
            <blockpin signalname="XLXN_20(3:0)" name="sfx_amp8(3:0)" />
            <blockpin signalname="XLXN_21(11:0)" name="data(11:0)" />
        </block>
        <block symbolname="spi_flash_controller" name="XLXI_6">
            <blockpin signalname="XLXN_22(23:0)" name="rom_addr(23:0)" />
            <blockpin signalname="XLXN_54" name="MOSI" />
            <blockpin signalname="XLXN_23" name="load" />
            <blockpin signalname="en" name="en" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="MISO" name="MISO" />
            <blockpin signalname="XLXN_55" name="SCK" />
            <blockpin signalname="XLXN_29" name="flash_ready" />
            <blockpin signalname="XLXN_28(7:0)" name="rom_data(7:0)" />
        </block>
        <block symbolname="DAC_controller" name="XLXI_5">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_150" name="load" />
            <blockpin signalname="en" name="en" />
            <blockpin signalname="XLXN_21(11:0)" name="total_sound(11:0)" />
            <blockpin signalname="XLXN_140" name="MOSI" />
            <blockpin signalname="XLXN_141" name="SCK" />
        </block>
        <block symbolname="m2_1" name="MOSI_mux">
            <blockpin signalname="XLXN_54" name="D0" />
            <blockpin signalname="XLXN_140" name="D1" />
            <blockpin signalname="XLXN_147" name="S0" />
            <blockpin signalname="MOSI" name="O" />
        </block>
        <block symbolname="m2_1" name="SCK_mux">
            <blockpin signalname="XLXN_55" name="D0" />
            <blockpin signalname="XLXN_141" name="D1" />
            <blockpin signalname="XLXN_147" name="S0" />
            <blockpin signalname="SCK" name="O" />
        </block>
        <block symbolname="sample_frequency_generator" name="XLXI_23">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_147" name="spi_mux" />
            <blockpin signalname="flash_cs" name="flash_cs" />
            <blockpin signalname="DAC_cs" name="DAC_cs" />
            <blockpin signalname="XLXN_150" name="DAC_load" />
            <blockpin signalname="XLXN_149" name="sound_load" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="672" y="2064" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_1(7:0)">
            <wire x2="1312" y1="816" y2="816" x1="1136" />
        </branch>
        <branch name="XLXN_2(3:0)">
            <wire x2="1312" y1="880" y2="880" x1="1136" />
        </branch>
        <branch name="XLXN_3(7:0)">
            <wire x2="1312" y1="944" y2="944" x1="1136" />
        </branch>
        <branch name="XLXN_4(7:0)">
            <wire x2="1312" y1="1008" y2="1008" x1="1136" />
        </branch>
        <branch name="XLXN_5(7:0)">
            <wire x2="1312" y1="1072" y2="1072" x1="1136" />
        </branch>
        <branch name="XLXN_6(7:0)">
            <wire x2="1312" y1="1136" y2="1136" x1="1136" />
        </branch>
        <branch name="XLXN_7(7:0)">
            <wire x2="1312" y1="1200" y2="1200" x1="1136" />
        </branch>
        <branch name="XLXN_8(7:0)">
            <wire x2="1312" y1="1264" y2="1264" x1="1136" />
        </branch>
        <branch name="XLXN_9(7:0)">
            <wire x2="1312" y1="1328" y2="1328" x1="1136" />
        </branch>
        <branch name="XLXN_10(7:0)">
            <wire x2="1312" y1="1392" y2="1392" x1="1136" />
        </branch>
        <branch name="XLXN_11(7:0)">
            <wire x2="1312" y1="1456" y2="1456" x1="1136" />
        </branch>
        <branch name="XLXN_12(3:0)">
            <wire x2="1312" y1="1520" y2="1520" x1="1136" />
        </branch>
        <branch name="XLXN_13(3:0)">
            <wire x2="1312" y1="1584" y2="1584" x1="1136" />
        </branch>
        <branch name="XLXN_14(3:0)">
            <wire x2="1312" y1="1648" y2="1648" x1="1136" />
        </branch>
        <branch name="XLXN_15(3:0)">
            <wire x2="1312" y1="1712" y2="1712" x1="1136" />
        </branch>
        <branch name="XLXN_16(3:0)">
            <wire x2="1312" y1="1776" y2="1776" x1="1136" />
        </branch>
        <branch name="XLXN_17(3:0)">
            <wire x2="1312" y1="1840" y2="1840" x1="1136" />
        </branch>
        <branch name="XLXN_18(3:0)">
            <wire x2="1312" y1="1904" y2="1904" x1="1136" />
        </branch>
        <branch name="XLXN_19(3:0)">
            <wire x2="1312" y1="1968" y2="1968" x1="1136" />
        </branch>
        <branch name="XLXN_20(3:0)">
            <wire x2="1312" y1="2032" y2="2032" x1="1136" />
        </branch>
        <branch name="XLXN_21(11:0)">
            <wire x2="2208" y1="816" y2="816" x1="1696" />
        </branch>
        <branch name="XLXN_28(7:0)">
            <wire x2="672" y1="1840" y2="1840" x1="592" />
            <wire x2="592" y1="1840" y2="2160" x1="592" />
            <wire x2="1840" y1="2160" y2="2160" x1="592" />
            <wire x2="1840" y1="560" y2="560" x1="1744" />
            <wire x2="1840" y1="560" y2="2160" x1="1840" />
        </branch>
        <branch name="XLXN_29">
            <wire x2="672" y1="1968" y2="1968" x1="656" />
            <wire x2="656" y1="1968" y2="2128" x1="656" />
            <wire x2="1792" y1="2128" y2="2128" x1="656" />
            <wire x2="1792" y1="624" y2="624" x1="1744" />
            <wire x2="1792" y1="624" y2="2128" x1="1792" />
        </branch>
        <branch name="writedata(15:0)">
            <wire x2="672" y1="1584" y2="1584" x1="640" />
        </branch>
        <branch name="select(6:0)">
            <wire x2="672" y1="1712" y2="1712" x1="640" />
        </branch>
        <branch name="mem_en">
            <wire x2="672" y1="1200" y2="1200" x1="640" />
        </branch>
        <branch name="memwrite">
            <wire x2="672" y1="1328" y2="1328" x1="640" />
        </branch>
        <instance x="1312" y="2064" name="XLXI_3" orien="R0">
        </instance>
        <branch name="rst">
            <wire x2="128" y1="1952" y2="1952" x1="32" />
            <wire x2="32" y1="1952" y2="2592" x1="32" />
            <wire x2="80" y1="2592" y2="2592" x1="32" />
            <wire x2="128" y1="128" y2="128" x1="112" />
            <wire x2="576" y1="128" y2="128" x1="128" />
            <wire x2="576" y1="128" y2="816" x1="576" />
            <wire x2="672" y1="816" y2="816" x1="576" />
            <wire x2="1120" y1="128" y2="128" x1="576" />
            <wire x2="1120" y1="128" y2="560" x1="1120" />
            <wire x2="1312" y1="560" y2="560" x1="1120" />
            <wire x2="1984" y1="128" y2="128" x1="1120" />
            <wire x2="1984" y1="128" y2="624" x1="1984" />
            <wire x2="2208" y1="624" y2="624" x1="1984" />
            <wire x2="128" y1="128" y2="1952" x1="128" />
        </branch>
        <branch name="XLXN_22(23:0)">
            <wire x2="1312" y1="688" y2="688" x1="1136" />
        </branch>
        <branch name="XLXN_23">
            <wire x2="1312" y1="624" y2="624" x1="1136" />
        </branch>
        <branch name="en">
            <wire x2="416" y1="208" y2="208" x1="112" />
            <wire x2="416" y1="208" y2="1072" x1="416" />
            <wire x2="672" y1="1072" y2="1072" x1="416" />
            <wire x2="1184" y1="208" y2="208" x1="416" />
            <wire x2="1184" y1="208" y2="496" x1="1184" />
            <wire x2="1312" y1="496" y2="496" x1="1184" />
            <wire x2="1920" y1="208" y2="208" x1="1184" />
            <wire x2="1920" y1="208" y2="752" x1="1920" />
            <wire x2="2208" y1="752" y2="752" x1="1920" />
        </branch>
        <branch name="clk">
            <wire x2="208" y1="2048" y2="2048" x1="80" />
            <wire x2="80" y1="2048" y2="2336" x1="80" />
            <wire x2="208" y1="48" y2="48" x1="112" />
            <wire x2="464" y1="48" y2="48" x1="208" />
            <wire x2="464" y1="48" y2="688" x1="464" />
            <wire x2="672" y1="688" y2="688" x1="464" />
            <wire x2="1232" y1="48" y2="48" x1="464" />
            <wire x2="1232" y1="48" y2="432" x1="1232" />
            <wire x2="1312" y1="432" y2="432" x1="1232" />
            <wire x2="2080" y1="48" y2="48" x1="1232" />
            <wire x2="2080" y1="48" y2="560" x1="2080" />
            <wire x2="2208" y1="560" y2="560" x1="2080" />
            <wire x2="208" y1="48" y2="2048" x1="208" />
        </branch>
        <instance x="1312" y="720" name="XLXI_6" orien="R0">
        </instance>
        <instance x="2208" y="848" name="XLXI_5" orien="R0">
        </instance>
        <branch name="MISO">
            <wire x2="1312" y1="368" y2="368" x1="960" />
        </branch>
        <iomarker fontsize="28" x="640" y="1584" name="writedata(15:0)" orien="R180" />
        <iomarker fontsize="28" x="640" y="1712" name="select(6:0)" orien="R180" />
        <iomarker fontsize="28" x="640" y="1200" name="mem_en" orien="R180" />
        <iomarker fontsize="28" x="640" y="1328" name="memwrite" orien="R180" />
        <iomarker fontsize="28" x="112" y="48" name="clk" orien="R180" />
        <iomarker fontsize="28" x="112" y="128" name="rst" orien="R180" />
        <iomarker fontsize="28" x="112" y="208" name="en" orien="R180" />
        <iomarker fontsize="28" x="960" y="368" name="MISO" orien="R180" />
        <branch name="XLXN_55">
            <wire x2="2928" y1="432" y2="432" x1="1744" />
        </branch>
        <branch name="XLXN_141">
            <wire x2="2832" y1="816" y2="816" x1="2592" />
            <wire x2="2832" y1="496" y2="816" x1="2832" />
            <wire x2="2928" y1="496" y2="496" x1="2832" />
        </branch>
        <branch name="MOSI">
            <wire x2="3312" y1="224" y2="224" x1="3104" />
        </branch>
        <iomarker fontsize="28" x="3312" y="224" name="MOSI" orien="R0" />
        <branch name="SCK">
            <wire x2="3280" y1="464" y2="464" x1="3248" />
        </branch>
        <iomarker fontsize="28" x="3280" y="464" name="SCK" orien="R0" />
        <branch name="DAC_cs">
            <wire x2="2976" y1="2464" y2="2464" x1="464" />
        </branch>
        <branch name="flash_cs">
            <wire x2="2976" y1="2400" y2="2400" x1="464" />
        </branch>
        <branch name="XLXN_147">
            <wire x2="2784" y1="2336" y2="2336" x1="464" />
            <wire x2="2784" y1="320" y2="560" x1="2784" />
            <wire x2="2928" y1="560" y2="560" x1="2784" />
            <wire x2="2784" y1="560" y2="2336" x1="2784" />
        </branch>
        <branch name="XLXN_150">
            <wire x2="2192" y1="2528" y2="2528" x1="464" />
            <wire x2="2208" y1="688" y2="688" x1="2192" />
            <wire x2="2192" y1="688" y2="2528" x1="2192" />
        </branch>
        <iomarker fontsize="28" x="2976" y="2464" name="DAC_cs" orien="R0" />
        <iomarker fontsize="28" x="2976" y="2400" name="flash_cs" orien="R0" />
        <instance x="2784" y="352" name="MOSI_mux" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="-20" type="instance" />
        </instance>
        <branch name="XLXN_54">
            <wire x2="2320" y1="368" y2="368" x1="1744" />
            <wire x2="2784" y1="192" y2="192" x1="2320" />
            <wire x2="2320" y1="192" y2="368" x1="2320" />
        </branch>
        <branch name="XLXN_140">
            <wire x2="2608" y1="560" y2="560" x1="2592" />
            <wire x2="2784" y1="256" y2="256" x1="2608" />
            <wire x2="2608" y1="256" y2="560" x1="2608" />
        </branch>
        <instance x="2928" y="592" name="SCK_mux" orien="R0">
            <attrtext style="fontsize:28;fontname:Arial" attrname="InstName" x="0" y="-20" type="instance" />
        </instance>
        <instance x="80" y="2624" name="XLXI_23" orien="R0">
        </instance>
        <branch name="XLXN_149">
            <wire x2="320" y1="944" y2="1888" x1="320" />
            <wire x2="544" y1="1888" y2="1888" x1="320" />
            <wire x2="544" y1="1888" y2="2592" x1="544" />
            <wire x2="672" y1="944" y2="944" x1="320" />
            <wire x2="544" y1="2592" y2="2592" x1="464" />
        </branch>
    </sheet>
</drawing>