<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_15(9:0)" />
        <signal name="XLXN_17(9:0)" />
        <signal name="B(7:0)" />
        <signal name="G(7:0)" />
        <signal name="R(7:0)" />
        <signal name="bright" />
        <signal name="vsync" />
        <signal name="hsync" />
        <signal name="XLXN_26" />
        <signal name="XLXN_28" />
        <signal name="rst" />
        <signal name="XLXN_205" />
        <signal name="XLXN_206(7:0)" />
        <signal name="XLXN_207(23:0)" />
        <signal name="clk" />
        <signal name="vbright" />
        <signal name="hbright" />
        <signal name="brightness(7:0)" />
        <signal name="sprite_priority(6:0)" />
        <signal name="XLXN_215(12:0)" />
        <signal name="XLXN_216" />
        <signal name="XLXN_217(9:0)" />
        <signal name="XLXN_218" />
        <signal name="XLXN_219(15:0)" />
        <signal name="XLXN_220" />
        <signal name="XLXN_221(15:0)" />
        <signal name="XLXN_222(15:0)" />
        <port polarity="Output" name="B(7:0)" />
        <port polarity="Output" name="G(7:0)" />
        <port polarity="Output" name="R(7:0)" />
        <port polarity="Output" name="bright" />
        <port polarity="Output" name="vsync" />
        <port polarity="Output" name="hsync" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="XLXN_205" />
        <port polarity="Input" name="XLXN_206(7:0)" />
        <port polarity="Input" name="XLXN_207(23:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Output" name="vbright" />
        <port polarity="Output" name="hbright" />
        <port polarity="Input" name="brightness(7:0)" />
        <port polarity="Input" name="sprite_priority(6:0)" />
        <port polarity="Input" name="XLXN_215(12:0)" />
        <port polarity="Input" name="XLXN_216" />
        <port polarity="Input" name="XLXN_217(9:0)" />
        <port polarity="Input" name="XLXN_218" />
        <port polarity="Input" name="XLXN_219(15:0)" />
        <port polarity="Input" name="XLXN_220" />
        <port polarity="Output" name="XLXN_221(15:0)" />
        <port polarity="Output" name="XLXN_222(15:0)" />
        <blockdef name="gpu_schematic">
            <timestamp>2010-10-21T21:4:10</timestamp>
            <line x2="0" y1="-1056" y2="-1056" x1="64" />
            <line x2="0" y1="-992" y2="-992" x1="64" />
            <rect width="64" x="0" y="-748" height="24" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <rect width="64" x="0" y="-684" height="24" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="0" y1="-928" y2="-928" x1="64" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <rect width="64" x="0" y="-556" height="24" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="0" y1="-112" y2="-112" x1="64" />
            <rect width="64" x="0" y="-60" height="24" />
            <line x2="0" y1="-48" y2="-48" x1="64" />
            <rect width="64" x="0" y="4" height="24" />
            <line x2="0" y1="16" y2="16" x1="64" />
            <rect width="432" x="64" y="-1088" height="1128" />
            <rect width="64" x="0" y="-188" height="24" />
            <line x2="0" y1="-176" y2="-176" x1="64" />
            <line x2="0" y1="-240" y2="-240" x1="64" />
            <rect width="64" x="496" y="-188" height="24" />
            <line x2="560" y1="-176" y2="-176" x1="496" />
            <rect width="64" x="496" y="-316" height="24" />
            <line x2="560" y1="-304" y2="-304" x1="496" />
            <rect width="64" x="0" y="-316" height="24" />
            <line x2="0" y1="-304" y2="-304" x1="64" />
            <line x2="0" y1="-368" y2="-368" x1="64" />
            <rect width="64" x="0" y="-428" height="24" />
            <line x2="0" y1="-416" y2="-416" x1="64" />
            <line x2="0" y1="-480" y2="-480" x1="64" />
            <rect width="64" x="496" y="-940" height="24" />
            <line x2="560" y1="-928" y2="-928" x1="496" />
            <rect width="64" x="496" y="-1004" height="24" />
            <line x2="560" y1="-992" y2="-992" x1="496" />
            <rect width="64" x="496" y="-1068" height="24" />
            <line x2="560" y1="-1056" y2="-1056" x1="496" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
        </blockdef>
        <blockdef name="vga">
            <timestamp>2010-10-21T21:4:26</timestamp>
            <rect width="272" x="64" y="-644" height="452" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
            <line x2="128" y1="-192" y2="-128" x1="128" />
            <line x2="224" y1="-128" y2="-192" x1="224" />
            <line x2="176" y1="-128" y2="-192" x1="176" />
            <line x2="400" y1="-480" y2="-480" x1="336" />
            <line x2="400" y1="-608" y2="-608" x1="336" />
            <rect width="64" x="336" y="-428" height="24" />
            <line x2="400" y1="-416" y2="-416" x1="336" />
            <rect width="64" x="336" y="-364" height="24" />
            <line x2="400" y1="-352" y2="-352" x1="336" />
            <line x2="336" y1="-224" y2="-224" x1="400" />
            <line x2="336" y1="-288" y2="-288" x1="400" />
        </blockdef>
        <block symbolname="gpu_schematic" name="gpu">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_15(9:0)" name="x(9:0)" />
            <blockpin signalname="XLXN_17(9:0)" name="y(9:0)" />
            <blockpin signalname="XLXN_26" name="line_start" />
            <blockpin signalname="brightness(7:0)" name="brightness(7:0)" />
            <blockpin signalname="sprite_priority(6:0)" name="sprite_priority(6:0)" />
            <blockpin signalname="XLXN_205" name="palette_write" />
            <blockpin signalname="XLXN_206(7:0)" name="palette_wrindex(7:0)" />
            <blockpin signalname="XLXN_207(23:0)" name="palette_data(23:0)" />
            <blockpin signalname="XLXN_215(12:0)" name="tile_addr(12:0)" />
            <blockpin signalname="XLXN_216" name="tile_memenable" />
            <blockpin signalname="XLXN_221(15:0)" name="tile_memdata(15:0)" />
            <blockpin signalname="XLXN_222(15:0)" name="sprite_memdata(15:0)" />
            <blockpin signalname="XLXN_217(9:0)" name="sprite_addr(9:0)" />
            <blockpin signalname="XLXN_218" name="sprite_memenable" />
            <blockpin signalname="XLXN_219(15:0)" name="writedata(15:0)" />
            <blockpin signalname="XLXN_220" name="memwrite" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="B(7:0)" name="B(7:0)" />
            <blockpin signalname="G(7:0)" name="G(7:0)" />
            <blockpin signalname="R(7:0)" name="R(7:0)" />
            <blockpin signalname="XLXN_28" name="vlookahead" />
        </block>
        <block symbolname="vga" name="vga_ctrl">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="bright" name="bright" />
            <blockpin signalname="vsync" name="vsync" />
            <blockpin signalname="hsync" name="hsync" />
            <blockpin signalname="XLXN_28" name="vlookahead" />
            <blockpin signalname="XLXN_26" name="line_start" />
            <blockpin signalname="XLXN_15(9:0)" name="x(9:0)" />
            <blockpin signalname="XLXN_17(9:0)" name="y(9:0)" />
            <blockpin signalname="vbright" name="vbright" />
            <blockpin signalname="hbright" name="hbright" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="2640" y="1440" name="gpu" orien="R0">
        </instance>
        <branch name="B(7:0)">
            <wire x2="3232" y1="512" y2="512" x1="3200" />
        </branch>
        <branch name="G(7:0)">
            <wire x2="3232" y1="448" y2="448" x1="3200" />
        </branch>
        <branch name="R(7:0)">
            <wire x2="3232" y1="384" y2="384" x1="3200" />
        </branch>
        <iomarker fontsize="28" x="3232" y="512" name="B(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3232" y="448" name="G(7:0)" orien="R0" />
        <iomarker fontsize="28" x="3232" y="384" name="R(7:0)" orien="R0" />
        <iomarker fontsize="28" x="224" y="128" name="clk" orien="R180" />
        <branch name="XLXN_205">
            <wire x2="2640" y1="1328" y2="1328" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1328" name="XLXN_205" orien="R180" />
        <branch name="XLXN_206(7:0)">
            <wire x2="2640" y1="1392" y2="1392" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1392" name="XLXN_206(7:0)" orien="R180" />
        <branch name="XLXN_207(23:0)">
            <wire x2="2640" y1="1456" y2="1456" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1456" name="XLXN_207(23:0)" orien="R180" />
        <branch name="vbright">
            <wire x2="2080" y1="896" y2="896" x1="1952" />
            <wire x2="2096" y1="896" y2="896" x1="2080" />
        </branch>
        <branch name="hbright">
            <wire x2="2064" y1="832" y2="832" x1="1952" />
            <wire x2="2080" y1="832" y2="832" x1="2064" />
        </branch>
        <branch name="brightness(7:0)">
            <wire x2="2640" y1="832" y2="832" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="832" name="brightness(7:0)" orien="R180" />
        <branch name="sprite_priority(6:0)">
            <wire x2="2640" y1="896" y2="896" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="896" name="sprite_priority(6:0)" orien="R180" />
        <branch name="XLXN_215(12:0)">
            <wire x2="2640" y1="1264" y2="1264" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1264" name="XLXN_215(12:0)" orien="R180" />
        <branch name="XLXN_216">
            <wire x2="2640" y1="1200" y2="1200" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1200" name="XLXN_216" orien="R180" />
        <branch name="XLXN_217(9:0)">
            <wire x2="2640" y1="1136" y2="1136" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1136" name="XLXN_217(9:0)" orien="R180" />
        <branch name="XLXN_218">
            <wire x2="2640" y1="1072" y2="1072" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1072" name="XLXN_218" orien="R180" />
        <branch name="XLXN_219(15:0)">
            <wire x2="2640" y1="1024" y2="1024" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="1024" name="XLXN_219(15:0)" orien="R180" />
        <branch name="XLXN_220">
            <wire x2="2640" y1="960" y2="960" x1="2608" />
        </branch>
        <iomarker fontsize="28" x="2608" y="960" name="XLXN_220" orien="R180" />
        <branch name="XLXN_221(15:0)">
            <wire x2="3232" y1="1264" y2="1264" x1="3200" />
        </branch>
        <iomarker fontsize="28" x="3232" y="1264" name="XLXN_221(15:0)" orien="R0" />
        <branch name="XLXN_222(15:0)">
            <wire x2="3232" y1="1136" y2="1136" x1="3200" />
        </branch>
        <iomarker fontsize="28" x="3232" y="1136" name="XLXN_222(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2080" y="832" name="hbright" orien="R0" />
        <iomarker fontsize="28" x="2096" y="896" name="vbright" orien="R0" />
        <branch name="bright">
            <wire x2="1680" y1="992" y2="1296" x1="1680" />
            <wire x2="1680" y1="1296" y2="1312" x1="1680" />
        </branch>
        <iomarker fontsize="28" x="1680" y="1312" name="bright" orien="R90" />
        <iomarker fontsize="28" x="1728" y="1312" name="vsync" orien="R90" />
        <iomarker fontsize="28" x="1776" y="1312" name="hsync" orien="R90" />
        <branch name="XLXN_17(9:0)">
            <wire x2="2624" y1="768" y2="768" x1="1952" />
            <wire x2="2640" y1="768" y2="768" x1="2624" />
        </branch>
        <branch name="XLXN_15(9:0)">
            <wire x2="2624" y1="704" y2="704" x1="1952" />
            <wire x2="2640" y1="704" y2="704" x1="2624" />
        </branch>
        <branch name="XLXN_28">
            <wire x2="2624" y1="640" y2="640" x1="1952" />
            <wire x2="2640" y1="640" y2="640" x1="2624" />
        </branch>
        <branch name="XLXN_26">
            <wire x2="2624" y1="512" y2="512" x1="1952" />
            <wire x2="2640" y1="512" y2="512" x1="2624" />
        </branch>
        <branch name="hsync">
            <wire x2="1776" y1="992" y2="1296" x1="1776" />
            <wire x2="1776" y1="1296" y2="1312" x1="1776" />
        </branch>
        <branch name="vsync">
            <wire x2="1728" y1="992" y2="1296" x1="1728" />
            <wire x2="1728" y1="1296" y2="1312" x1="1728" />
        </branch>
        <branch name="rst">
            <wire x2="1488" y1="304" y2="304" x1="176" />
            <wire x2="2544" y1="304" y2="304" x1="1488" />
            <wire x2="2544" y1="304" y2="448" x1="2544" />
            <wire x2="2640" y1="448" y2="448" x1="2544" />
            <wire x2="1488" y1="304" y2="576" x1="1488" />
            <wire x2="1552" y1="576" y2="576" x1="1488" />
        </branch>
        <branch name="clk">
            <wire x2="1520" y1="128" y2="128" x1="224" />
            <wire x2="2640" y1="128" y2="128" x1="1520" />
            <wire x2="2640" y1="128" y2="384" x1="2640" />
            <wire x2="1520" y1="128" y2="512" x1="1520" />
            <wire x2="1552" y1="512" y2="512" x1="1520" />
        </branch>
        <instance x="1552" y="1120" name="vga_ctrl" orien="R0">
        </instance>
        <iomarker fontsize="28" x="176" y="304" name="rst" orien="R180" />
    </sheet>
</drawing>