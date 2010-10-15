<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_10(15:0)" />
        <signal name="XLXN_11(15:0)" />
        <signal name="XLXN_14(15:0)" />
        <signal name="XLXN_28(15:0)" />
        <signal name="XLXN_31" />
        <signal name="XLXN_43(15:0)" />
        <signal name="XLXN_44(15:0)" />
        <signal name="XLXN_46(15:0)" />
        <signal name="XLXN_49(15:0)" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51" />
        <signal name="XLXN_52" />
        <signal name="XLXN_53" />
        <signal name="XLXN_58(15:0)" />
        <signal name="XLXN_59(15:0)" />
        <signal name="XLXN_61" />
        <signal name="XLXN_65(15:0)" />
        <signal name="XLXN_75(15:0)" />
        <signal name="XLXN_83(15:0)" />
        <signal name="XLXN_86" />
        <signal name="XLXN_85" />
        <signal name="XLXN_89(15:0)" />
        <signal name="XLXN_90" />
        <signal name="XLXN_95(15:0)" />
        <signal name="XLXN_96(15:0)" />
        <signal name="XLXN_97(15:0)" />
        <signal name="XLXN_98(15:0)" />
        <signal name="XLXN_99(15:0)" />
        <signal name="XLXN_100" />
        <signal name="XLXN_101(15:0)" />
        <signal name="XLXN_102(15:0)" />
        <signal name="XLXN_103" />
        <signal name="XLXN_104" />
        <signal name="XLXN_105(15:0)" />
        <signal name="XLXN_106" />
        <signal name="XLXN_107" />
        <signal name="XLXN_108(15:0)" />
        <signal name="XLXN_109(15:0)" />
        <signal name="XLXN_110(15:0)" />
        <signal name="XLXN_111(15:0)" />
        <signal name="XLXN_112" />
        <signal name="XLXN_113" />
        <signal name="XLXN_117" />
        <signal name="XLXN_118" />
        <signal name="XLXN_121" />
        <signal name="XLXN_126" />
        <signal name="XLXN_127" />
        <signal name="pcSrc" />
        <signal name="result(15:0)" />
        <signal name="XLXN_4(15:0)" />
        <signal name="XLXN_6(15:0)" />
        <signal name="XLXN_7(15:0)" />
        <signal name="XLXN_133(15:0)" />
        <signal name="XLXN_9(15:0)" />
        <signal name="aluSrcA" />
        <signal name="aluSrcB" />
        <signal name="immediate(15:0)" />
        <signal name="src_addr(3:0)" />
        <signal name="dst_addr(3:0)" />
        <signal name="regwrite" />
        <signal name="XLXN_20(15:0)" />
        <signal name="regsrc" />
        <signal name="oper(3:0)" />
        <signal name="func(3:0)" />
        <signal name="cond(3:0)" />
        <signal name="signExtImm" />
        <signal name="XLXN_115(15:0)" />
        <signal name="pc(15:0)" />
        <signal name="clk" />
        <signal name="XLXN_150" />
        <signal name="rst" />
        <signal name="pcWrite" />
        <signal name="XLXN_125(15:0)" />
        <signal name="XLXN_154(15:0)" />
        <port polarity="Output" name="XLXN_43(15:0)" />
        <port polarity="Input" name="pcSrc" />
        <port polarity="Output" name="result(15:0)" />
        <port polarity="Input" name="aluSrcA" />
        <port polarity="Input" name="aluSrcB" />
        <port polarity="Input" name="immediate(15:0)" />
        <port polarity="Input" name="src_addr(3:0)" />
        <port polarity="Input" name="dst_addr(3:0)" />
        <port polarity="Input" name="regwrite" />
        <port polarity="Input" name="regsrc" />
        <port polarity="Input" name="oper(3:0)" />
        <port polarity="Input" name="func(3:0)" />
        <port polarity="Input" name="cond(3:0)" />
        <port polarity="Input" name="signExtImm" />
        <port polarity="Output" name="pc(15:0)" />
        <port polarity="Input" name="clk" />
        <port polarity="Input" name="rst" />
        <port polarity="Input" name="pcWrite" />
        <blockdef name="alu">
            <timestamp>2010-10-11T4:28:11</timestamp>
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
            <line x2="288" y1="-32" y2="-80" x1="288" />
            <line x2="128" y1="-528" y2="-336" x1="128" />
            <line x2="304" y1="-528" y2="-528" x1="128" />
            <line x2="384" y1="-368" y2="-240" x1="384" />
            <rect width="64" x="384" y="-316" height="24" />
            <line x2="448" y1="-304" y2="-304" x1="384" />
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
            <timestamp>2010-10-11T5:1:42</timestamp>
            <rect width="320" x="64" y="-256" height="256" />
            <rect width="64" x="384" y="-236" height="24" />
            <line x2="448" y1="-224" y2="-224" x1="384" />
            <rect width="64" x="384" y="-44" height="24" />
            <line x2="448" y1="-32" y2="-32" x1="384" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="56" y1="-32" y2="-32" x1="0" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <circle r="4" cx="60" cy="-32" />
        </blockdef>
        <block symbolname="bus16Mux" name="aluSrcAMux">
            <blockpin signalname="aluSrcA" name="c" />
            <blockpin signalname="XLXN_115(15:0)" name="x(15:0)" />
            <blockpin signalname="XLXN_9(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_6(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="bus16Mux" name="aluSrcBMux">
            <blockpin signalname="aluSrcB" name="c" />
            <blockpin signalname="XLXN_4(15:0)" name="x(15:0)" />
            <blockpin signalname="immediate(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_7(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="alu" name="XLXI_1">
            <blockpin signalname="XLXN_6(15:0)" name="dst(15:0)" />
            <blockpin signalname="oper(3:0)" name="oper(3:0)" />
            <blockpin signalname="func(3:0)" name="func(3:0)" />
            <blockpin signalname="XLXN_7(15:0)" name="src(15:0)" />
            <blockpin signalname="cond(3:0)" name="cond(3:0)" />
            <blockpin signalname="signExtImm" name="sign_ext_imm" />
            <blockpin signalname="result(15:0)" name="result(15:0)" />
        </block>
        <block symbolname="regfile" name="registerFile">
            <blockpin signalname="XLXN_20(15:0)" name="data(15:0)" />
            <blockpin signalname="regwrite" name="write" />
            <blockpin signalname="dst_addr(3:0)" name="dst_addr(3:0)" />
            <blockpin signalname="XLXN_9(15:0)" name="dst_data(15:0)" />
            <blockpin signalname="src_addr(3:0)" name="src_addr(3:0)" />
            <blockpin signalname="XLXN_4(15:0)" name="src_data(15:0)" />
            <blockpin signalname="clk" name="clk" />
        </block>
        <block symbolname="bus16Mux" name="registerSrcMux">
            <blockpin signalname="regsrc" name="c" />
            <blockpin signalname="result(15:0)" name="x(15:0)" />
            <blockpin signalname="XLXN_115(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_20(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="bus16Mux" name="pcSrcMux">
            <blockpin signalname="pcSrc" name="c" />
            <blockpin signalname="XLXN_115(15:0)" name="x(15:0)" />
            <blockpin signalname="result(15:0)" name="y(15:0)" />
            <blockpin signalname="XLXN_125(15:0)" name="z(15:0)" />
        </block>
        <block symbolname="pc" name="programCounter">
            <blockpin signalname="pc(15:0)" name="pc(15:0)" />
            <blockpin signalname="XLXN_115(15:0)" name="pc_plus_one(15:0)" />
            <blockpin signalname="pcWrite" name="write" />
            <blockpin signalname="clk" name="clk" />
            <blockpin signalname="rst" name="rst" />
            <blockpin signalname="XLXN_125(15:0)" name="data(15:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="pcSrc">
            <wire x2="480" y1="768" y2="768" x1="272" />
            <wire x2="480" y1="752" y2="768" x1="480" />
        </branch>
        <branch name="result(15:0)">
            <wire x2="240" y1="128" y2="640" x1="240" />
            <wire x2="336" y1="640" y2="640" x1="240" />
            <wire x2="1216" y1="128" y2="128" x1="240" />
            <wire x2="3200" y1="128" y2="128" x1="1216" />
            <wire x2="3200" y1="128" y2="1680" x1="3200" />
            <wire x2="3312" y1="1680" y2="1680" x1="3200" />
            <wire x2="1216" y1="128" y2="1088" x1="1216" />
            <wire x2="1312" y1="1088" y2="1088" x1="1216" />
            <wire x2="3200" y1="1680" y2="1680" x1="3088" />
        </branch>
        <branch name="XLXN_4(15:0)">
            <wire x2="2192" y1="1680" y2="1680" x1="2080" />
            <wire x2="2192" y1="1680" y2="1888" x1="2192" />
            <wire x2="2336" y1="1888" y2="1888" x1="2192" />
        </branch>
        <branch name="XLXN_6(15:0)">
            <wire x2="2624" y1="1376" y2="1376" x1="2608" />
            <wire x2="2624" y1="1376" y2="1584" x1="2624" />
            <wire x2="2704" y1="1584" y2="1584" x1="2624" />
        </branch>
        <branch name="XLXN_7(15:0)">
            <wire x2="2624" y1="1936" y2="1936" x1="2608" />
            <wire x2="2704" y1="1760" y2="1760" x1="2624" />
            <wire x2="2624" y1="1760" y2="1936" x1="2624" />
        </branch>
        <instance x="2272" y="1520" name="aluSrcAMux" orien="R0">
        </instance>
        <branch name="XLXN_9(15:0)">
            <wire x2="2192" y1="1616" y2="1616" x1="2080" />
            <wire x2="2192" y1="1424" y2="1616" x1="2192" />
            <wire x2="2336" y1="1424" y2="1424" x1="2192" />
        </branch>
        <instance x="2272" y="2080" name="aluSrcBMux" orien="R0">
        </instance>
        <branch name="aluSrcA">
            <wire x2="2480" y1="1616" y2="1616" x1="2384" />
            <wire x2="2480" y1="1536" y2="1616" x1="2480" />
        </branch>
        <branch name="aluSrcB">
            <wire x2="2480" y1="2176" y2="2176" x1="2368" />
            <wire x2="2480" y1="2096" y2="2176" x1="2480" />
        </branch>
        <branch name="immediate(15:0)">
            <wire x2="2336" y1="1984" y2="1984" x1="1568" />
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
            <wire x2="1600" y1="1136" y2="1136" x1="1584" />
            <wire x2="1600" y1="1136" y2="1488" x1="1600" />
            <wire x2="1616" y1="1488" y2="1488" x1="1600" />
        </branch>
        <branch name="regsrc">
            <wire x2="1456" y1="1456" y2="1456" x1="1136" />
            <wire x2="1456" y1="1296" y2="1456" x1="1456" />
        </branch>
        <instance x="2640" y="1984" name="XLXI_1" orien="R0">
        </instance>
        <branch name="oper(3:0)">
            <wire x2="2784" y1="1952" y2="2208" x1="2784" />
        </branch>
        <branch name="func(3:0)">
            <wire x2="2832" y1="1952" y2="2208" x1="2832" />
        </branch>
        <branch name="cond(3:0)">
            <wire x2="2880" y1="1952" y2="2208" x1="2880" />
        </branch>
        <branch name="signExtImm">
            <wire x2="2928" y1="1952" y2="2192" x1="2928" />
        </branch>
        <instance x="1616" y="1760" name="registerFile" orien="R0">
        </instance>
        <instance x="1248" y="1280" name="registerSrcMux" orien="R0">
        </instance>
        <instance x="272" y="736" name="pcSrcMux" orien="R0">
        </instance>
        <instance x="496" y="1248" name="programCounter" orien="R0">
        </instance>
        <branch name="XLXN_115(15:0)">
            <wire x2="288" y1="320" y2="544" x1="288" />
            <wire x2="336" y1="544" y2="544" x1="288" />
            <wire x2="1152" y1="320" y2="320" x1="288" />
            <wire x2="2192" y1="320" y2="320" x1="1152" />
            <wire x2="2192" y1="320" y2="1328" x1="2192" />
            <wire x2="2336" y1="1328" y2="1328" x1="2192" />
            <wire x2="1152" y1="320" y2="1184" x1="1152" />
            <wire x2="1312" y1="1184" y2="1184" x1="1152" />
            <wire x2="1152" y1="1184" y2="1216" x1="1152" />
            <wire x2="1152" y1="1216" y2="1216" x1="944" />
        </branch>
        <branch name="pc(15:0)">
            <wire x2="960" y1="1024" y2="1024" x1="944" />
            <wire x2="992" y1="1024" y2="1024" x1="960" />
        </branch>
        <branch name="clk">
            <wire x2="352" y1="1568" y2="1568" x1="256" />
            <wire x2="352" y1="1568" y2="1744" x1="352" />
            <wire x2="1616" y1="1744" y2="1744" x1="352" />
            <wire x2="352" y1="1152" y2="1568" x1="352" />
            <wire x2="496" y1="1152" y2="1152" x1="352" />
        </branch>
        <branch name="rst">
            <wire x2="480" y1="1424" y2="1424" x1="224" />
            <wire x2="496" y1="1216" y2="1216" x1="480" />
            <wire x2="480" y1="1216" y2="1424" x1="480" />
        </branch>
        <branch name="pcWrite">
            <wire x2="496" y1="1088" y2="1088" x1="256" />
        </branch>
        <branch name="XLXN_125(15:0)">
            <wire x2="416" y1="880" y2="1024" x1="416" />
            <wire x2="496" y1="1024" y2="1024" x1="416" />
            <wire x2="640" y1="880" y2="880" x1="416" />
            <wire x2="640" y1="592" y2="592" x1="608" />
            <wire x2="640" y1="592" y2="880" x1="640" />
        </branch>
        <iomarker fontsize="28" x="2384" y="1616" name="aluSrcA" orien="R180" />
        <iomarker fontsize="28" x="2368" y="2176" name="aluSrcB" orien="R180" />
        <iomarker fontsize="28" x="1568" y="1984" name="immediate(15:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1616" name="dst_addr(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1680" name="src_addr(3:0)" orien="R180" />
        <iomarker fontsize="28" x="1312" y="1552" name="regwrite" orien="R180" />
        <iomarker fontsize="28" x="1136" y="1456" name="regsrc" orien="R180" />
        <iomarker fontsize="28" x="2784" y="2208" name="oper(3:0)" orien="R90" />
        <iomarker fontsize="28" x="3312" y="1680" name="result(15:0)" orien="R0" />
        <iomarker fontsize="28" x="272" y="768" name="pcSrc" orien="R180" />
        <iomarker fontsize="28" x="2928" y="2192" name="signExtImm" orien="R90" />
        <iomarker fontsize="28" x="2832" y="2208" name="func(3:0)" orien="R90" />
        <iomarker fontsize="28" x="2880" y="2208" name="cond(3:0)" orien="R90" />
        <iomarker fontsize="28" x="256" y="1568" name="clk" orien="R180" />
        <iomarker fontsize="28" x="224" y="1424" name="rst" orien="R180" />
        <iomarker fontsize="28" x="992" y="1024" name="pc(15:0)" orien="R0" />
        <iomarker fontsize="28" x="256" y="1088" name="pcWrite" orien="R180" />
    </sheet>
</drawing>