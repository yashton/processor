<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="writedata(15:0)" />
        <signal name="y(9:0)" />
        <signal name="XLXN_273" />
        <signal name="vlookahead" />
        <signal name="line_start" />
        <signal name="tile_memdata(15:0)" />
        <signal name="tile_addr(12:0)" />
        <signal name="sprite_addr(9:0)" />
        <signal name="sprite_memdata(15:0)" />
        <signal name="XLXN_510(9:0)" />
        <signal name="XLXN_511(1:0)" />
        <signal name="XLXN_513(2:0)" />
        <signal name="XLXN_514(2:0)" />
        <signal name="XLXN_515" />
        <signal name="XLXN_516(2:0)" />
        <signal name="XLXN_517" />
        <signal name="XLXN_518(3:0)" />
        <signal name="XLXN_519(2:0)" />
        <signal name="XLXN_520(3:0)" />
        <signal name="palette_addr(9:0)" />
        <signal name="R(7:0)" />
        <signal name="G(7:0)" />
        <signal name="B(7:0)" />
        <signal name="brightness(7:0)" />
        <signal name="XLXN_529(3:0)" />
        <signal name="XLXN_531(31:0)" />
        <signal name="sprite_memenable" />
        <signal name="memwrite" />
        <signal name="x(9:0)" />
        <signal name="tile_memenable" />
        <signal name="rst" />
        <signal name="clk" />
        <signal name="XLXN_319" />
        <signal name="palette_memdata(15:0)" />
        <signal name="palette_memenable" />
        <signal name="XLXN_532(4:0)" />
        <signal name="sprite_priority(7:0)" />
        <signal name="XLXN_550" />
        <signal name="XLXN_551(8:0)" />
        <signal name="XLXN_552(8:0)" />
        <signal name="XLXN_553(8:0)" />
        <port polarity="Input" name="writedata(15:0)" />
        <port polarity="Input" name="y(9:0)" />
        <port polarity="Input" name="vlookahead" />
        <port polarity="Input" name="line_start" />
        <port polarity="Output" name="tile_memdata(15:0)" />
        <port polarity="Input" name="tile_addr(12:0)" />
        <port polarity="Input" name="sprite_addr(9:0)" />
        <port polarity="Output" name="sprite_memdata(15:0)" />
        <port polarity="Input" name="palette_addr(9:0)" />
        <port polarity="Output" name="R(7:0)" />
        <port polarity="Output" name="G(7:0)" />
        <port polarity="Output" name="B(7:0)" />
        <port polarity="Input" name="brightness(7:0)" />
        <port polarity="Input" name="sprite_memenable" />
        <port polarity="Input" name="memwrite" />
        <port polarity="Input" name="x(9:0)" />
        <port polarity="Input" name="tile_memenable" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="palette_memdata(15:0)" />
        <port polarity="Input" name="palette_memenable" />
        <port polarity="Input" name="sprite_priority(7:0)" />
        <blockdef name="palette">
            <timestamp>2010-12-2T22:31:11</timestamp>
            <rect width="336" x="64" y="-448" height="524" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="400" y="-364" height="24" />
            <line x2="464" y1="-352" y2="-352" x1="400" />
            <rect width="64" x="400" y="-300" height="24" />
            <line x2="464" y1="-288" y2="-288" x1="400" />
            <rect width="64" x="400" y="-236" height="24" />
            <line x2="464" y1="-224" y2="-224" x1="400" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="400" y="-44" height="24" />
            <line x2="400" y1="-32" y2="-32" x1="464" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="line_buffer">
            <timestamp>2010-11-14T1:4:47</timestamp>
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="496" y1="-928" y2="-928" x1="432" />
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
            <line x2="496" y1="-496" y2="-496" x1="432" />
            <rect width="64" x="432" y="-444" height="24" />
            <line x2="496" y1="-432" y2="-432" x1="432" />
            <line x2="192" y1="-340" y2="-392" x1="192" />
            <rect width="24" x="180" y="-392" height="56" />
            <rect width="24" x="276" y="-392" height="56" />
            <line x2="288" y1="-392" y2="-340" x1="288" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-1068" height="24" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-1248" y2="-1248" x1="64" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <rect width="368" x="64" y="-1280" height="888" />
        </blockdef>
        <blockdef name="tile_table">
            <timestamp>2010-10-26T2:3:37</timestamp>
            <rect width="352" x="64" y="-896" height="968" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <rect width="64" x="0" y="-28" height="24" />
            <line x2="0" y1="-16" y2="-16" x1="64" />
            <rect width="64" x="0" y="36" height="24" />
            <line x2="0" y1="48" y2="48" x1="64" />
            <rect width="64" x="416" y="36" height="24" />
            <line x2="480" y1="48" y2="48" x1="416" />
            <line x2="288" y1="-956" y2="-896" x1="288" />
            <line x2="192" y1="-956" y2="-896" x1="192" />
            <rect width="24" x="276" y="-960" height="64" />
            <rect width="24" x="180" y="-960" height="64" />
        </blockdef>
        <blockdef name="sprite_controller">
            <timestamp>2010-11-14T1:12:37</timestamp>
            <rect width="416" x="64" y="-896" height="976" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="544" y1="-352" y2="-352" x1="480" />
            <rect width="64" x="480" y="-428" height="24" />
            <line x2="544" y1="-416" y2="-416" x1="480" />
            <line x2="544" y1="-480" y2="-480" x1="480" />
            <rect width="64" x="480" y="-300" height="24" />
            <line x2="544" y1="-288" y2="-288" x1="480" />
            <rect width="64" x="480" y="-236" height="24" />
            <line x2="544" y1="-224" y2="-224" x1="480" />
            <rect width="64" x="480" y="-172" height="24" />
            <line x2="544" y1="-160" y2="-160" x1="480" />
            <rect width="64" x="480" y="-620" height="24" />
            <line x2="544" y1="-608" y2="-608" x1="480" />
            <line x2="544" y1="-544" y2="-544" x1="480" />
            <rect width="64" x="480" y="-556" height="24" />
            <rect width="64" x="480" y="-812" height="24" />
            <line x2="544" y1="-800" y2="-800" x1="480" />
            <rect width="64" x="480" y="-748" height="24" />
            <line x2="544" y1="-736" y2="-736" x1="480" />
            <rect width="64" x="480" y="-684" height="24" />
            <line x2="544" y1="-672" y2="-672" x1="480" />
            <line x2="544" y1="-864" y2="-864" x1="480" />
            <rect width="64" x="480" y="20" height="24" />
            <line x2="544" y1="32" y2="32" x1="480" />
        </blockdef>
        <blockdef name="BG_Filler">
            <timestamp>2010-12-2T22:39:6</timestamp>
            <rect width="256" x="64" y="-320" height="200" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="320" y="-300" height="24" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
        </blockdef>
        <blockdef name="color_mux">
            <timestamp>2010-12-3T4:1:35</timestamp>
            <rect width="304" x="64" y="-192" height="192" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <block symbolname="line_buffer" name="line_buff">
            <blockpin signalname="XLXN_319" name="load" />
            <blockpin signalname="XLXN_273" name="line_busy" />
            <blockpin signalname="XLXN_510(9:0)" name="addr(9:0)" />
            <blockpin signalname="XLXN_511(1:0)" name="z(1:0)" />
            <blockpin signalname="XLXN_532(4:0)" name="palette(4:0)" />
            <blockpin signalname="XLXN_513(2:0)" name="first(2:0)" />
            <blockpin signalname="XLXN_514(2:0)" name="last(2:0)" />
            <blockpin signalname="XLXN_550" name="enable" />
            <blockpin signalname="XLXN_551(8:0)" name="index(8:0)" />
            <blockpin signalname="XLXN_529(3:0)" name="current_tile(3:0)" />
            <blockpin signalname="XLXN_531(31:0)" name="tile_data(31:0)" />
            <blockpin signalname="y(9:0)" name="y(9:0)" />
            <blockpin signalname="x(9:0)" name="x(9:0)" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="line_start" name="line_start" />
        </block>
        <block symbolname="palette" name="palette_output">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_553(8:0)" name="index(8:0)" />
            <blockpin signalname="brightness(7:0)" name="brightness(7:0)" />
            <blockpin signalname="R(7:0)" name="red(7:0)" />
            <blockpin signalname="G(7:0)" name="green(7:0)" />
            <blockpin signalname="B(7:0)" name="blue(7:0)" />
            <blockpin signalname="writedata(15:0)" name="writedata(15:0)" />
            <blockpin signalname="memwrite" name="memwrite" />
            <blockpin signalname="palette_addr(9:0)" name="memaddr(9:0)" />
            <blockpin signalname="palette_memdata(15:0)" name="memdata(15:0)" />
            <blockpin signalname="palette_memenable" name="memenable" />
        </block>
        <block symbolname="sprite_controller" name="sprites">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="y(9:0)" name="y(9:0)" />
            <blockpin signalname="XLXN_273" name="line_busy" />
            <blockpin signalname="writedata(15:0)" name="writedata(15:0)" />
            <blockpin signalname="memwrite" name="memwrite" />
            <blockpin signalname="sprite_addr(9:0)" name="memaddr(9:0)" />
            <blockpin signalname="sprite_memenable" name="memenable" />
            <blockpin signalname="line_start" name="scanline_start" />
            <blockpin signalname="vlookahead" name="vlookahead" />
            <blockpin signalname="sprite_priority(7:0)" name="sprite_priority(7:0)" />
            <blockpin signalname="XLXN_517" name="tile_table" />
            <blockpin signalname="XLXN_516(2:0)" name="sizeX(2:0)" />
            <blockpin signalname="XLXN_515" name="hFlip" />
            <blockpin signalname="XLXN_518(3:0)" name="tile_y_total(3:0)" />
            <blockpin signalname="XLXN_519(2:0)" name="tile_y_offset(2:0)" />
            <blockpin signalname="XLXN_520(3:0)" name="tile_x(3:0)" />
            <blockpin signalname="XLXN_513(2:0)" name="first(2:0)" />
            <blockpin signalname="XLXN_514(2:0)" name="last(2:0)" />
            <blockpin signalname="XLXN_510(9:0)" name="line_addr(9:0)" />
            <blockpin signalname="XLXN_511(1:0)" name="line_z(1:0)" />
            <blockpin signalname="XLXN_532(4:0)" name="line_palette(4:0)" />
            <blockpin signalname="XLXN_319" name="line_load" />
            <blockpin signalname="sprite_memdata(15:0)" name="memdata(15:0)" />
        </block>
        <block symbolname="tile_table" name="tile_tbl">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_319" name="load" />
            <blockpin signalname="XLXN_515" name="hFlip" />
            <blockpin signalname="XLXN_516(2:0)" name="size_x(2:0)" />
            <blockpin signalname="XLXN_518(3:0)" name="tile_y_total(3:0)" />
            <blockpin signalname="XLXN_519(2:0)" name="tile_y_offset(2:0)" />
            <blockpin signalname="XLXN_517" name="tile_table" />
            <blockpin signalname="XLXN_520(3:0)" name="tile_x(3:0)" />
            <blockpin signalname="tile_memenable" name="memenable" />
            <blockpin signalname="memwrite" name="memwrite" />
            <blockpin signalname="tile_addr(12:0)" name="memaddr(12:0)" />
            <blockpin signalname="writedata(15:0)" name="writedata(15:0)" />
            <blockpin signalname="tile_memdata(15:0)" name="memdata(15:0)" />
            <blockpin signalname="XLXN_529(3:0)" name="current_tile(3:0)" />
            <blockpin signalname="XLXN_531(31:0)" name="tile_data(31:0)" />
        </block>
        <block symbolname="BG_Filler" name="background">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_552(8:0)" name="indexOut(8:0)" />
            <blockpin signalname="y(9:0)" name="y(9:0)" />
            <blockpin signalname="x(9:0)" name="x(9:0)" />
        </block>
        <block symbolname="color_mux" name="colormux">
            <blockpin signalname="XLXN_553(8:0)" name="index(8:0)" />
            <blockpin signalname="XLXN_552(8:0)" name="bg_index(8:0)" />
            <blockpin signalname="XLXN_550" name="sprite_enable" />
            <blockpin signalname="XLXN_551(8:0)" name="sprite_index(8:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="writedata(15:0)">
            <wire x2="512" y1="1696" y2="1696" x1="320" />
            <wire x2="512" y1="1696" y2="2608" x1="512" />
            <wire x2="1520" y1="2608" y2="2608" x1="512" />
            <wire x2="2144" y1="2608" y2="2608" x1="1520" />
            <wire x2="672" y1="1696" y2="1696" x1="512" />
            <wire x2="1520" y1="2496" y2="2608" x1="1520" />
            <wire x2="1616" y1="2496" y2="2496" x1="1520" />
            <wire x2="2144" y1="1616" y2="2608" x1="2144" />
            <wire x2="2880" y1="1616" y2="1616" x1="2144" />
        </branch>
        <branch name="y(9:0)">
            <wire x2="464" y1="672" y2="672" x1="272" />
            <wire x2="464" y1="672" y2="1248" x1="464" />
            <wire x2="672" y1="1248" y2="1248" x1="464" />
            <wire x2="1168" y1="672" y2="672" x1="464" />
            <wire x2="1168" y1="672" y2="736" x1="1168" />
            <wire x2="1616" y1="736" y2="736" x1="1168" />
            <wire x2="2176" y1="304" y2="304" x1="1168" />
            <wire x2="2176" y1="304" y2="656" x1="2176" />
            <wire x2="2256" y1="656" y2="656" x1="2176" />
            <wire x2="1168" y1="304" y2="672" x1="1168" />
        </branch>
        <branch name="XLXN_273">
            <wire x2="592" y1="400" y2="928" x1="592" />
            <wire x2="672" y1="928" y2="928" x1="592" />
            <wire x2="2144" y1="400" y2="400" x1="592" />
            <wire x2="2144" y1="400" y2="800" x1="2144" />
            <wire x2="2144" y1="800" y2="800" x1="2112" />
        </branch>
        <branch name="vlookahead">
            <wire x2="528" y1="576" y2="576" x1="320" />
            <wire x2="528" y1="576" y2="1184" x1="528" />
            <wire x2="672" y1="1184" y2="1184" x1="528" />
        </branch>
        <branch name="line_start">
            <wire x2="560" y1="480" y2="480" x1="288" />
            <wire x2="560" y1="480" y2="1120" x1="560" />
            <wire x2="672" y1="1120" y2="1120" x1="560" />
            <wire x2="1376" y1="480" y2="480" x1="560" />
            <wire x2="1376" y1="480" y2="608" x1="1376" />
            <wire x2="1616" y1="608" y2="608" x1="1376" />
        </branch>
        <instance x="1616" y="1728" name="line_buff" orien="R0">
        </instance>
        <branch name="tile_memdata(15:0)">
            <wire x2="2160" y1="2496" y2="2496" x1="2096" />
        </branch>
        <branch name="tile_addr(12:0)">
            <wire x2="1616" y1="2432" y2="2432" x1="1424" />
        </branch>
        <branch name="sprite_addr(9:0)">
            <wire x2="672" y1="1632" y2="1632" x1="320" />
        </branch>
        <branch name="sprite_memdata(15:0)">
            <wire x2="1232" y1="1824" y2="1824" x1="1152" />
            <wire x2="1152" y1="1824" y2="2160" x1="1152" />
            <wire x2="1232" y1="2160" y2="2160" x1="1152" />
            <wire x2="1232" y1="1696" y2="1696" x1="1216" />
            <wire x2="1232" y1="1696" y2="1824" x1="1232" />
        </branch>
        <branch name="XLXN_510(9:0)">
            <wire x2="1616" y1="864" y2="864" x1="1216" />
        </branch>
        <branch name="XLXN_511(1:0)">
            <wire x2="1616" y1="928" y2="928" x1="1216" />
        </branch>
        <branch name="XLXN_513(2:0)">
            <wire x2="1616" y1="1056" y2="1056" x1="1216" />
        </branch>
        <branch name="XLXN_514(2:0)">
            <wire x2="1616" y1="1120" y2="1120" x1="1216" />
        </branch>
        <branch name="XLXN_515">
            <wire x2="1424" y1="1184" y2="1184" x1="1216" />
            <wire x2="1424" y1="1184" y2="1776" x1="1424" />
            <wire x2="1616" y1="1776" y2="1776" x1="1424" />
        </branch>
        <branch name="XLXN_516(2:0)">
            <wire x2="1408" y1="1248" y2="1248" x1="1216" />
            <wire x2="1408" y1="1248" y2="1840" x1="1408" />
            <wire x2="1616" y1="1840" y2="1840" x1="1408" />
        </branch>
        <branch name="XLXN_517">
            <wire x2="1392" y1="1312" y2="1312" x1="1216" />
            <wire x2="1392" y1="1312" y2="1904" x1="1392" />
            <wire x2="1616" y1="1904" y2="1904" x1="1392" />
        </branch>
        <branch name="XLXN_518(3:0)">
            <wire x2="1376" y1="1376" y2="1376" x1="1216" />
            <wire x2="1376" y1="1376" y2="1968" x1="1376" />
            <wire x2="1616" y1="1968" y2="1968" x1="1376" />
        </branch>
        <branch name="XLXN_519(2:0)">
            <wire x2="1360" y1="1440" y2="1440" x1="1216" />
            <wire x2="1360" y1="1440" y2="2032" x1="1360" />
            <wire x2="1616" y1="2032" y2="2032" x1="1360" />
        </branch>
        <branch name="XLXN_520(3:0)">
            <wire x2="1344" y1="1504" y2="1504" x1="1216" />
            <wire x2="1344" y1="1504" y2="2096" x1="1344" />
            <wire x2="1616" y1="2096" y2="2096" x1="1344" />
        </branch>
        <branch name="R(7:0)">
            <wire x2="3376" y1="1232" y2="1232" x1="3344" />
        </branch>
        <branch name="G(7:0)">
            <wire x2="3376" y1="1296" y2="1296" x1="3344" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="3376" y1="1360" y2="1360" x1="3344" />
        </branch>
        <branch name="XLXN_529(3:0)">
            <wire x2="1808" y1="1392" y2="1488" x1="1808" />
        </branch>
        <branch name="XLXN_531(31:0)">
            <wire x2="1904" y1="1392" y2="1488" x1="1904" />
        </branch>
        <instance x="672" y="1664" name="sprites" orien="R0">
        </instance>
        <branch name="sprite_memenable">
            <wire x2="672" y1="1504" y2="1504" x1="640" />
        </branch>
        <branch name="memwrite">
            <wire x2="576" y1="1568" y2="1568" x1="256" />
            <wire x2="672" y1="1568" y2="1568" x1="576" />
            <wire x2="576" y1="1568" y2="2368" x1="576" />
            <wire x2="1616" y1="2368" y2="2368" x1="576" />
            <wire x2="576" y1="2368" y2="2576" x1="576" />
            <wire x2="2112" y1="2576" y2="2576" x1="576" />
            <wire x2="2112" y1="1488" y2="2576" x1="2112" />
            <wire x2="2880" y1="1488" y2="1488" x1="2112" />
        </branch>
        <branch name="x(9:0)">
            <wire x2="1328" y1="592" y2="592" x1="1296" />
            <wire x2="1328" y1="592" y2="672" x1="1328" />
            <wire x2="1616" y1="672" y2="672" x1="1328" />
            <wire x2="2160" y1="320" y2="320" x1="1328" />
            <wire x2="2160" y1="320" y2="720" x1="2160" />
            <wire x2="2256" y1="720" y2="720" x1="2160" />
            <wire x2="1328" y1="320" y2="592" x1="1328" />
        </branch>
        <branch name="tile_memenable">
            <wire x2="1616" y1="2304" y2="2304" x1="1456" />
        </branch>
        <branch name="rst">
            <wire x2="624" y1="208" y2="208" x1="512" />
            <wire x2="624" y1="208" y2="864" x1="624" />
            <wire x2="672" y1="864" y2="864" x1="624" />
            <wire x2="1488" y1="208" y2="208" x1="624" />
            <wire x2="1488" y1="208" y2="544" x1="1488" />
            <wire x2="1520" y1="544" y2="544" x1="1488" />
            <wire x2="1616" y1="544" y2="544" x1="1520" />
            <wire x2="1520" y1="544" y2="1648" x1="1520" />
            <wire x2="1616" y1="1648" y2="1648" x1="1520" />
        </branch>
        <instance x="1616" y="2448" name="tile_tbl" orien="R0">
        </instance>
        <branch name="XLXN_319">
            <wire x2="1504" y1="800" y2="800" x1="1216" />
            <wire x2="1616" y1="800" y2="800" x1="1504" />
            <wire x2="1504" y1="800" y2="1712" x1="1504" />
            <wire x2="1616" y1="1712" y2="1712" x1="1504" />
        </branch>
        <branch name="palette_memdata(15:0)">
            <wire x2="3104" y1="1712" y2="1808" x1="3104" />
            <wire x2="3168" y1="1808" y2="1808" x1="3104" />
            <wire x2="3360" y1="1712" y2="1712" x1="3104" />
            <wire x2="3360" y1="1552" y2="1552" x1="3344" />
            <wire x2="3360" y1="1552" y2="1712" x1="3360" />
        </branch>
        <iomarker fontsize="28" x="512" y="144" name="clk" orien="R180" />
        <iomarker fontsize="28" x="512" y="208" name="rst" orien="R180" />
        <iomarker fontsize="28" x="272" y="672" name="y(9:0)" orien="R180" />
        <iomarker fontsize="28" x="640" y="1504" name="sprite_memenable" orien="R180" />
        <iomarker fontsize="28" x="288" y="480" name="line_start" orien="R180" />
        <iomarker fontsize="28" x="320" y="576" name="vlookahead" orien="R180" />
        <iomarker fontsize="28" x="2160" y="2496" name="tile_memdata(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1232" y="2160" name="sprite_memdata(15:0)" orien="R0" />
        <iomarker fontsize="28" x="1456" y="2304" name="tile_memenable" orien="R180" />
        <iomarker fontsize="28" x="1424" y="2432" name="tile_addr(12:0)" orien="R180" />
        <iomarker fontsize="28" x="256" y="1568" name="memwrite" orien="R180" />
        <iomarker fontsize="28" x="320" y="1632" name="sprite_addr(9:0)" orien="R180" />
        <iomarker fontsize="28" x="320" y="1696" name="writedata(15:0)" orien="R180" />
        <branch name="XLXN_532(4:0)">
            <wire x2="1616" y1="992" y2="992" x1="1216" />
        </branch>
        <branch name="sprite_priority(7:0)">
            <wire x2="672" y1="1376" y2="1376" x1="640" />
        </branch>
        <iomarker fontsize="28" x="640" y="1376" name="sprite_priority(7:0)" orien="R180" />
        <iomarker fontsize="28" x="3376" y="1360" name="B(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3376" y="1296" name="G(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3376" y="1232" name="R(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3168" y="1808" name="palette_memdata(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2848" y="1360" name="brightness(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2848" y="1424" name="palette_memenable" orien="R180" />
        <iomarker fontsize="28" x="2848" y="1552" name="palette_addr(9:0)" orien="R180" />
        <branch name="palette_addr(9:0)">
            <wire x2="2880" y1="1552" y2="1552" x1="2848" />
        </branch>
        <branch name="palette_memenable">
            <wire x2="2880" y1="1424" y2="1424" x1="2848" />
        </branch>
        <branch name="brightness(7:0)">
            <wire x2="2880" y1="1360" y2="1360" x1="2848" />
        </branch>
        <branch name="clk">
            <wire x2="656" y1="144" y2="144" x1="512" />
            <wire x2="656" y1="144" y2="800" x1="656" />
            <wire x2="672" y1="800" y2="800" x1="656" />
            <wire x2="1536" y1="144" y2="144" x1="656" />
            <wire x2="1536" y1="144" y2="480" x1="1536" />
            <wire x2="1616" y1="480" y2="480" x1="1536" />
            <wire x2="1536" y1="480" y2="1584" x1="1536" />
            <wire x2="1616" y1="1584" y2="1584" x1="1536" />
            <wire x2="2192" y1="144" y2="144" x1="1536" />
            <wire x2="2192" y1="144" y2="592" x1="2192" />
            <wire x2="2256" y1="592" y2="592" x1="2192" />
            <wire x2="2864" y1="144" y2="144" x1="2192" />
            <wire x2="2864" y1="144" y2="1168" x1="2864" />
            <wire x2="2880" y1="1168" y2="1168" x1="2864" />
        </branch>
        <instance x="2880" y="1584" name="palette_output" orien="R0">
        </instance>
        <branch name="XLXN_550">
            <wire x2="2208" y1="1232" y2="1232" x1="2112" />
        </branch>
        <branch name="XLXN_551(8:0)">
            <wire x2="2208" y1="1296" y2="1296" x1="2112" />
        </branch>
        <branch name="XLXN_552(8:0)">
            <wire x2="2656" y1="912" y2="912" x1="2128" />
            <wire x2="2128" y1="912" y2="1168" x1="2128" />
            <wire x2="2208" y1="1168" y2="1168" x1="2128" />
            <wire x2="2656" y1="592" y2="592" x1="2640" />
            <wire x2="2656" y1="592" y2="912" x1="2656" />
        </branch>
        <iomarker fontsize="28" x="1296" y="592" name="x(9:0)" orien="R180" />
        <instance x="2256" y="880" name="background" orien="R0">
        </instance>
        <instance x="2208" y="1328" name="colormux" orien="R0">
        </instance>
        <branch name="XLXN_553(8:0)">
            <wire x2="2752" y1="1168" y2="1168" x1="2640" />
            <wire x2="2752" y1="1168" y2="1296" x1="2752" />
            <wire x2="2880" y1="1296" y2="1296" x1="2752" />
        </branch>
    </sheet>
</drawing>