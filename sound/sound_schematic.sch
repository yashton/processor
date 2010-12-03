<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
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
        <signal name="writedata(15:0)" />
        <signal name="sound_select(6:0)" />
        <signal name="mem_en" />
        <signal name="memwrite" />
        <signal name="rst" />
        <signal name="en" />
        <signal name="clk" />
        <signal name="MOSI" />
        <signal name="SCK" />
        <signal name="DAC_cs" />
        <signal name="XLXN_149" />
        <signal name="XLXN_150" />
        <signal name="sound_data(15:0)" />
        <signal name="rom_data(7:0)" />
        <signal name="rom_ready" />
        <signal name="rom_load" />
        <signal name="rom_addr(23:0)" />
        <port polarity="Input" name="writedata(15:0)" />
        <port polarity="Input" name="sound_select(6:0)" />
        <port polarity="Input" name="mem_en" />
        <port polarity="Input" name="memwrite" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="en" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="MOSI" />
        <port polarity="Output" name="SCK" />
        <port polarity="Output" name="DAC_cs" />
        <port polarity="Output" name="sound_data(15:0)" />
        <port polarity="Input" name="rom_data(7:0)" />
        <port polarity="Input" name="rom_ready" />
        <port polarity="Output" name="rom_load" />
        <port polarity="Output" name="rom_addr(23:0)" />
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
            <timestamp>2010-12-2T20:41:25</timestamp>
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
            <rect width="336" x="64" y="-1504" height="1588" />
            <line x2="464" y1="-1440" y2="-1440" x1="400" />
            <line x2="464" y1="-1376" y2="-1376" x1="400" />
            <rect width="64" x="400" y="-1388" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="464" y1="32" y2="32" x1="400" />
            <rect width="64" x="400" y="20" height="24" />
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
        <blockdef name="sample_frequency_generator">
            <timestamp>2010-12-3T2:39:37</timestamp>
            <rect width="256" x="64" y="-204" height="204" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <block symbolname="sound_controller" name="sound_ctrl">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_149" name="load" />
            <blockpin signalname="en" name="en" />
            <blockpin signalname="mem_en" name="mem_en" />
            <blockpin signalname="memwrite" name="memwrite" />
            <blockpin signalname="writedata(15:0)" name="writedata(15:0)" />
            <blockpin signalname="sound_select(6:0)" name="sound_select(6:0)" />
            <blockpin signalname="rom_data(7:0)" name="rom_data(7:0)" />
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
            <blockpin signalname="rom_load" name="rom_load" />
            <blockpin signalname="rom_addr(23:0)" name="rom_addr(23:0)" />
            <blockpin signalname="rom_ready" name="rom_ready" />
            <blockpin signalname="sound_data(15:0)" name="mem_data(15:0)" />
        </block>
        <block symbolname="mixer" name="mix">
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
        <block symbolname="DAC_controller" name="dac">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_150" name="load" />
            <blockpin signalname="en" name="en" />
            <blockpin signalname="XLXN_21(11:0)" name="total_sound(11:0)" />
            <blockpin signalname="MOSI" name="MOSI" />
            <blockpin signalname="SCK" name="SCK" />
        </block>
        <block symbolname="sample_frequency_generator" name="freq_gen">
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="DAC_cs" name="DAC_cs" />
            <blockpin signalname="XLXN_150" name="DAC_load" />
            <blockpin signalname="XLXN_149" name="sound_load" />
            <blockpin signalname="clk" name="clk" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
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
        <branch name="writedata(15:0)">
            <wire x2="672" y1="1584" y2="1584" x1="640" />
        </branch>
        <branch name="sound_select(6:0)">
            <wire x2="672" y1="1712" y2="1712" x1="640" />
        </branch>
        <branch name="mem_en">
            <wire x2="672" y1="1200" y2="1200" x1="640" />
        </branch>
        <branch name="memwrite">
            <wire x2="672" y1="1328" y2="1328" x1="640" />
        </branch>
        <instance x="1312" y="2064" name="mix" orien="R0">
        </instance>
        <instance x="2208" y="848" name="dac" orien="R0">
        </instance>
        <iomarker fontsize="28" x="640" y="1584" name="writedata(15:0)" orien="R180" />
        <iomarker fontsize="28" x="640" y="1712" name="sound_select(6:0)" orien="R180" />
        <iomarker fontsize="28" x="640" y="1200" name="mem_en" orien="R180" />
        <iomarker fontsize="28" x="640" y="1328" name="memwrite" orien="R180" />
        <iomarker fontsize="28" x="112" y="48" name="clk" orien="R180" />
        <iomarker fontsize="28" x="112" y="208" name="en" orien="R180" />
        <branch name="MOSI">
            <wire x2="2672" y1="560" y2="560" x1="2592" />
        </branch>
        <branch name="SCK">
            <wire x2="2688" y1="816" y2="816" x1="2592" />
        </branch>
        <branch name="DAC_cs">
            <wire x2="2656" y1="2448" y2="2448" x1="576" />
            <wire x2="2656" y1="2448" y2="2464" x1="2656" />
            <wire x2="2672" y1="2464" y2="2464" x1="2656" />
        </branch>
        <branch name="XLXN_150">
            <wire x2="2192" y1="2512" y2="2512" x1="576" />
            <wire x2="2208" y1="688" y2="688" x1="2192" />
            <wire x2="2192" y1="688" y2="2512" x1="2192" />
        </branch>
        <branch name="sound_data(15:0)">
            <wire x2="1168" y1="2096" y2="2096" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="1168" y="2096" name="sound_data(15:0)" orien="R0" />
        <branch name="en">
            <wire x2="416" y1="208" y2="208" x1="112" />
            <wire x2="1920" y1="208" y2="208" x1="416" />
            <wire x2="1920" y1="208" y2="752" x1="1920" />
            <wire x2="2208" y1="752" y2="752" x1="1920" />
            <wire x2="416" y1="208" y2="1072" x1="416" />
            <wire x2="672" y1="1072" y2="1072" x1="416" />
        </branch>
        <instance x="672" y="2064" name="sound_ctrl" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2672" y="560" name="MOSI" orien="R0" />
        <iomarker fontsize="28" x="2688" y="816" name="SCK" orien="R0" />
        <iomarker fontsize="28" x="2672" y="2464" name="DAC_cs" orien="R0" />
        <iomarker fontsize="28" x="112" y="128" name="rst" orien="R180" />
        <instance x="192" y="2608" name="freq_gen" orien="R0">
        </instance>
        <branch name="XLXN_149">
            <wire x2="656" y1="2576" y2="2576" x1="576" />
            <wire x2="672" y1="944" y2="944" x1="656" />
            <wire x2="656" y1="944" y2="2576" x1="656" />
        </branch>
        <branch name="rom_data(7:0)">
            <wire x2="672" y1="1840" y2="1840" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="1840" name="rom_data(7:0)" orien="R180" />
        <branch name="clk">
            <wire x2="192" y1="48" y2="48" x1="112" />
            <wire x2="192" y1="48" y2="2448" x1="192" />
            <wire x2="464" y1="48" y2="48" x1="192" />
            <wire x2="464" y1="48" y2="688" x1="464" />
            <wire x2="672" y1="688" y2="688" x1="464" />
            <wire x2="2080" y1="48" y2="48" x1="464" />
            <wire x2="2080" y1="48" y2="560" x1="2080" />
            <wire x2="2208" y1="560" y2="560" x1="2080" />
        </branch>
        <branch name="rst">
            <wire x2="144" y1="128" y2="128" x1="112" />
            <wire x2="144" y1="128" y2="2576" x1="144" />
            <wire x2="192" y1="2576" y2="2576" x1="144" />
            <wire x2="576" y1="128" y2="128" x1="144" />
            <wire x2="576" y1="128" y2="816" x1="576" />
            <wire x2="672" y1="816" y2="816" x1="576" />
            <wire x2="1984" y1="128" y2="128" x1="576" />
            <wire x2="1984" y1="128" y2="624" x1="1984" />
            <wire x2="2208" y1="624" y2="624" x1="1984" />
        </branch>
        <branch name="rom_ready">
            <wire x2="672" y1="1968" y2="1968" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="1968" name="rom_ready" orien="R180" />
        <branch name="rom_load">
            <wire x2="1392" y1="624" y2="624" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="1392" y="624" name="rom_load" orien="R0" />
        <branch name="rom_addr(23:0)">
            <wire x2="1168" y1="688" y2="688" x1="1136" />
        </branch>
        <iomarker fontsize="28" x="1168" y="688" name="rom_addr(23:0)" orien="R0" />
    </sheet>
</drawing>