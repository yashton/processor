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
        <signal name="regsrc(1:0)" />
        <signal name="XLXN_129(15:0)" />
        <signal name="pcaddrsrc(1:0)" />
        <signal name="signExtImm" />
        <signal name="Immediate(7:0)" />
        <signal name="XLXN_130" />
        <signal name="XLXN_132(4:0)" />
        <signal name="XLXN_133(4:0)" />
        <signal name="XLXN_134(4:0)" />
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
        <port polarity="Input" name="regsrc(1:0)" />
        <port polarity="Input" name="pcaddrsrc(1:0)" />
        <port polarity="Input" name="signExtImm" />
        <port polarity="Input" name="Immediate(7:0)" />
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
        <blockdef name="alu">
            <timestamp>2010-11-11T0:45:38</timestamp>
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
            <rect width="64" x="384" y="-364" height="24" />
            <rect width="24" x="276" y="-80" height="48" />
            <line x2="288" y1="-80" y2="-32" x1="288" />
            <line x2="448" y1="-352" y2="-352" x1="384" />
            <line x2="384" y1="-304" y2="-304" x1="444" />
            <line x2="384" y1="-292" y2="-292" x1="448" />
            <line x2="448" y1="-316" y2="-316" x1="384" />
            <line x2="448" y1="-316" y2="-292" x1="448" />
            <rect width="64" x="384" y="-268" height="24" />
            <line x2="384" y1="-256" y2="-256" x1="448" />
        </blockdef>
        <blockdef name="psr">
            <timestamp>2010-11-11T1:12:24</timestamp>
            <rect width="304" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="368" y="-172" height="24" />
            <line x2="432" y1="-160" y2="-160" x1="368" />
        </blockdef>
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
        <block symbolname="bus16x4Mux" name="pcMux">
            <blockpin signalname="XLXN_115(15:0)" name="x(15:0)" />
            <blockpin signalname="pcaddrsrc(1:0)" name="c(1:0)" />
            <blockpin signalname="pcaddr(15:0)" name="mout(15:0)" />
            <blockpin signalname="result(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_129(15:0)" name="w(15:0)" />
            <blockpin signalname="XLXN_129(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="signExtend" name="signExt">
            <blockpin signalname="XLXN_126(15:0)" name="extImm(15:0)" />
            <blockpin signalname="Immediate(7:0)" name="immediate(7:0)" />
            <blockpin signalname="signExtImm" name="signExtImm" />
        </block>
        <block symbolname="alu" name="XLXI_2">
            <blockpin signalname="XLXN_6(15:0)" name="dst(15:0)" />
            <blockpin signalname="oper(3:0)" name="oper(3:0)" />
            <blockpin signalname="func(3:0)" name="func(3:0)" />
            <blockpin signalname="XLXN_7(15:0)" name="src(15:0)" />
            <blockpin signalname="cond(3:0)" name="cond(3:0)" />
            <blockpin signalname="XLXN_132(4:0)" name="psrRead(4:0)" />
            <blockpin signalname="result(15:0)" name="result(15:0)" />
            <blockpin signalname="XLXN_133(4:0)" name="psrWrite(4:0)" />
            <blockpin signalname="XLXN_134(4:0)" name="psrWrEn(4:0)" />
        </block>
        <block symbolname="psr" name="XLXI_4">
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="XLXN_133(4:0)" name="psrWrEn(4:0)" />
            <blockpin signalname="XLXN_134(4:0)" name="psrWrite(4:0)" />
            <blockpin signalname="XLXN_132(4:0)" name="psrRead(4:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="pcSrc">
            <wire x2="352" y1="768" y2="768" x1="128" />
            <wire x2="352" y1="752" y2="768" x1="352" />
        </branch>
        <branch name="src_addr(3:0)">
            <wire x2="1392" y1="1680" y2="1680" x1="1312" />
        </branch>
        <branch name="dst_addr(3:0)">
            <wire x2="1392" y1="1616" y2="1616" x1="1312" />
        </branch>
        <branch name="regwrite">
            <wire x2="1392" y1="1552" y2="1552" x1="1312" />
        </branch>
        <branch name="XLXN_20(15:0)">
            <wire x2="1328" y1="1408" y2="1488" x1="1328" />
            <wire x2="1392" y1="1488" y2="1488" x1="1328" />
            <wire x2="1440" y1="1408" y2="1408" x1="1328" />
            <wire x2="1440" y1="1184" y2="1184" x1="1424" />
            <wire x2="1440" y1="1184" y2="1408" x1="1440" />
        </branch>
        <branch name="clk">
            <wire x2="352" y1="1568" y2="1568" x1="256" />
            <wire x2="352" y1="1568" y2="1744" x1="352" />
            <wire x2="1392" y1="1744" y2="1744" x1="352" />
            <wire x2="352" y1="1744" y2="2336" x1="352" />
            <wire x2="2208" y1="2336" y2="2336" x1="352" />
            <wire x2="480" y1="1088" y2="1088" x1="352" />
            <wire x2="352" y1="1088" y2="1568" x1="352" />
        </branch>
        <branch name="pcWrite">
            <wire x2="480" y1="1024" y2="1024" x1="304" />
        </branch>
        <branch name="XLXN_125(15:0)">
            <wire x2="400" y1="848" y2="960" x1="400" />
            <wire x2="480" y1="960" y2="960" x1="400" />
            <wire x2="496" y1="848" y2="848" x1="400" />
            <wire x2="496" y1="592" y2="592" x1="480" />
            <wire x2="496" y1="592" y2="848" x1="496" />
        </branch>
        <iomarker fontsize="28" x="1312" y="1616" name="dst_addr(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1680" name="src_addr(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1552" name="regwrite" orien="R180" />
        <iomarker fontsize="28" x="256" y="1568" name="clk" orien="R180" />
        <branch name="XLXN_7(15:0)">
            <wire x2="2288" y1="2000" y2="2000" x1="2272" />
            <wire x2="2288" y1="1760" y2="2000" x1="2288" />
            <wire x2="2592" y1="1760" y2="1760" x1="2288" />
        </branch>
        <branch name="pcaddr(15:0)">
            <wire x2="2960" y1="544" y2="544" x1="2848" />
        </branch>
        <iomarker fontsize="28" x="2960" y="544" name="pcaddr(15:0)" orien="R0" />
        <branch name="memdata(15:0)">
            <wire x2="1056" y1="1360" y2="1360" x1="960" />
            <wire x2="1104" y1="1232" y2="1232" x1="1056" />
            <wire x2="1056" y1="1232" y2="1312" x1="1056" />
            <wire x2="1056" y1="1312" y2="1360" x1="1056" />
            <wire x2="1104" y1="1312" y2="1312" x1="1056" />
        </branch>
        <branch name="memaddr(15:0)">
            <wire x2="1936" y1="1680" y2="1680" x1="1856" />
            <wire x2="2000" y1="1680" y2="1680" x1="1936" />
            <wire x2="1936" y1="1680" y2="1952" x1="1936" />
            <wire x2="2000" y1="1952" y2="1952" x1="1936" />
        </branch>
        <branch name="aluSrcA">
            <wire x2="2016" y1="1392" y2="1408" x1="2016" />
            <wire x2="2176" y1="1408" y2="1408" x1="2016" />
            <wire x2="2176" y1="1408" y2="1488" x1="2176" />
            <wire x2="2176" y1="1488" y2="1488" x1="2160" />
        </branch>
        <branch name="XLXN_6(15:0)">
            <wire x2="2400" y1="1232" y2="1232" x1="2144" />
            <wire x2="2400" y1="1232" y2="1584" x1="2400" />
            <wire x2="2592" y1="1584" y2="1584" x1="2400" />
        </branch>
        <branch name="writedata(15:0)">
            <wire x2="1872" y1="1280" y2="1280" x1="1808" />
            <wire x2="1808" y1="1280" y2="1408" x1="1808" />
            <wire x2="1920" y1="1408" y2="1408" x1="1808" />
            <wire x2="1920" y1="1408" y2="1616" x1="1920" />
            <wire x2="2000" y1="1616" y2="1616" x1="1920" />
            <wire x2="1920" y1="1616" y2="1616" x1="1856" />
        </branch>
        <branch name="XLXN_126(15:0)">
            <wire x2="1344" y1="2064" y2="2064" x1="1328" />
            <wire x2="2000" y1="2048" y2="2048" x1="1344" />
            <wire x2="1344" y1="2048" y2="2064" x1="1344" />
        </branch>
        <iomarker fontsize="28" x="128" y="768" name="pcSrc" orien="R180" />
        <instance x="144" y="736" name="pcSrcMux" orien="R0">
        </instance>
        <iomarker fontsize="28" x="304" y="1024" name="pcWrite" orien="R180" />
        <iomarker fontsize="28" x="240" y="1152" name="rst" orien="R180" />
        <branch name="regsrc(1:0)">
            <wire x2="1280" y1="1456" y2="1456" x1="1072" />
            <wire x2="1280" y1="1392" y2="1456" x1="1280" />
        </branch>
        <instance x="2464" y="624" name="pcMux" orien="R0">
        </instance>
        <branch name="XLXN_129(15:0)">
            <wire x2="1664" y1="960" y2="960" x1="928" />
            <wire x2="1664" y1="592" y2="960" x1="1664" />
            <wire x2="2416" y1="592" y2="592" x1="1664" />
            <wire x2="2528" y1="592" y2="592" x1="2416" />
            <wire x2="2416" y1="592" y2="672" x1="2416" />
            <wire x2="2528" y1="672" y2="672" x1="2416" />
        </branch>
        <branch name="pcaddrsrc(1:0)">
            <wire x2="2704" y1="816" y2="816" x1="2608" />
            <wire x2="2704" y1="752" y2="816" x1="2704" />
        </branch>
        <iomarker fontsize="28" x="2608" y="816" name="pcaddrsrc(1:0)" orien="R180" />
        <branch name="rst">
            <wire x2="480" y1="1152" y2="1152" x1="240" />
        </branch>
        <instance x="480" y="1184" name="programCounter" orien="R0">
        </instance>
        <iomarker fontsize="28" x="960" y="1360" name="memdata(15:0)" orien="R180" />
        <iomarker fontsize="28" x="1072" y="1456" name="regsrc(1:0)" orien="R180" />
        <branch name="XLXN_115(15:0)">
            <wire x2="144" y1="320" y2="544" x1="144" />
            <wire x2="208" y1="544" y2="544" x1="144" />
            <wire x2="1072" y1="320" y2="320" x1="144" />
            <wire x2="2192" y1="320" y2="320" x1="1072" />
            <wire x2="2464" y1="320" y2="320" x1="2192" />
            <wire x2="2464" y1="320" y2="432" x1="2464" />
            <wire x2="2528" y1="432" y2="432" x1="2464" />
            <wire x2="2192" y1="320" y2="1040" x1="2192" />
            <wire x2="1072" y1="320" y2="1152" x1="1072" />
            <wire x2="1104" y1="1152" y2="1152" x1="1072" />
            <wire x2="1072" y1="1152" y2="1152" x1="928" />
            <wire x2="1808" y1="1040" y2="1184" x1="1808" />
            <wire x2="1872" y1="1184" y2="1184" x1="1808" />
            <wire x2="2192" y1="1040" y2="1040" x1="1808" />
        </branch>
        <branch name="result(15:0)">
            <wire x2="64" y1="128" y2="640" x1="64" />
            <wire x2="208" y1="640" y2="640" x1="64" />
            <wire x2="1088" y1="128" y2="128" x1="64" />
            <wire x2="1088" y1="128" y2="1072" x1="1088" />
            <wire x2="1104" y1="1072" y2="1072" x1="1088" />
            <wire x2="2416" y1="128" y2="128" x1="1088" />
            <wire x2="2416" y1="128" y2="512" x1="2416" />
            <wire x2="2528" y1="512" y2="512" x1="2416" />
            <wire x2="3216" y1="128" y2="128" x1="2416" />
            <wire x2="3216" y1="128" y2="1632" x1="3216" />
            <wire x2="3216" y1="1632" y2="1632" x1="2976" />
        </branch>
        <instance x="1040" y="1264" name="regsrcMux" orien="R0">
        </instance>
        <instance x="1392" y="1760" name="registerFile" orien="R0">
        </instance>
        <instance x="1808" y="1376" name="aluSrcAMux" orien="R0">
        </instance>
        <branch name="signExtImm">
            <wire x2="896" y1="2128" y2="2128" x1="848" />
        </branch>
        <branch name="Immediate(7:0)">
            <wire x2="896" y1="2064" y2="2064" x1="880" />
        </branch>
        <instance x="896" y="2160" name="signExt" orien="R0">
        </instance>
        <iomarker fontsize="28" x="848" y="2128" name="signExtImm" orien="R180" />
        <iomarker fontsize="28" x="880" y="2064" name="Immediate(7:0)" orien="R180" />
        <iomarker fontsize="28" x="2000" y="1616" name="writedata(15:0)" orien="R0" />
        <iomarker fontsize="28" x="2000" y="1680" name="memaddr(15:0)" orien="R0" />
        <instance x="1936" y="2144" name="aluSrcBMux" orien="R0">
        </instance>
        <iomarker fontsize="28" x="2160" y="1488" name="aluSrcA" orien="R180" />
        <instance x="2528" y="1984" name="XLXI_2" orien="R0">
        </instance>
        <branch name="oper(3:0)">
            <wire x2="2672" y1="1952" y2="2080" x1="2672" />
        </branch>
        <iomarker fontsize="28" x="2672" y="2080" name="oper(3:0)" orien="R90" />
        <iomarker fontsize="28" x="2720" y="2080" name="func(3:0)" orien="R90" />
        <branch name="func(3:0)">
            <wire x2="2720" y1="1952" y2="2080" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="2768" y="2080" name="cond(3:0)" orien="R90" />
        <branch name="cond(3:0)">
            <wire x2="2768" y1="1952" y2="2080" x1="2768" />
        </branch>
        <branch name="aluSrcB">
            <wire x2="2144" y1="2304" y2="2304" x1="1920" />
            <wire x2="2144" y1="2160" y2="2304" x1="2144" />
        </branch>
        <iomarker fontsize="28" x="1920" y="2304" name="aluSrcB" orien="R180" />
        <instance x="2208" y="2496" name="XLXI_4" orien="R0">
        </instance>
        <branch name="XLXN_132(4:0)">
            <wire x2="2816" y1="2336" y2="2336" x1="2640" />
            <wire x2="2816" y1="1952" y2="2336" x1="2816" />
        </branch>
        <branch name="XLXN_133(4:0)">
            <wire x2="2208" y1="2400" y2="2400" x1="2064" />
            <wire x2="2064" y1="2400" y2="2624" x1="2064" />
            <wire x2="3072" y1="2624" y2="2624" x1="2064" />
            <wire x2="3072" y1="1680" y2="1680" x1="2976" />
            <wire x2="3072" y1="1680" y2="2624" x1="3072" />
        </branch>
        <branch name="XLXN_134(4:0)">
            <wire x2="2208" y1="2464" y2="2464" x1="2128" />
            <wire x2="2128" y1="2464" y2="2544" x1="2128" />
            <wire x2="3040" y1="2544" y2="2544" x1="2128" />
            <wire x2="3040" y1="1728" y2="1728" x1="2976" />
            <wire x2="3040" y1="1728" y2="2544" x1="3040" />
        </branch>
    </sheet>
</drawing>