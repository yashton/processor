<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="clk" />
        <signal name="rst" />
        <signal name="XLXN_272" />
        <signal name="XLXN_273" />
        <signal name="XLXN_277(9:0)" />
        <signal name="XLXN_278(9:0)" />
        <signal name="writedata(15:0)" />
        <signal name="memwrite" />
        <signal name="gpudata(15:0)" />
        <signal name="XLXN_306(7:0)" />
        <signal name="XLXN_319" />
        <signal name="XLXN_427" />
        <signal name="palette_write" />
        <signal name="palette_data(23:0)" />
        <signal name="palette_wrindex(7:0)" />
        <signal name="G(7:0)" />
        <signal name="B(7:0)" />
        <signal name="bright" />
        <signal name="vsync" />
        <signal name="hsync" />
        <signal name="R(7:0)" />
        <signal name="brightness(7:0)" />
        <signal name="XLXN_480" />
        <signal name="vbright" />
        <signal name="hbright" />
        <signal name="memenable" />
        <signal name="XLXN_484(2:0)" />
        <signal name="XLXN_485(2:0)" />
        <signal name="XLXN_486(31:0)" />
        <signal name="XLXN_487" />
        <signal name="XLXN_488" />
        <signal name="XLXN_490(3:0)" />
        <signal name="XLXN_498(9:0)" />
        <signal name="XLXN_499(1:0)" />
        <signal name="XLXN_500(3:0)" />
        <signal name="XLXN_501" />
        <signal name="XLXN_502(2:0)" />
        <signal name="XLXN_503" />
        <signal name="XLXN_504(3:0)" />
        <signal name="sprite_priority(6:0)" />
        <signal name="XLXN_507(2:0)" />
        <signal name="XLXN_508(3:0)" />
        <signal name="tiledata(15:0)" />
        <signal name="tile_addr(12:0)" />
        <signal name="spriteaddr(9:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="writedata(15:0)" />
        <port polarity="Input" name="memwrite" />
        <port polarity="Output" name="gpudata(15:0)" />
        <port polarity="Input" name="palette_write" />
        <port polarity="Input" name="palette_data(23:0)" />
        <port polarity="Input" name="palette_wrindex(7:0)" />
        <port polarity="Output" name="G(7:0)" />
        <port polarity="Output" name="B(7:0)" />
        <port polarity="Output" name="bright" />
        <port polarity="Output" name="vsync" />
        <port polarity="Output" name="hsync" />
        <port polarity="Output" name="R(7:0)" />
        <port polarity="Input" name="brightness(7:0)" />
        <port polarity="Output" name="vbright" />
        <port polarity="Output" name="hbright" />
        <port polarity="Input" name="memenable" />
        <port polarity="Input" name="sprite_priority(6:0)" />
        <port polarity="Output" name="tiledata(15:0)" />
        <port polarity="Input" name="tile_addr(12:0)" />
        <port polarity="Input" name="spriteaddr(9:0)" />
        <blockdef name="palette">
            <timestamp>2010-10-18T7:31:0</timestamp>
            <rect width="336" x="64" y="-448" height="524" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
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
        </blockdef>
        <blockdef name="line_buffer">
            <timestamp>2010-10-19T19:50:6</timestamp>
            <rect width="368" x="64" y="-1216" height="968" />
            <line x2="0" y1="-1184" y2="-1184" x1="64" />
            <line x2="0" y1="-1120" y2="-1120" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="496" y1="-928" y2="-928" x1="432" />
            <rect width="64" x="0" y="-1004" height="24" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-876" height="24" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <rect width="64" x="0" y="-812" height="24" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <rect width="64" x="432" y="-300" height="24" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <rect width="64" x="0" y="-492" height="24" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="432" y1="-480" y2="-480" x1="496" />
            <rect width="64" x="432" y="-492" height="24" />
        </blockdef>
        <blockdef name="vga">
            <timestamp>2010-10-19T1:27:12</timestamp>
            <rect width="256" x="64" y="-644" height="644" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="128" y1="0" y2="64" x1="128" />
            <line x2="224" y1="64" y2="0" x1="224" />
            <line x2="176" y1="64" y2="0" x1="176" />
            <line x2="320" y1="-352" y2="-352" x1="384" />
            <line x2="320" y1="-416" y2="-416" x1="384" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
        </blockdef>
        <blockdef name="gpu">
            <timestamp>2010-10-20T3:36:9</timestamp>
            <rect width="368" x="64" y="-896" height="976" />
            <line x2="0" y1="-864" y2="-864" x1="64" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="496" y1="-480" y2="-480" x1="432" />
            <rect width="64" x="432" y="-236" height="24" />
            <line x2="496" y1="-224" y2="-224" x1="432" />
            <line x2="496" y1="-160" y2="-160" x1="432" />
            <rect width="64" x="432" y="-172" height="24" />
            <rect width="64" x="0" y="20" height="24" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="432" y="20" height="24" />
            <line x2="496" y1="32" y2="32" x1="432" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="432" y="-556" height="24" />
            <line x2="496" y1="-544" y2="-544" x1="432" />
            <line x2="496" y1="-608" y2="-608" x1="432" />
            <rect width="64" x="432" y="-812" height="24" />
            <line x2="496" y1="-800" y2="-800" x1="432" />
            <rect width="64" x="432" y="-748" height="24" />
            <line x2="496" y1="-736" y2="-736" x1="432" />
            <rect width="64" x="432" y="-684" height="24" />
            <line x2="496" y1="-672" y2="-672" x1="432" />
            <line x2="496" y1="-864" y2="-864" x1="432" />
            <rect width="64" x="432" y="-428" height="24" />
            <line x2="496" y1="-416" y2="-416" x1="432" />
            <rect width="64" x="432" y="-364" height="24" />
            <line x2="496" y1="-352" y2="-352" x1="432" />
            <rect width="64" x="432" y="-300" height="24" />
            <line x2="496" y1="-288" y2="-288" x1="432" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
        </blockdef>
        <blockdef name="tile_table">
            <timestamp>2010-10-19T19:53:50</timestamp>
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
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <rect width="64" x="0" y="-28" height="24" />
            <line x2="0" y1="-16" y2="-16" x1="64" />
            <rect width="64" x="0" y="36" height="24" />
            <line x2="0" y1="48" y2="48" x1="64" />
            <rect width="64" x="416" y="36" height="24" />
            <line x2="480" y1="48" y2="48" x1="416" />
            <line x2="480" y1="-336" y2="-336" x1="416" />
            <rect width="64" x="416" y="-284" height="24" />
            <line x2="480" y1="-272" y2="-272" x1="416" />
        </blockdef>
        <block symbolname="line_buffer" name="line_buff">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_319" name="load" />
            <blockpin signalname="XLXN_272" name="front" />
            <blockpin signalname="XLXN_273" name="line_busy" />
            <blockpin signalname="XLXN_278(9:0)" name="x(9:0)" />
            <blockpin signalname="XLXN_498(9:0)" name="addr(9:0)" />
            <blockpin signalname="XLXN_499(1:0)" name="z(1:0)" />
            <blockpin signalname="XLXN_500(3:0)" name="palette(3:0)" />
            <blockpin signalname="XLXN_485(2:0)" name="first(2:0)" />
            <blockpin signalname="XLXN_484(2:0)" name="last(2:0)" />
            <blockpin signalname="XLXN_488" name="enable" />
            <blockpin signalname="XLXN_306(7:0)" name="index(7:0)" />
            <blockpin signalname="XLXN_486(31:0)" name="tile_data(31:0)" />
            <blockpin signalname="XLXN_487" name="tile_flip" />
            <blockpin signalname="XLXN_490(3:0)" name="current_tile(3:0)" />
        </block>
        <block symbolname="vga" name="vga_controller">
            <blockpin signalname="XLXN_278(9:0)" name="x(9:0)" />
            <blockpin signalname="XLXN_277(9:0)" name="y(9:0)" />
            <blockpin signalname="XLXN_427" name="vlookahead" />
            <blockpin signalname="XLXN_272" name="front" />
            <blockpin signalname="XLXN_480" name="line_start" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="bright" name="bright" />
            <blockpin signalname="vsync" name="vsync" />
            <blockpin signalname="hsync" name="hsync" />
            <blockpin signalname="vbright" name="vbright" />
            <blockpin signalname="hbright" name="hbright" />
            <blockpin signalname="rst" name="rst" />
        </block>
        <block symbolname="gpu" name="sprite_controller">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_277(9:0)" name="y(9:0)" />
            <blockpin signalname="XLXN_273" name="line_busy" />
            <blockpin signalname="XLXN_503" name="tile_table" />
            <blockpin signalname="XLXN_485(2:0)" name="first(2:0)" />
            <blockpin signalname="XLXN_484(2:0)" name="last(2:0)" />
            <blockpin signalname="writedata(15:0)" name="writedata(15:0)" />
            <blockpin signalname="memwrite" name="memwrite" />
            <blockpin signalname="spriteaddr(9:0)" name="memaddr(9:0)" />
            <blockpin signalname="gpudata(15:0)" name="memdata(15:0)" />
            <blockpin signalname="memenable" name="memenable" />
            <blockpin signalname="XLXN_480" name="scanline_start" />
            <blockpin signalname="XLXN_427" name="vlookahead" />
            <blockpin signalname="XLXN_502(2:0)" name="sizeX(2:0)" />
            <blockpin signalname="XLXN_501" name="hFlip" />
            <blockpin signalname="XLXN_498(9:0)" name="line_addr(9:0)" />
            <blockpin signalname="XLXN_499(1:0)" name="line_z(1:0)" />
            <blockpin signalname="XLXN_500(3:0)" name="line_palette(3:0)" />
            <blockpin signalname="XLXN_319" name="line_load" />
            <blockpin signalname="XLXN_504(3:0)" name="tile_y_total(3:0)" />
            <blockpin signalname="XLXN_507(2:0)" name="tile_y_offset(2:0)" />
            <blockpin signalname="XLXN_508(3:0)" name="tile_x(3:0)" />
            <blockpin signalname="sprite_priority(6:0)" name="sprite_priority(6:0)" />
        </block>
        <block symbolname="palette" name="palette_output">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_488" name="enable" />
            <blockpin signalname="XLXN_306(7:0)" name="index(7:0)" />
            <blockpin signalname="brightness(7:0)" name="brightness(7:0)" />
            <blockpin signalname="R(7:0)" name="red(7:0)" />
            <blockpin signalname="G(7:0)" name="green(7:0)" />
            <blockpin signalname="B(7:0)" name="blue(7:0)" />
            <blockpin signalname="palette_wrindex(7:0)" name="wrindex(7:0)" />
            <blockpin signalname="palette_data(23:0)" name="data(23:0)" />
            <blockpin signalname="palette_write" name="write" />
        </block>
        <block symbolname="tile_table" name="tile_tbl">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_319" name="load" />
            <blockpin signalname="XLXN_501" name="hFlip" />
            <blockpin signalname="XLXN_502(2:0)" name="size_x(2:0)" />
            <blockpin signalname="XLXN_504(3:0)" name="tile_y_total(3:0)" />
            <blockpin signalname="XLXN_507(2:0)" name="tile_y_offset(2:0)" />
            <blockpin signalname="XLXN_503" name="tile_table" />
            <blockpin signalname="XLXN_508(3:0)" name="tile_x(3:0)" />
            <blockpin signalname="XLXN_490(3:0)" name="current_tile(3:0)" />
            <blockpin signalname="memenable" name="memenable" />
            <blockpin signalname="memwrite" name="memwrite" />
            <blockpin signalname="tile_addr(12:0)" name="memaddr(12:0)" />
            <blockpin signalname="writedata(15:0)" name="writedata(15:0)" />
            <blockpin signalname="tiledata(15:0)" name="memdata(15:0)" />
            <blockpin signalname="XLXN_487" name="tile_flip" />
            <blockpin signalname="XLXN_486(31:0)" name="tile_data(31:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="writedata(15:0)">
            <wire x2="720" y1="1776" y2="1776" x1="400" />
            <wire x2="944" y1="1776" y2="1776" x1="720" />
            <wire x2="720" y1="1776" y2="2000" x1="720" />
            <wire x2="1408" y1="2000" y2="2000" x1="720" />
            <wire x2="1408" y1="2000" y2="2688" x1="1408" />
            <wire x2="1888" y1="2688" y2="2688" x1="1408" />
        </branch>
        <branch name="gpudata(15:0)">
            <wire x2="1504" y1="1776" y2="1776" x1="1440" />
        </branch>
        <branch name="XLXN_306(7:0)">
            <wire x2="2544" y1="1520" y2="1520" x1="2384" />
            <wire x2="2544" y1="1520" y2="1792" x1="2544" />
            <wire x2="2784" y1="1792" y2="1792" x1="2544" />
        </branch>
        <branch name="XLXN_277(9:0)">
            <wire x2="688" y1="1056" y2="1056" x1="592" />
            <wire x2="688" y1="1056" y2="1328" x1="688" />
            <wire x2="944" y1="1328" y2="1328" x1="688" />
        </branch>
        <branch name="rst">
            <wire x2="176" y1="224" y2="224" x1="80" />
            <wire x2="896" y1="224" y2="224" x1="176" />
            <wire x2="896" y1="224" y2="944" x1="896" />
            <wire x2="944" y1="944" y2="944" x1="896" />
            <wire x2="1744" y1="224" y2="224" x1="896" />
            <wire x2="1744" y1="224" y2="688" x1="1744" />
            <wire x2="1888" y1="688" y2="688" x1="1744" />
            <wire x2="1744" y1="688" y2="1840" x1="1744" />
            <wire x2="1888" y1="1840" y2="1840" x1="1744" />
            <wire x2="176" y1="224" y2="544" x1="176" />
            <wire x2="208" y1="544" y2="544" x1="176" />
        </branch>
        <instance x="944" y="1744" name="sprite_controller" orien="R0">
        </instance>
        <branch name="XLXN_273">
            <wire x2="864" y1="480" y2="1008" x1="864" />
            <wire x2="944" y1="1008" y2="1008" x1="864" />
            <wire x2="2448" y1="480" y2="480" x1="864" />
            <wire x2="2448" y1="480" y2="880" x1="2448" />
            <wire x2="2448" y1="880" y2="880" x1="2384" />
        </branch>
        <branch name="XLXN_319">
            <wire x2="1712" y1="880" y2="880" x1="1440" />
            <wire x2="1888" y1="880" y2="880" x1="1712" />
            <wire x2="1712" y1="880" y2="1904" x1="1712" />
            <wire x2="1888" y1="1904" y2="1904" x1="1712" />
        </branch>
        <branch name="XLXN_272">
            <wire x2="1696" y1="544" y2="544" x1="592" />
            <wire x2="1696" y1="544" y2="752" x1="1696" />
            <wire x2="1888" y1="752" y2="752" x1="1696" />
        </branch>
        <branch name="memwrite">
            <wire x2="848" y1="1648" y2="1648" x1="320" />
            <wire x2="944" y1="1648" y2="1648" x1="848" />
            <wire x2="848" y1="1648" y2="1872" x1="848" />
            <wire x2="1456" y1="1872" y2="1872" x1="848" />
            <wire x2="1456" y1="1872" y2="2560" x1="1456" />
            <wire x2="1888" y1="2560" y2="2560" x1="1456" />
        </branch>
        <branch name="XLXN_278(9:0)">
            <wire x2="624" y1="992" y2="992" x1="592" />
            <wire x2="624" y1="768" y2="992" x1="624" />
            <wire x2="1648" y1="768" y2="768" x1="624" />
            <wire x2="1648" y1="768" y2="816" x1="1648" />
            <wire x2="1888" y1="816" y2="816" x1="1648" />
        </branch>
        <branch name="XLXN_427">
            <wire x2="736" y1="608" y2="608" x1="592" />
            <wire x2="736" y1="608" y2="1264" x1="736" />
            <wire x2="944" y1="1264" y2="1264" x1="736" />
        </branch>
        <branch name="clk">
            <wire x2="208" y1="112" y2="112" x1="96" />
            <wire x2="208" y1="112" y2="480" x1="208" />
            <wire x2="208" y1="32" y2="112" x1="208" />
            <wire x2="928" y1="32" y2="32" x1="208" />
            <wire x2="928" y1="32" y2="880" x1="928" />
            <wire x2="944" y1="880" y2="880" x1="928" />
            <wire x2="1776" y1="32" y2="32" x1="928" />
            <wire x2="2656" y1="32" y2="32" x1="1776" />
            <wire x2="2656" y1="32" y2="1664" x1="2656" />
            <wire x2="2784" y1="1664" y2="1664" x1="2656" />
            <wire x2="1776" y1="32" y2="624" x1="1776" />
            <wire x2="1888" y1="624" y2="624" x1="1776" />
            <wire x2="1776" y1="624" y2="1776" x1="1776" />
            <wire x2="1888" y1="1776" y2="1776" x1="1776" />
        </branch>
        <instance x="208" y="1088" name="vga_controller" orien="R0">
        </instance>
        <iomarker fontsize="28" x="320" y="1648" name="memwrite" orien="R180" />
        <iomarker fontsize="28" x="400" y="1776" name="writedata(15:0)" orien="R180" />
        <iomarker fontsize="28" x="80" y="224" name="rst" orien="R180" />
        <iomarker fontsize="28" x="96" y="112" name="clk" orien="R180" />
        <branch name="palette_write">
            <wire x2="2784" y1="1984" y2="1984" x1="2752" />
        </branch>
        <branch name="palette_wrindex(7:0)">
            <wire x2="2784" y1="2048" y2="2048" x1="2752" />
        </branch>
        <branch name="palette_data(23:0)">
            <wire x2="2784" y1="2112" y2="2112" x1="2752" />
        </branch>
        <iomarker fontsize="28" x="3296" y="1856" name="B(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3296" y="1792" name="G(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3296" y="1728" name="R(7:0)" orien="R0" />
        <instance x="2784" y="2080" name="palette_output" orien="R0">
        </instance>
        <branch name="R(7:0)">
            <wire x2="3296" y1="1728" y2="1728" x1="3248" />
        </branch>
        <branch name="G(7:0)">
            <wire x2="3296" y1="1792" y2="1792" x1="3248" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="3296" y1="1856" y2="1856" x1="3248" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1984" name="palette_write" orien="R180" />
        <iomarker fontsize="28" x="2752" y="2112" name="palette_data(23:0)" orien="R180" />
        <iomarker fontsize="28" x="2752" y="2048" name="palette_wrindex(7:0)" orien="R180" />
        <branch name="bright">
            <wire x2="336" y1="1152" y2="1184" x1="336" />
        </branch>
        <iomarker fontsize="28" x="336" y="1184" name="bright" orien="R90" />
        <branch name="vsync">
            <wire x2="384" y1="1152" y2="1184" x1="384" />
        </branch>
        <iomarker fontsize="28" x="384" y="1184" name="vsync" orien="R90" />
        <branch name="hsync">
            <wire x2="432" y1="1152" y2="1184" x1="432" />
        </branch>
        <iomarker fontsize="28" x="432" y="1184" name="hsync" orien="R90" />
        <iomarker fontsize="28" x="1504" y="1776" name="gpudata(15:0)" orien="R0" />
        <branch name="brightness(7:0)">
            <wire x2="2784" y1="1856" y2="1856" x1="2752" />
        </branch>
        <branch name="XLXN_480">
            <wire x2="768" y1="480" y2="480" x1="592" />
            <wire x2="768" y1="480" y2="1200" x1="768" />
            <wire x2="944" y1="1200" y2="1200" x1="768" />
        </branch>
        <branch name="vbright">
            <wire x2="624" y1="736" y2="736" x1="592" />
        </branch>
        <iomarker fontsize="28" x="624" y="736" name="vbright" orien="R0" />
        <branch name="hbright">
            <wire x2="624" y1="672" y2="672" x1="592" />
        </branch>
        <iomarker fontsize="28" x="624" y="672" name="hbright" orien="R0" />
        <branch name="memenable">
            <wire x2="896" y1="1584" y2="1584" x1="416" />
            <wire x2="944" y1="1584" y2="1584" x1="896" />
            <wire x2="896" y1="1584" y2="2496" x1="896" />
            <wire x2="1888" y1="2496" y2="2496" x1="896" />
        </branch>
        <iomarker fontsize="28" x="416" y="1584" name="memenable" orien="R180" />
        <branch name="XLXN_484(2:0)">
            <wire x2="1664" y1="1584" y2="1584" x1="1440" />
            <wire x2="1664" y1="1520" y2="1584" x1="1664" />
            <wire x2="1888" y1="1520" y2="1520" x1="1664" />
        </branch>
        <branch name="XLXN_485(2:0)">
            <wire x2="1648" y1="1520" y2="1520" x1="1440" />
            <wire x2="1648" y1="1456" y2="1520" x1="1648" />
            <wire x2="1888" y1="1456" y2="1456" x1="1648" />
        </branch>
        <instance x="1888" y="2640" name="tile_tbl" orien="R0">
        </instance>
        <branch name="XLXN_486(31:0)">
            <wire x2="1888" y1="1328" y2="1328" x1="1824" />
            <wire x2="1824" y1="1328" y2="1600" x1="1824" />
            <wire x2="2432" y1="1600" y2="1600" x1="1824" />
            <wire x2="2432" y1="1600" y2="2368" x1="2432" />
            <wire x2="2432" y1="2368" y2="2368" x1="2368" />
        </branch>
        <branch name="XLXN_487">
            <wire x2="1888" y1="1264" y2="1264" x1="1792" />
            <wire x2="1792" y1="1264" y2="1632" x1="1792" />
            <wire x2="2400" y1="1632" y2="1632" x1="1792" />
            <wire x2="2400" y1="1632" y2="2304" x1="2400" />
            <wire x2="2400" y1="2304" y2="2304" x1="2368" />
        </branch>
        <branch name="XLXN_488">
            <wire x2="2592" y1="1456" y2="1456" x1="2384" />
            <wire x2="2592" y1="1456" y2="1728" x1="2592" />
            <wire x2="2784" y1="1728" y2="1728" x1="2592" />
        </branch>
        <iomarker fontsize="28" x="2752" y="1856" name="brightness(7:0)" orien="R180" />
        <branch name="XLXN_490(3:0)">
            <wire x2="2464" y1="1664" y2="1664" x1="1824" />
            <wire x2="1824" y1="1664" y2="2368" x1="1824" />
            <wire x2="1888" y1="2368" y2="2368" x1="1824" />
            <wire x2="2464" y1="1328" y2="1328" x1="2384" />
            <wire x2="2464" y1="1328" y2="1664" x1="2464" />
        </branch>
        <instance x="1888" y="1808" name="line_buff" orien="R0">
        </instance>
        <branch name="XLXN_498(9:0)">
            <wire x2="1888" y1="944" y2="944" x1="1440" />
        </branch>
        <branch name="XLXN_499(1:0)">
            <wire x2="1888" y1="1008" y2="1008" x1="1440" />
        </branch>
        <branch name="XLXN_500(3:0)">
            <wire x2="1888" y1="1072" y2="1072" x1="1440" />
        </branch>
        <branch name="XLXN_501">
            <wire x2="1728" y1="1136" y2="1136" x1="1440" />
            <wire x2="1728" y1="1136" y2="1968" x1="1728" />
            <wire x2="1888" y1="1968" y2="1968" x1="1728" />
        </branch>
        <branch name="XLXN_502(2:0)">
            <wire x2="1760" y1="1200" y2="1200" x1="1440" />
            <wire x2="1760" y1="1200" y2="2032" x1="1760" />
            <wire x2="1888" y1="2032" y2="2032" x1="1760" />
        </branch>
        <branch name="XLXN_503">
            <wire x2="1488" y1="1264" y2="1264" x1="1440" />
            <wire x2="1488" y1="1264" y2="2096" x1="1488" />
            <wire x2="1888" y1="2096" y2="2096" x1="1488" />
        </branch>
        <branch name="XLXN_504(3:0)">
            <wire x2="1504" y1="1328" y2="1328" x1="1440" />
            <wire x2="1504" y1="1328" y2="1344" x1="1504" />
            <wire x2="1856" y1="1344" y2="1344" x1="1504" />
            <wire x2="1856" y1="1344" y2="2144" x1="1856" />
            <wire x2="1856" y1="2144" y2="2160" x1="1856" />
            <wire x2="1888" y1="2160" y2="2160" x1="1856" />
        </branch>
        <branch name="sprite_priority(6:0)">
            <wire x2="944" y1="1456" y2="1456" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1456" name="sprite_priority(6:0)" orien="R180" />
        <branch name="XLXN_507(2:0)">
            <wire x2="1472" y1="1392" y2="1392" x1="1440" />
            <wire x2="1472" y1="1392" y2="2224" x1="1472" />
            <wire x2="1888" y1="2224" y2="2224" x1="1472" />
        </branch>
        <branch name="XLXN_508(3:0)">
            <wire x2="1504" y1="1456" y2="1456" x1="1440" />
            <wire x2="1504" y1="1456" y2="1504" x1="1504" />
            <wire x2="1840" y1="1504" y2="1504" x1="1504" />
            <wire x2="1840" y1="1504" y2="2288" x1="1840" />
            <wire x2="1888" y1="2288" y2="2288" x1="1840" />
        </branch>
        <branch name="tiledata(15:0)">
            <wire x2="2400" y1="2688" y2="2688" x1="2368" />
        </branch>
        <iomarker fontsize="28" x="2400" y="2688" name="tiledata(15:0)" orien="R0" />
        <branch name="tile_addr(12:0)">
            <wire x2="1872" y1="2624" y2="2624" x1="1008" />
            <wire x2="1888" y1="2624" y2="2624" x1="1872" />
        </branch>
        <branch name="spriteaddr(9:0)">
            <wire x2="928" y1="1712" y2="1712" x1="688" />
            <wire x2="944" y1="1712" y2="1712" x1="928" />
        </branch>
        <iomarker fontsize="28" x="688" y="1712" name="spriteaddr(9:0)" orien="R180" />
        <iomarker fontsize="28" x="1008" y="2624" name="tile_addr(12:0)" orien="R180" />
    </sheet>
</drawing>