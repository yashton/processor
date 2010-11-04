<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="pcSrc" />
        <signal name="result(15:0)" />
        <signal name="XLXN_6(15:0)" />
        <signal name="XLXN_7(15:0)" />
        <signal name="writedata(15:0)" />
        <signal name="src_addr(3:0)" />
        <signal name="dst_addr(3:0)" />
        <signal name="regwrite" />
        <signal name="XLXN_20(15:0)" />
        <signal name="oper(3:0)" />
        <signal name="func(3:0)" />
        <signal name="cond(3:0)" />
        <signal name="clk" />
        <signal name="rst" />
        <signal name="pcWrite" />
        <signal name="XLXN_125(15:0)" />
        <signal name="pcaddr(15:0)" />
        <signal name="memdata(15:0)" />
        <signal name="memaddr(15:0)" />
        <signal name="aluSrcB" />
        <signal name="XLXN_126(15:0)" />
        <signal name="XLXN_115(15:0)" />
        <signal name="aluSrcA" />
        <signal name="signExtImm" />
        <signal name="Immediate(7:0)" />
        <signal name="regsrc(1:0)" />
        <signal name="XLXN_129(15:0)" />
        <signal name="pcaddrsrc(1:0)" />
        <signal name="XLXN_133(15:0)" />
        <port polarity="Input" name="pcSrc" />
        <port polarity="Output" name="writedata(15:0)" />
        <port polarity="Input" name="src_addr(3:0)" />
        <port polarity="Input" name="dst_addr(3:0)" />
        <port polarity="Input" name="regwrite" />
        <port polarity="Input" name="oper(3:0)" />
        <port polarity="Input" name="func(3:0)" />
        <port polarity="Input" name="cond(3:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="pcWrite" />
        <port polarity="Output" name="pcaddr(15:0)" />
        <port polarity="Input" name="memdata(15:0)" />
        <port polarity="Output" name="memaddr(15:0)" />
        <port polarity="Input" name="aluSrcB" />
        <port polarity="Input" name="aluSrcA" />
        <port polarity="Input" name="signExtImm" />
        <port polarity="Input" name="Immediate(7:0)" />
        <port polarity="Input" name="regsrc(1:0)" />
        <port polarity="Input" name="pcaddrsrc(1:0)" />
        <blockdef name="alu">
            <timestamp>2010-11-2T22:37:27</timestamp>
            <line x2="128" y1="-304" y2="-336" x1="176" />
            <line x2="176" y1="-272" y2="-304" x1="128" />
            <line x2="304" y1="-368" y2="-528" x1="384" />
            <line x2="384" y1="-80" y2="-240" x1="304" />
            <line x2="128" y1="-272" y2="-80" x1="128" />
            <rect width="64" x="64" y="-412" height="24" />
            <line x2="64" y1="-400" y2="-400" x1="128" />
            <line x2="304" y1="-80" y2="-80" x1="128" />
            <rect width="24" x="132" y="-80" height="48" />
            <rect width="24" x="180" y="-80" height="48" />
            <line x2="192" y1="-32" y2="-80" x1="192" />
            <line x2="144" y1="-32" y2="-80" x1="144" />
            <rect width="64" x="64" y="-236" height="24" />
            <line x2="64" y1="-224" y2="-224" x1="128" />
            <rect width="24" x="228" y="-80" height="48" />
            <line x2="240" y1="-80" y2="-32" x1="240" />
            <line x2="128" y1="-528" y2="-336" x1="128" />
            <line x2="304" y1="-528" y2="-528" x1="128" />
            <line x2="384" y1="-368" y2="-240" x1="384" />
            <rect width="64" x="384" y="-316" height="24" />
            <line x2="448" y1="-304" y2="-304" x1="384" />
            <rect width="24" x="276" y="-80" height="48" />
            <line x2="288" y1="-80" y2="-32" x1="288" />
            <line x2="444" y1="-224" y2="-224" x1="376" />
            <line x2="368" y1="-212" y2="-212" x1="448" />
            <line x2="448" y1="-236" y2="-236" x1="384" />
            <line x2="448" y1="-236" y2="-212" x1="448" />
        </blockdef>
        <blockdef name="regfile">
            <timestamp>2010-10-11T4:24:9</timestamp>
            <rect width="336" x="64" y="-320" height="336" />
            <rect width="64" x="0" y="-284" height="24" />
            <line x2="0" y1="-272" y2="-272" x1="64" />
            <line x2="0" y1="-208" y2="-208" x1="64" />
            <rect width="64" x="0" y="-156" height="24" />
            <line x2="0" y1="-144" y2="-144" x1="64" />
            <rect width="64" x="400" y="-156" height="24" />
            <line x2="464" y1="-144" y2="-144" x1="400" />
            <rect width="64" x="0" y="-92" height="24" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <rect width="64" x="400" y="-92" height="24" />
            <line x2="464" y1="-80" y2="-80" x1="400" />
            <line x2="0" y1="-16" y2="-16" x1="64" />
        </blockdef>
        <blockdef name="bus16Mux">
            <timestamp>2010-10-11T4:8:46</timestamp>
            <line x2="272" y1="0" y2="-72" x1="128" />
            <line x2="128" y1="-200" y2="-272" x1="272" />
            <line x2="128" y1="0" y2="-272" x1="128" />
            <line x2="272" y1="-72" y2="-200" x1="272" />
            <line x2="208" y1="16" y2="-40" x1="208" />
            <rect width="64" x="64" y="-204" height="24" />
            <line x2="64" y1="-192" y2="-192" x1="128" />
            <rect width="64" x="64" y="-108" height="24" />
            <line x2="64" y1="-96" y2="-96" x1="128" />
            <rect width="64" x="272" y="-156" height="24" />
            <line x2="336" y1="-144" y2="-144" x1="272" />
        </blockdef>
        <blockdef name="pc">
            <timestamp>2010-11-4T2:0:5</timestamp>
            <rect width="320" x="64" y="-256" height="256" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="56" y1="-32" y2="-32" x1="0" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <circle r="4" cx="60" cy="-32" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
        </blockdef>
        <blockdef name="signExtend">
            <timestamp>2010-10-19T23:2:5</timestamp>
            <rect width="64" x="368" y="-108" height="24" />
            <line x2="432" y1="-96" y2="-96" x1="368" />
            <circle r="154" cx="214" cy="-116" />
            <line x2="60" y1="-96" y2="-96" x1="0" />
            <rect width="60" x="0" y="-108" height="24" />
            <line x2="84" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="bus16x4Mux">
            <timestamp>2010-11-3T7:14:10</timestamp>
            <line x2="320" y1="-272" y2="-176" x1="128" />
            <line x2="128" y1="-272" y2="124" x1="128" />
            <rect width="64" x="64" y="-204" height="24" />
            <line x2="64" y1="-192" y2="-192" x1="128" />
            <line x2="320" y1="128" y2="32" x1="128" />
            <line x2="320" y1="-176" y2="32" x1="320" />
            <line x2="240" y1="128" y2="72" x1="240" />
            <rect width="64" x="320" y="-92" height="24" />
            <line x2="384" y1="-80" y2="-80" x1="320" />
            <rect width="64" x="64" y="-124" height="24" />
            <line x2="64" y1="-112" y2="-112" x1="128" />
            <rect width="64" x="64" y="-44" height="24" />
            <line x2="64" y1="-32" y2="-32" x1="128" />
            <rect width="64" x="64" y="36" height="24" />
            <line x2="64" y1="48" y2="48" x1="128" />
        </blockdef>
        <block symbolname="alu" name="aluChip">
            <blockpin signalname="XLXN_6(15:0)" name="dst(15:0)" />
            <blockpin signalname="oper(3:0)" name="oper(3:0)" />
            <blockpin signalname="func(3:0)" name="func(3:0)" />
            <blockpin signalname="XLXN_7(15:0)" name="src(15:0)" />
            <blockpin signalname="cond(3:0)" name="cond(3:0)" />
            <blockpin signalname="result(15:0)" name="result(15:0)" />
            <blockpin name="condIn(4:0)" />
            <blockpin name="condOut(4:0)" />
        </block>
        <block symbolname="regfile" name="registerFile">
            <blockpin signalname="XLXN_20(15:0)" name="data(15:0)" />
            <blockpin signalname="regwrite" name="write" />
            <blockpin signalname="dst_addr(3:0)" name="dst_addr(3:0)" />
            <blockpin signalname="writedata(15:0)" name="dst_data(15:0)" />
            <blockpin signalname="src_addr(3:0)" name="src_addr(3:0)" />
            <blockpin signalname="memaddr(15:0)" name="src_data(15:0)" />
            <blockpin signalname="clk" name="clk" />
        </block>
        <block symbolname="bus16Mux" name="pcSrcMux">
            <blockpin signalname="pcSrc" name="c" />
            <blockpin signalname="XLXN_115(15:0)" name="x(15:0)" />
            <blockpin signalname="result(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_125(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="pc" name="programCounter">
            <blockpin signalname="XLXN_115(15:0)" name="pc_plus_one(15:0)" />
            <blockpin signalname="pcWrite" name="write" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_125(15:0)" name="data(15:0)" />
            <blockpin signalname="XLXN_129(15:0)" name="pc(15:0)" />
        </block>
        <block symbolname="bus16x4Mux" name="regsrcMux">
            <blockpin signalname="result(15:0)" name="x(15:0)" />
            <blockpin signalname="regsrc(1:0)" name="c(1:0)" />
            <blockpin signalname="XLXN_20(15:0)" name="mout(15:0)" />
            <blockpin signalname="XLXN_115(15:0)" name="y(15:0)" />
            <blockpin signalname="memdata(15:0)" name="w(15:0)" />
            <blockpin signalname="memdata(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="bus16Mux" name="aluSrcBMux">
            <blockpin signalname="aluSrcB" name="c" />
            <blockpin signalname="memaddr(15:0)" name="x(15:0)" />
            <blockpin signalname="XLXN_126(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_7(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="bus16Mux" name="aluSrcAMux">
            <blockpin signalname="aluSrcA" name="c" />
            <blockpin signalname="XLXN_115(15:0)" name="x(15:0)" />
            <blockpin signalname="writedata(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_6(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="signExtend" name="signExt">
            <blockpin signalname="XLXN_126(15:0)" name="extImm(15:0)" />
            <blockpin signalname="Immediate(7:0)" name="immediate(7:0)" />
            <blockpin signalname="signExtImm" name="signExtImm" />
        </block>
        <block symbolname="bus16x4Mux" name="pcMux">
            <blockpin signalname="XLXN_115(15:0)" name="x(15:0)" />
            <blockpin signalname="pcaddrsrc(1:0)" name="c(1:0)" />
            <blockpin signalname="pcaddr(15:0)" name="mout(15:0)" />
            <blockpin signalname="result(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_129(15:0)" name="w(15:0)" />
            <blockpin signalname="XLXN_129(15:0)" name="z(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="pcSrc">
            <wire x2="352" y1="768" y2="768" x1="128" />
            <wire x2="352" y1="752" y2="768" x1="352" />
        </branch>
        <branch name="result(15:0)">
            <wire x2="64" y1="128" y2="640" x1="64" />
            <wire x2="208" y1="640" y2="640" x1="64" />
            <wire x2="1216" y1="128" y2="128" x1="64" />
            <wire x2="1216" y1="128" y2="1072" x1="1216" />
            <wire x2="1248" y1="1072" y2="1072" x1="1216" />
            <wire x2="2416" y1="128" y2="128" x1="1216" />
            <wire x2="3200" y1="128" y2="128" x1="2416" />
            <wire x2="3200" y1="128" y2="1680" x1="3200" />
            <wire x2="2416" y1="128" y2="512" x1="2416" />
            <wire x2="2528" y1="512" y2="512" x1="2416" />
            <wire x2="3200" y1="1680" y2="1680" x1="3088" />
        </branch>
        <branch name="src_addr(3:0)">
            <wire x2="1616" y1="1680" y2="1680" x1="1312" />
        </branch>
        <branch name="dst_addr(3:0)">
            <wire x2="1616" y1="1616" y2="1616" x1="1312" />
        </branch>
        <branch name="regwrite">
            <wire x2="1616" y1="1552" y2="1552" x1="1312" />
        </branch>
        <branch name="XLXN_20(15:0)">
            <wire x2="1600" y1="1184" y2="1184" x1="1568" />
            <wire x2="1600" y1="1184" y2="1488" x1="1600" />
            <wire x2="1616" y1="1488" y2="1488" x1="1600" />
        </branch>
        <branch name="oper(3:0)">
            <wire x2="2784" y1="1952" y2="2208" x1="2784" />
        </branch>
        <instance x="1616" y="1760" name="registerFile" orien="R0">
        </instance>
        <branch name="clk">
            <wire x2="352" y1="1568" y2="1568" x1="256" />
            <wire x2="352" y1="1568" y2="1744" x1="352" />
            <wire x2="1616" y1="1744" y2="1744" x1="352" />
            <wire x2="624" y1="1088" y2="1088" x1="352" />
            <wire x2="352" y1="1088" y2="1568" x1="352" />
        </branch>
        <branch name="pcWrite">
            <wire x2="624" y1="1024" y2="1024" x1="304" />
        </branch>
        <branch name="XLXN_125(15:0)">
            <wire x2="560" y1="592" y2="592" x1="480" />
            <wire x2="560" y1="592" y2="960" x1="560" />
            <wire x2="624" y1="960" y2="960" x1="560" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1616" name="dst_addr(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1680" name="src_addr(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1552" name="regwrite" orien="R180" />
        <iomarker fontsize="28" x="2784" y="2208" name="oper(3:0)" orien="R90" />
        <iomarker fontsize="28" x="2832" y="2208" name="func(3:0)" orien="R90" />
        <iomarker fontsize="28" x="2880" y="2208" name="cond(3:0)" orien="R90" />
        <iomarker fontsize="28" x="256" y="1568" name="clk" orien="R180" />
        <branch name="cond(3:0)">
            <wire x2="2880" y1="1952" y2="2208" x1="2880" />
        </branch>
        <branch name="func(3:0)">
            <wire x2="2832" y1="1952" y2="2208" x1="2832" />
        </branch>
        <branch name="XLXN_7(15:0)">
            <wire x2="2688" y1="2000" y2="2000" x1="2624" />
            <wire x2="2704" y1="1760" y2="1760" x1="2688" />
            <wire x2="2688" y1="1760" y2="2000" x1="2688" />
        </branch>
        <instance x="2640" y="1984" name="aluChip" orien="R0">
        </instance>
        <branch name="pcaddr(15:0)">
            <wire x2="2960" y1="544" y2="544" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2960" y="544" name="pcaddr(15:0)" orien="R0" />
        <instance x="1184" y="1264" name="regsrcMux" orien="R0">
        </instance>
        <branch name="memdata(15:0)">
            <wire x2="1168" y1="1232" y2="1232" x1="1008" />
            <wire x2="1248" y1="1232" y2="1232" x1="1168" />
            <wire x2="1168" y1="1232" y2="1312" x1="1168" />
            <wire x2="1248" y1="1312" y2="1312" x1="1168" />
        </branch>
        <instance x="624" y="1184" name="programCounter" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1008" y="1232" name="memdata(15:0)" orien="R180" />
        <branch name="aluSrcB">
            <wire x2="2496" y1="2320" y2="2320" x1="2368" />
            <wire x2="2496" y1="2160" y2="2320" x1="2496" />
        </branch>
        <iomarker fontsize="28" x="2368" y="2320" name="aluSrcB" orien="R180" />
        <branch name="memaddr(15:0)">
            <wire x2="2192" y1="1680" y2="1680" x1="2080" />
            <wire x2="2352" y1="1680" y2="1680" x1="2192" />
            <wire x2="2192" y1="1680" y2="1952" x1="2192" />
            <wire x2="2352" y1="1952" y2="1952" x1="2192" />
        </branch>
        <branch name="aluSrcA">
            <wire x2="2480" y1="1488" y2="1488" x1="2368" />
            <wire x2="2480" y1="1392" y2="1488" x1="2480" />
        </branch>
        <branch name="XLXN_6(15:0)">
            <wire x2="2688" y1="1232" y2="1232" x1="2608" />
            <wire x2="2688" y1="1232" y2="1584" x1="2688" />
            <wire x2="2704" y1="1584" y2="1584" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="2352" y="1680" name="memaddr(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2352" y="1616" name="writedata(15:0)" orien="R0" />
        <branch name="writedata(15:0)">
            <wire x2="2192" y1="1616" y2="1616" x1="2080" />
            <wire x2="2352" y1="1616" y2="1616" x1="2192" />
            <wire x2="2336" y1="1280" y2="1280" x1="2192" />
            <wire x2="2192" y1="1280" y2="1616" x1="2192" />
        </branch>
        <branch name="XLXN_115(15:0)">
            <wire x2="144" y1="320" y2="544" x1="144" />
            <wire x2="208" y1="544" y2="544" x1="144" />
            <wire x2="1168" y1="320" y2="320" x1="144" />
            <wire x2="2192" y1="320" y2="320" x1="1168" />
            <wire x2="2192" y1="320" y2="1184" x1="2192" />
            <wire x2="2336" y1="1184" y2="1184" x1="2192" />
            <wire x2="2464" y1="320" y2="320" x1="2192" />
            <wire x2="2464" y1="320" y2="432" x1="2464" />
            <wire x2="2528" y1="432" y2="432" x1="2464" />
            <wire x2="1168" y1="320" y2="1152" x1="1168" />
            <wire x2="1248" y1="1152" y2="1152" x1="1168" />
            <wire x2="1168" y1="1152" y2="1152" x1="1072" />
        </branch>
        <iomarker fontsize="28" x="2368" y="1488" name="aluSrcA" orien="R180" />
        <instance x="2272" y="1376" name="aluSrcAMux" orien="R0">
        </instance>
        <instance x="2288" y="2144" name="aluSrcBMux" orien="R0">
        </instance>
        <branch name="signExtImm">
            <wire x2="1520" y1="2112" y2="2112" x1="1360" />
        </branch>
        <branch name="Immediate(7:0)">
            <wire x2="1520" y1="2048" y2="2048" x1="1392" />
        </branch>
        <instance x="1520" y="2144" name="signExt" orien="R0">
        </instance>
        <iomarker fontsize="28" x="1360" y="2112" name="signExtImm" orien="R180" />
        <iomarker fontsize="28" x="1392" y="2048" name="Immediate(7:0)" orien="R180" />
        <branch name="XLXN_126(15:0)">
            <wire x2="2352" y1="2048" y2="2048" x1="1952" />
        </branch>
        <iomarker fontsize="28" x="128" y="768" name="pcSrc" orien="R180" />
        <instance x="144" y="736" name="pcSrcMux" orien="R0">
        </instance>
        <iomarker fontsize="28" x="304" y="1024" name="pcWrite" orien="R180" />
        <iomarker fontsize="28" x="240" y="1152" name="rst" orien="R180" />
        <branch name="regsrc(1:0)">
            <wire x2="1424" y1="1456" y2="1456" x1="1280" />
            <wire x2="1424" y1="1392" y2="1456" x1="1424" />
        </branch>
        <iomarker fontsize="28" x="1280" y="1456" name="regsrc(1:0)" orien="R180" />
        <instance x="2464" y="624" name="pcMux" orien="R0">
        </instance>
        <branch name="XLXN_129(15:0)">
            <wire x2="1120" y1="960" y2="960" x1="1072" />
            <wire x2="2416" y1="592" y2="592" x1="1120" />
            <wire x2="2528" y1="592" y2="592" x1="2416" />
            <wire x2="2416" y1="592" y2="672" x1="2416" />
            <wire x2="2528" y1="672" y2="672" x1="2416" />
            <wire x2="1120" y1="592" y2="960" x1="1120" />
        </branch>
        <branch name="pcaddrsrc(1:0)">
            <wire x2="2704" y1="816" y2="816" x1="2608" />
            <wire x2="2704" y1="752" y2="816" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2608" y="816" name="pcaddrsrc(1:0)" orien="R180" />
        <branch name="rst">
            <wire x2="384" y1="1152" y2="1152" x1="240" />
            <wire x2="624" y1="1152" y2="1152" x1="384" />
        </branch>
    </sheet>
</drawing>