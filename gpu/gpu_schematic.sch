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
        <signal name="XLXN_273" />
        <signal name="y(9:0)" />
        <signal name="writedata(15:0)" />
        <signal name="XLXN_306(7:0)" />
        <signal name="XLXN_319" />
        <signal name="vlookahead" />
        <signal name="line_start" />
        <signal name="XLXN_488" />
        <signal name="sprite_priority(6:0)" />
        <signal name="tile_memdata(15:0)" />
        <signal name="tile_addr(12:0)" />
        <signal name="sprite_addr(9:0)" />
        <signal name="sprite_memdata(15:0)" />
        <signal name="XLXN_510(9:0)" />
        <signal name="XLXN_511(1:0)" />
        <signal name="XLXN_512(3:0)" />
        <signal name="XLXN_513(2:0)" />
        <signal name="XLXN_514(2:0)" />
        <signal name="XLXN_515" />
        <signal name="XLXN_516(2:0)" />
        <signal name="XLXN_517" />
        <signal name="XLXN_518(3:0)" />
        <signal name="XLXN_519(2:0)" />
        <signal name="XLXN_520(3:0)" />
        <signal name="palette_write" />
        <signal name="palette_wrindex(7:0)" />
        <signal name="palette_data(23:0)" />
        <signal name="R(7:0)" />
        <signal name="G(7:0)" />
        <signal name="B(7:0)" />
        <signal name="brightness(7:0)" />
        <signal name="XLXN_529(3:0)" />
        <signal name="XLXN_531(31:0)" />
        <signal name="sprite_memenable" />
        <signal name="tile_memenable" />
        <signal name="memwrite" />
        <signal name="x(9:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="y(9:0)" />
        <port polarity="Input" name="writedata(15:0)" />
        <port polarity="Input" name="vlookahead" />
        <port polarity="Input" name="line_start" />
        <port polarity="Input" name="sprite_priority(6:0)" />
        <port polarity="Output" name="tile_memdata(15:0)" />
        <port polarity="Input" name="tile_addr(12:0)" />
        <port polarity="Input" name="sprite_addr(9:0)" />
        <port polarity="Output" name="sprite_memdata(15:0)" />
        <port polarity="Input" name="palette_write" />
        <port polarity="Input" name="palette_wrindex(7:0)" />
        <port polarity="Input" name="palette_data(23:0)" />
        <port polarity="Output" name="R(7:0)" />
        <port polarity="Output" name="G(7:0)" />
        <port polarity="Output" name="B(7:0)" />
        <port polarity="Input" name="brightness(7:0)" />
        <port polarity="Input" name="sprite_memenable" />
        <port polarity="Input" name="tile_memenable" />
        <port polarity="Input" name="memwrite" />
        <port polarity="Input" name="x(9:0)" />
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
            <timestamp>2010-10-26T2:3:46</timestamp>
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
            <timestamp>2010-10-21T5:41:40</timestamp>
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
        <block symbolname="line_buffer" name="line_buff">
            <blockpin signalname="XLXN_319" name="load" />
            <blockpin signalname="XLXN_273" name="line_busy" />
            <blockpin signalname="XLXN_510(9:0)" name="addr(9:0)" />
            <blockpin signalname="XLXN_511(1:0)" name="z(1:0)" />
            <blockpin signalname="XLXN_512(3:0)" name="palette(3:0)" />
            <blockpin signalname="XLXN_513(2:0)" name="first(2:0)" />
            <blockpin signalname="XLXN_514(2:0)" name="last(2:0)" />
            <blockpin signalname="XLXN_488" name="enable" />
            <blockpin signalname="XLXN_306(7:0)" name="index(7:0)" />
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
            <blockpin signalname="sprite_priority(6:0)" name="sprite_priority(6:0)" />
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
            <blockpin signalname="XLXN_512(3:0)" name="line_palette(3:0)" />
            <blockpin signalname="XLXN_319" name="line_load" />
            <blockpin signalname="sprite_memdata(15:0)" name="memdata(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="writedata(15:0)">
            <wire x2="784" y1="1776" y2="1776" x1="384" />
            <wire x2="784" y1="1776" y2="2688" x1="784" />
            <wire x2="1888" y1="2688" y2="2688" x1="784" />
            <wire x2="944" y1="1776" y2="1776" x1="784" />
        </branch>
        <branch name="XLXN_306(7:0)">
            <wire x2="2848" y1="1376" y2="1376" x1="2384" />
        </branch>
        <branch name="y(9:0)">
            <wire x2="736" y1="752" y2="752" x1="544" />
            <wire x2="736" y1="752" y2="1328" x1="736" />
            <wire x2="944" y1="1328" y2="1328" x1="736" />
            <wire x2="1472" y1="752" y2="752" x1="736" />
            <wire x2="1472" y1="752" y2="816" x1="1472" />
            <wire x2="1888" y1="816" y2="816" x1="1472" />
        </branch>
        <branch name="XLXN_273">
            <wire x2="864" y1="480" y2="1008" x1="864" />
            <wire x2="944" y1="1008" y2="1008" x1="864" />
            <wire x2="2416" y1="480" y2="480" x1="864" />
            <wire x2="2416" y1="480" y2="880" x1="2416" />
            <wire x2="2416" y1="880" y2="880" x1="2384" />
        </branch>
        <branch name="XLXN_319">
            <wire x2="1776" y1="880" y2="880" x1="1488" />
            <wire x2="1888" y1="880" y2="880" x1="1776" />
            <wire x2="1776" y1="880" y2="1904" x1="1776" />
            <wire x2="1888" y1="1904" y2="1904" x1="1776" />
        </branch>
        <branch name="vlookahead">
            <wire x2="800" y1="656" y2="656" x1="592" />
            <wire x2="800" y1="656" y2="1264" x1="800" />
            <wire x2="944" y1="1264" y2="1264" x1="800" />
        </branch>
        <iomarker fontsize="28" x="320" y="1648" name="memwrite" orien="R180" />
        <branch name="line_start">
            <wire x2="832" y1="560" y2="560" x1="560" />
            <wire x2="832" y1="560" y2="1200" x1="832" />
            <wire x2="944" y1="1200" y2="1200" x1="832" />
            <wire x2="1648" y1="560" y2="560" x1="832" />
            <wire x2="1648" y1="560" y2="688" x1="1648" />
            <wire x2="1888" y1="688" y2="688" x1="1648" />
        </branch>
        <branch name="XLXN_488">
            <wire x2="2848" y1="1312" y2="1312" x1="2384" />
        </branch>
        <instance x="1888" y="1808" name="line_buff" orien="R0">
        </instance>
        <branch name="sprite_priority(6:0)">
            <wire x2="944" y1="1456" y2="1456" x1="896" />
        </branch>
        <branch name="tile_memdata(15:0)">
            <wire x2="2384" y1="2688" y2="2688" x1="2368" />
            <wire x2="2400" y1="2688" y2="2688" x1="2384" />
        </branch>
        <iomarker fontsize="28" x="2400" y="2688" name="tile_memdata(15:0)" orien="R0" />
        <branch name="tile_addr(12:0)">
            <wire x2="400" y1="1904" y2="1904" x1="384" />
            <wire x2="672" y1="1904" y2="1904" x1="400" />
            <wire x2="672" y1="1904" y2="2112" x1="672" />
            <wire x2="672" y1="2112" y2="2176" x1="672" />
            <wire x2="672" y1="2176" y2="2448" x1="672" />
            <wire x2="672" y1="2448" y2="2512" x1="672" />
            <wire x2="672" y1="2512" y2="2624" x1="672" />
            <wire x2="1888" y1="2624" y2="2624" x1="672" />
        </branch>
        <branch name="sprite_addr(9:0)">
            <wire x2="944" y1="1712" y2="1712" x1="384" />
        </branch>
        <branch name="sprite_memdata(15:0)">
            <wire x2="1504" y1="1904" y2="1904" x1="1424" />
            <wire x2="1424" y1="1904" y2="2384" x1="1424" />
            <wire x2="1504" y1="2384" y2="2384" x1="1424" />
            <wire x2="1504" y1="1776" y2="1776" x1="1488" />
            <wire x2="1504" y1="1776" y2="1904" x1="1504" />
        </branch>
        <branch name="XLXN_510(9:0)">
            <wire x2="1888" y1="944" y2="944" x1="1488" />
        </branch>
        <branch name="XLXN_511(1:0)">
            <wire x2="1888" y1="1008" y2="1008" x1="1488" />
        </branch>
        <branch name="XLXN_512(3:0)">
            <wire x2="1888" y1="1072" y2="1072" x1="1488" />
        </branch>
        <branch name="XLXN_513(2:0)">
            <wire x2="1888" y1="1136" y2="1136" x1="1488" />
        </branch>
        <branch name="XLXN_514(2:0)">
            <wire x2="1888" y1="1200" y2="1200" x1="1488" />
        </branch>
        <branch name="XLXN_515">
            <wire x2="1504" y1="1264" y2="1264" x1="1488" />
            <wire x2="1760" y1="1264" y2="1264" x1="1504" />
            <wire x2="1760" y1="1264" y2="1968" x1="1760" />
            <wire x2="1888" y1="1968" y2="1968" x1="1760" />
        </branch>
        <branch name="XLXN_516(2:0)">
            <wire x2="1504" y1="1328" y2="1328" x1="1488" />
            <wire x2="1744" y1="1328" y2="1328" x1="1504" />
            <wire x2="1744" y1="1328" y2="2032" x1="1744" />
            <wire x2="1888" y1="2032" y2="2032" x1="1744" />
        </branch>
        <branch name="XLXN_517">
            <wire x2="1504" y1="1392" y2="1392" x1="1488" />
            <wire x2="1728" y1="1392" y2="1392" x1="1504" />
            <wire x2="1728" y1="1392" y2="2096" x1="1728" />
            <wire x2="1888" y1="2096" y2="2096" x1="1728" />
        </branch>
        <branch name="XLXN_518(3:0)">
            <wire x2="1504" y1="1456" y2="1456" x1="1488" />
            <wire x2="1712" y1="1456" y2="1456" x1="1504" />
            <wire x2="1712" y1="1456" y2="2160" x1="1712" />
            <wire x2="1888" y1="2160" y2="2160" x1="1712" />
        </branch>
        <branch name="XLXN_519(2:0)">
            <wire x2="1504" y1="1520" y2="1520" x1="1488" />
            <wire x2="1696" y1="1520" y2="1520" x1="1504" />
            <wire x2="1696" y1="1520" y2="2224" x1="1696" />
            <wire x2="1888" y1="2224" y2="2224" x1="1696" />
        </branch>
        <branch name="XLXN_520(3:0)">
            <wire x2="1504" y1="1584" y2="1584" x1="1488" />
            <wire x2="1680" y1="1584" y2="1584" x1="1504" />
            <wire x2="1680" y1="1584" y2="2288" x1="1680" />
            <wire x2="1888" y1="2288" y2="2288" x1="1680" />
        </branch>
        <branch name="palette_write">
            <wire x2="2848" y1="1568" y2="1568" x1="2816" />
        </branch>
        <branch name="palette_wrindex(7:0)">
            <wire x2="2848" y1="1632" y2="1632" x1="2816" />
        </branch>
        <branch name="palette_data(23:0)">
            <wire x2="2848" y1="1696" y2="1696" x1="2816" />
        </branch>
        <instance x="2848" y="1664" name="palette_output" orien="R0">
        </instance>
        <branch name="R(7:0)">
            <wire x2="3360" y1="1312" y2="1312" x1="3312" />
        </branch>
        <branch name="G(7:0)">
            <wire x2="3360" y1="1376" y2="1376" x1="3312" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="3360" y1="1440" y2="1440" x1="3312" />
        </branch>
        <branch name="brightness(7:0)">
            <wire x2="2848" y1="1440" y2="1440" x1="2816" />
        </branch>
        <iomarker fontsize="28" x="3360" y="1440" name="B(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3360" y="1376" name="G(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3360" y="1312" name="R(7:0)" orien="R0" />
        <iomarker fontsize="28" x="2816" y="1568" name="palette_write" orien="R180" />
        <iomarker fontsize="28" x="2816" y="1696" name="palette_data(23:0)" orien="R180" />
        <iomarker fontsize="28" x="2816" y="1632" name="palette_wrindex(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2816" y="1440" name="brightness(7:0)" orien="R180" />
        <instance x="1888" y="2640" name="tile_tbl" orien="R0">
        </instance>
        <branch name="XLXN_529(3:0)">
            <wire x2="2080" y1="1472" y2="1488" x1="2080" />
            <wire x2="2080" y1="1488" y2="1680" x1="2080" />
        </branch>
        <branch name="XLXN_531(31:0)">
            <wire x2="2176" y1="1472" y2="1488" x1="2176" />
            <wire x2="2176" y1="1488" y2="1680" x1="2176" />
        </branch>
        <iomarker fontsize="28" x="384" y="1712" name="sprite_addr(9:0)" orien="R180" />
        <iomarker fontsize="28" x="384" y="1776" name="writedata(15:0)" orien="R180" />
        <iomarker fontsize="28" x="896" y="1456" name="sprite_priority(6:0)" orien="R180" />
        <instance x="944" y="1744" name="sprites" orien="R0">
        </instance>
        <iomarker fontsize="28" x="784" y="224" name="clk" orien="R180" />
        <iomarker fontsize="28" x="784" y="288" name="rst" orien="R180" />
        <iomarker fontsize="28" x="544" y="752" name="y(9:0)" orien="R180" />
        <iomarker fontsize="28" x="384" y="1904" name="tile_addr(12:0)" orien="R180" />
        <branch name="sprite_memenable">
            <wire x2="944" y1="1584" y2="1584" x1="912" />
        </branch>
        <iomarker fontsize="28" x="912" y="1584" name="sprite_memenable" orien="R180" />
        <branch name="tile_memenable">
            <wire x2="1872" y1="2496" y2="2496" x1="1856" />
            <wire x2="1888" y1="2496" y2="2496" x1="1872" />
        </branch>
        <iomarker fontsize="28" x="1856" y="2496" name="tile_memenable" orien="R180" />
        <branch name="memwrite">
            <wire x2="848" y1="1648" y2="1648" x1="320" />
            <wire x2="848" y1="1648" y2="2560" x1="848" />
            <wire x2="1888" y1="2560" y2="2560" x1="848" />
            <wire x2="944" y1="1648" y2="1648" x1="848" />
        </branch>
        <branch name="x(9:0)">
            <wire x2="1552" y1="672" y2="672" x1="1408" />
            <wire x2="1552" y1="672" y2="752" x1="1552" />
            <wire x2="1888" y1="752" y2="752" x1="1552" />
        </branch>
        <iomarker fontsize="28" x="1408" y="672" name="x(9:0)" orien="R180" />
        <branch name="clk">
            <wire x2="928" y1="224" y2="224" x1="784" />
            <wire x2="928" y1="224" y2="880" x1="928" />
            <wire x2="944" y1="880" y2="880" x1="928" />
            <wire x2="1808" y1="224" y2="224" x1="928" />
            <wire x2="2624" y1="224" y2="224" x1="1808" />
            <wire x2="2624" y1="224" y2="1248" x1="2624" />
            <wire x2="2848" y1="1248" y2="1248" x1="2624" />
            <wire x2="1808" y1="224" y2="560" x1="1808" />
            <wire x2="1888" y1="560" y2="560" x1="1808" />
            <wire x2="1808" y1="560" y2="1776" x1="1808" />
            <wire x2="1888" y1="1776" y2="1776" x1="1808" />
        </branch>
        <branch name="rst">
            <wire x2="896" y1="288" y2="288" x1="784" />
            <wire x2="896" y1="288" y2="944" x1="896" />
            <wire x2="944" y1="944" y2="944" x1="896" />
            <wire x2="1760" y1="288" y2="288" x1="896" />
            <wire x2="1760" y1="288" y2="624" x1="1760" />
            <wire x2="1792" y1="624" y2="624" x1="1760" />
            <wire x2="1888" y1="624" y2="624" x1="1792" />
            <wire x2="1792" y1="624" y2="1840" x1="1792" />
            <wire x2="1888" y1="1840" y2="1840" x1="1792" />
        </branch>
        <iomarker fontsize="28" x="560" y="560" name="line_start" orien="R180" />
        <iomarker fontsize="28" x="592" y="656" name="vlookahead" orien="R180" />
        <iomarker fontsize="28" x="1504" y="2384" name="sprite_memdata(15:0)" orien="R0" />
    </sheet>
</drawing>