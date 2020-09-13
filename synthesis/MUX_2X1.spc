*SPICE netlist created from BLIF module MUX_2X1 by blif2BSpice
.include /usr/local/share/qflow/tech/osu018/osu018_stdcells.sp
.subckt MUX_2X1 vdd gnd inp_1 inp_2 sel out 
XINVX1_1 inp_1 _0_ vdd gnd INVX1
XNAND2X1_1 vdd _1_ gnd inp_2 sel NAND2X1
XOAI21X1_1 gnd vdd _0_ sel _2_ _1_ OAI21X1
XBUFX2_1 vdd gnd _2_ out BUFX2
XFILL_0_0_0 vdd gnd FILL
XFILL_0_0_1 vdd gnd FILL
XFILL_0_1_0 vdd gnd FILL
XFILL_0_1_1 vdd gnd FILL
.ends MUX_2X1
 
