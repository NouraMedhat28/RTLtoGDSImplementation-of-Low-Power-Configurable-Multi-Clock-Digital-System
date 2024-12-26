/////////////////////////////////////////////////////////////
// Created by: Synopsys DC Expert(TM) in wire load mode
// Version   : K-2015.06
// Date      : Wed Dec 25 17:00:52 2024
/////////////////////////////////////////////////////////////


module MUX2X1_2 ( SEL, IN0, IN1, OUT );
  input SEL, IN0, IN1;
  output OUT;


  MUX2_X1 U1 ( .A(IN0), .B(IN1), .S(SEL), .Z(OUT) );
endmodule


module MUX2X1_4 ( SEL, IN0, IN1, OUT );
  input SEL, IN0, IN1;
  output OUT;


  MUX2_X1 U1 ( .A(IN0), .B(IN1), .S(SEL), .Z(OUT) );
endmodule


module ClockDivider2_0 ( i_ref_clk, i_rst_n, o_div_clk );
  input i_ref_clk, i_rst_n;
  output o_div_clk;
  wire   n1;

  DFFR_X1 o_div_clk_reg ( .D(n1), .CK(i_ref_clk), .RN(i_rst_n), .Q(o_div_clk), 
        .QN(n1) );
endmodule


module ClockDivider2_2 ( i_ref_clk, i_rst_n, o_div_clk );
  input i_ref_clk, i_rst_n;
  output o_div_clk;
  wire   n2;

  DFFR_X1 o_div_clk_reg ( .D(n2), .CK(i_ref_clk), .RN(i_rst_n), .Q(o_div_clk), 
        .QN(n2) );
endmodule


module ClockDivider2_1 ( i_ref_clk, i_rst_n, o_div_clk );
  input i_ref_clk, i_rst_n;
  output o_div_clk;
  wire   n2;

  DFFR_X1 o_div_clk_reg ( .D(n2), .CK(i_ref_clk), .RN(i_rst_n), .Q(o_div_clk), 
        .QN(n2) );
endmodule


module ClockDivider8 ( i_ref_clk, i_rst_n, o_div_clk );
  input i_ref_clk, i_rst_n;
  output o_div_clk;
  wire   i_ref_clk_2, i_ref_clk_4;

  ClockDivider2_0 ClockDivider2Top ( .i_ref_clk(i_ref_clk), .i_rst_n(i_rst_n), 
        .o_div_clk(i_ref_clk_2) );
  ClockDivider2_2 ClockDivider4Top ( .i_ref_clk(i_ref_clk_2), .i_rst_n(i_rst_n), .o_div_clk(i_ref_clk_4) );
  ClockDivider2_1 ClockDivider8Top ( .i_ref_clk(i_ref_clk_4), .i_rst_n(i_rst_n), .o_div_clk(o_div_clk) );
endmodule


module MUX2X1_3 ( SEL, IN0, IN1, OUT );
  input SEL, IN0, IN1;
  output OUT;


  MUX2_X1 U1 ( .A(IN0), .B(IN1), .S(SEL), .Z(OUT) );
endmodule


module ResetSync_0 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   int_sig;

  DFFR_X1 int_sig_reg ( .D(1'b1), .CK(CLK), .RN(RST), .Q(int_sig) );
  DFFR_X1 SYNC_RST_reg ( .D(int_sig), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module ResetSync_1 ( RST, CLK, SYNC_RST );
  input RST, CLK;
  output SYNC_RST;
  wire   int_sig;

  DFFR_X1 int_sig_reg ( .D(1'b1), .CK(CLK), .RN(RST), .Q(int_sig) );
  DFFR_X1 SYNC_RST_reg ( .D(int_sig), .CK(CLK), .RN(RST), .Q(SYNC_RST) );
endmodule


module MUX2X1_0 ( SEL, IN0, IN1, OUT );
  input SEL, IN0, IN1;
  output OUT;


  MUX2_X1 U1 ( .A(IN0), .B(IN1), .S(SEL), .Z(OUT) );
endmodule


module MUX2X1_1 ( SEL, IN0, IN1, OUT );
  input SEL, IN0, IN1;
  output OUT;
  wire   n3, n2;

  INV_X1 U1 ( .A(n3), .ZN(OUT) );
  AOI22_X1 U2 ( .A1(IN0), .A2(n2), .B1(SEL), .B2(IN1), .ZN(n3) );
  INV_X1 U3 ( .A(SEL), .ZN(n2) );
endmodule


module MUX2X1_5 ( SEL, IN0, IN1, OUT );
  input SEL, IN0, IN1;
  output OUT;
  wire   n2, n4;

  INV_X1 U1 ( .A(n4), .ZN(OUT) );
  AOI22_X1 U2 ( .A1(IN0), .A2(n2), .B1(SEL), .B2(IN1), .ZN(n4) );
  INV_X1 U3 ( .A(SEL), .ZN(n2) );
endmodule


module Synchronizer_0 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n2, n3, n4, n5, n6, n1;

  DFFR_X1 int_sig_reg ( .D(n6), .CK(CLK), .RN(RST), .QN(n4) );
  DFFR_X1 SyncBit_reg ( .D(n5), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n3) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n2) );
  OAI22_X1 U2 ( .A1(n4), .A2(n1), .B1(n3), .B2(EN), .ZN(n5) );
  INV_X1 U3 ( .A(EN), .ZN(n1) );
  OAI21_X1 U4 ( .B1(n4), .B2(EN), .A(n2), .ZN(n6) );
endmodule


module CTRL_RX_BusWidth8_FuncWidth4_AddWidth4 ( RX_P_Data, RX_D_VLD, RST, CLK, 
        Reg_Addr, Reg_Wr_Data, ALU_FUN, RdEn, WrEn, ALU_EN );
  input [7:0] RX_P_Data;
  output [3:0] Reg_Addr;
  output [7:0] Reg_Wr_Data;
  output [3:0] ALU_FUN;
  input RX_D_VLD, RST, CLK;
  output RdEn, WrEn, ALU_EN;
  wire   n3, n4, n5, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20, n21,
         n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n1, n2,
         n6, n7, n8, n9, n10, n34, n35;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFR_X1 \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n5) );
  DFFR_X1 \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]), .QN(n4) );
  DFFR_X1 \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]), .QN(n3) );
  OAI33_X1 U47 ( .A1(n4), .A2(n2), .A3(n18), .B1(n19), .B2(n7), .B3(n9), .ZN(
        n17) );
  XOR2_X1 U48 ( .A(n7), .B(RX_P_Data[4]), .Z(n13) );
  NAND2_X1 U49 ( .A1(n6), .A2(n3), .ZN(n21) );
  NAND2_X1 U50 ( .A1(n18), .A2(n4), .ZN(n30) );
  NAND2_X1 U51 ( .A1(RX_P_Data[3]), .A2(n2), .ZN(n24) );
  NAND2_X1 U52 ( .A1(RX_P_Data[2]), .A2(n2), .ZN(n27) );
  NAND2_X1 U53 ( .A1(RX_P_Data[1]), .A2(n1), .ZN(n28) );
  NAND2_X1 U54 ( .A1(RX_P_Data[0]), .A2(n1), .ZN(n29) );
  NOR2_X1 U3 ( .A1(n27), .A2(n33), .ZN(ALU_FUN[2]) );
  INV_X1 U4 ( .A(WrEn), .ZN(n35) );
  NOR2_X1 U5 ( .A1(n26), .A2(n24), .ZN(Reg_Wr_Data[3]) );
  NOR2_X1 U6 ( .A1(n26), .A2(n28), .ZN(Reg_Wr_Data[1]) );
  NOR2_X1 U7 ( .A1(n26), .A2(n29), .ZN(Reg_Wr_Data[0]) );
  NOR2_X1 U8 ( .A1(n26), .A2(n27), .ZN(Reg_Wr_Data[2]) );
  NOR2_X1 U9 ( .A1(n10), .A2(n35), .ZN(Reg_Wr_Data[6]) );
  NOR2_X1 U10 ( .A1(n34), .A2(n35), .ZN(Reg_Wr_Data[7]) );
  NOR2_X1 U11 ( .A1(n29), .A2(n33), .ZN(ALU_FUN[0]) );
  NOR2_X1 U12 ( .A1(n24), .A2(n33), .ZN(ALU_FUN[3]) );
  NOR2_X1 U13 ( .A1(n24), .A2(n32), .ZN(Reg_Addr[3]) );
  NOR2_X1 U14 ( .A1(n6), .A2(n26), .ZN(WrEn) );
  NOR2_X1 U15 ( .A1(n28), .A2(n32), .ZN(Reg_Addr[1]) );
  NOR2_X1 U16 ( .A1(n27), .A2(n32), .ZN(Reg_Addr[2]) );
  OAI21_X1 U17 ( .B1(n29), .B2(n32), .A(n30), .ZN(Reg_Addr[0]) );
  NOR2_X1 U18 ( .A1(n6), .A2(n33), .ZN(ALU_EN) );
  NOR2_X1 U19 ( .A1(n6), .A2(n32), .ZN(RdEn) );
  NOR2_X1 U20 ( .A1(n28), .A2(n33), .ZN(ALU_FUN[1]) );
  INV_X1 U21 ( .A(n15), .ZN(n9) );
  OR2_X1 U22 ( .A1(n16), .A2(n17), .ZN(next_state[1]) );
  NOR3_X1 U23 ( .A1(n5), .A2(current_state[1]), .A3(n6), .ZN(n16) );
  OAI21_X1 U24 ( .B1(n20), .B2(n14), .A(RX_P_Data[4]), .ZN(n19) );
  NOR4_X1 U25 ( .A1(n10), .A2(n8), .A3(RX_P_Data[1]), .A4(RX_P_Data[5]), .ZN(
        n14) );
  NOR3_X1 U26 ( .A1(n34), .A2(n24), .A3(n25), .ZN(n15) );
  NAND3_X1 U27 ( .A1(n5), .A2(n3), .A3(n4), .ZN(n25) );
  NAND3_X1 U28 ( .A1(current_state[2]), .A2(n5), .A3(current_state[1]), .ZN(
        n33) );
  NAND3_X1 U29 ( .A1(current_state[0]), .A2(n3), .A3(current_state[1]), .ZN(
        n32) );
  AND2_X1 U30 ( .A1(RX_P_Data[4]), .A2(WrEn), .ZN(Reg_Wr_Data[4]) );
  AND2_X1 U31 ( .A1(RX_P_Data[5]), .A2(WrEn), .ZN(Reg_Wr_Data[5]) );
  OAI221_X1 U32 ( .B1(n5), .B2(n21), .C1(n6), .C2(n22), .A(n23), .ZN(
        next_state[0]) );
  NAND3_X1 U33 ( .A1(n13), .A2(n15), .A3(n20), .ZN(n23) );
  NAND3_X1 U34 ( .A1(n5), .A2(n4), .A3(current_state[2]), .ZN(n22) );
  AND3_X1 U35 ( .A1(n30), .A2(n22), .A3(n31), .ZN(n26) );
  NAND3_X1 U36 ( .A1(n5), .A2(n3), .A3(current_state[1]), .ZN(n31) );
  NOR2_X1 U37 ( .A1(n5), .A2(n3), .ZN(n18) );
  OAI21_X1 U38 ( .B1(n11), .B2(n3), .A(n12), .ZN(next_state[2]) );
  AOI22_X1 U39 ( .A1(n6), .A2(n5), .B1(n1), .B2(n4), .ZN(n11) );
  NAND3_X1 U40 ( .A1(n13), .A2(n14), .A3(n15), .ZN(n12) );
  INV_X1 U41 ( .A(RX_P_Data[6]), .ZN(n10) );
  BUF_X1 U42 ( .A(RX_D_VLD), .Z(n1) );
  AND4_X1 U43 ( .A1(RX_P_Data[5]), .A2(RX_P_Data[1]), .A3(n8), .A4(n10), .ZN(
        n20) );
  INV_X1 U44 ( .A(RX_P_Data[2]), .ZN(n8) );
  BUF_X1 U45 ( .A(RX_D_VLD), .Z(n2) );
  INV_X1 U46 ( .A(RX_P_Data[7]), .ZN(n34) );
  INV_X1 U55 ( .A(RX_P_Data[0]), .ZN(n7) );
  INV_X1 U56 ( .A(n1), .ZN(n6) );
endmodule


module CTRL_TX_BusWidth8 ( CLK, RST, ALU_Valid, ALU_OUT, RdData_Valid, RdData, 
        TX_Busy, TX_D_VLD, TX_P_Data );
  input [15:0] ALU_OUT;
  input [7:0] RdData;
  output [7:0] TX_P_Data;
  input CLK, RST, ALU_Valid, RdData_Valid, TX_Busy;
  output TX_D_VLD;
  wire   n9, n10, n11, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23,
         n24, n25, n26, n27, n28, n29, n30, n31, n1;
  wire   [2:0] current_state;
  wire   [2:0] next_state;

  DFFR_X1 \current_state_reg[0]  ( .D(next_state[0]), .CK(CLK), .RN(RST), .Q(
        current_state[0]), .QN(n11) );
  DFFR_X1 \current_state_reg[1]  ( .D(next_state[1]), .CK(CLK), .RN(RST), .Q(
        current_state[1]), .QN(n10) );
  DFFR_X1 \current_state_reg[2]  ( .D(next_state[2]), .CK(CLK), .RN(RST), .Q(
        current_state[2]), .QN(n9) );
  NOR3_X2 U23 ( .A1(n11), .A2(current_state[2]), .A3(n10), .ZN(n24) );
  NAND2_X1 U33 ( .A1(current_state[0]), .A2(n1), .ZN(n13) );
  XOR2_X1 U34 ( .A(RdData_Valid), .B(ALU_Valid), .Z(n20) );
  INV_X1 U3 ( .A(TX_Busy), .ZN(n1) );
  NOR3_X2 U4 ( .A1(n11), .A2(current_state[1]), .A3(n9), .ZN(n23) );
  NOR3_X2 U5 ( .A1(current_state[1]), .A2(current_state[2]), .A3(n11), .ZN(n22) );
  AOI22_X1 U6 ( .A1(current_state[0]), .A2(TX_Busy), .B1(n18), .B2(
        current_state[1]), .ZN(n14) );
  OAI22_X1 U7 ( .A1(n11), .A2(n10), .B1(n13), .B2(n9), .ZN(next_state[2]) );
  OAI21_X1 U8 ( .B1(current_state[0]), .B2(n1), .A(n13), .ZN(n18) );
  OAI211_X1 U9 ( .C1(n11), .C2(n10), .A(n19), .B(n13), .ZN(next_state[0]) );
  NAND4_X1 U10 ( .A1(n20), .A2(n1), .A3(n10), .A4(n9), .ZN(n19) );
  OAI21_X1 U11 ( .B1(n14), .B2(n15), .A(n16), .ZN(next_state[1]) );
  NAND4_X1 U12 ( .A1(ALU_Valid), .A2(n14), .A3(n17), .A4(n15), .ZN(n16) );
  XNOR2_X1 U13 ( .A(n18), .B(current_state[1]), .ZN(n15) );
  NOR2_X1 U14 ( .A1(current_state[2]), .A2(RdData_Valid), .ZN(n17) );
  INV_X1 U15 ( .A(n31), .ZN(TX_P_Data[0]) );
  AOI222_X1 U16 ( .A1(RdData[0]), .A2(n22), .B1(ALU_OUT[8]), .B2(n23), .C1(
        ALU_OUT[0]), .C2(n24), .ZN(n31) );
  INV_X1 U17 ( .A(n30), .ZN(TX_P_Data[1]) );
  AOI222_X1 U18 ( .A1(RdData[1]), .A2(n22), .B1(ALU_OUT[9]), .B2(n23), .C1(
        ALU_OUT[1]), .C2(n24), .ZN(n30) );
  INV_X1 U19 ( .A(n29), .ZN(TX_P_Data[2]) );
  AOI222_X1 U20 ( .A1(RdData[2]), .A2(n22), .B1(ALU_OUT[10]), .B2(n23), .C1(
        ALU_OUT[2]), .C2(n24), .ZN(n29) );
  INV_X1 U21 ( .A(n28), .ZN(TX_P_Data[3]) );
  AOI222_X1 U22 ( .A1(RdData[3]), .A2(n22), .B1(ALU_OUT[11]), .B2(n23), .C1(
        ALU_OUT[3]), .C2(n24), .ZN(n28) );
  INV_X1 U24 ( .A(n27), .ZN(TX_P_Data[4]) );
  AOI222_X1 U25 ( .A1(RdData[4]), .A2(n22), .B1(ALU_OUT[12]), .B2(n23), .C1(
        ALU_OUT[4]), .C2(n24), .ZN(n27) );
  INV_X1 U26 ( .A(n26), .ZN(TX_P_Data[5]) );
  AOI222_X1 U27 ( .A1(RdData[5]), .A2(n22), .B1(ALU_OUT[13]), .B2(n23), .C1(
        ALU_OUT[5]), .C2(n24), .ZN(n26) );
  INV_X1 U28 ( .A(n25), .ZN(TX_P_Data[6]) );
  AOI222_X1 U29 ( .A1(RdData[6]), .A2(n22), .B1(ALU_OUT[14]), .B2(n23), .C1(
        ALU_OUT[6]), .C2(n24), .ZN(n25) );
  INV_X1 U30 ( .A(n21), .ZN(TX_P_Data[7]) );
  AOI222_X1 U31 ( .A1(RdData[7]), .A2(n22), .B1(ALU_OUT[15]), .B2(n23), .C1(
        ALU_OUT[7]), .C2(n24), .ZN(n21) );
  OR3_X1 U32 ( .A1(n24), .A2(n22), .A3(n23), .ZN(TX_D_VLD) );
endmodule


module SystemControl_BusWidth8_FuncWidth4_AddWidth4 ( CLK, RST, RdData_Valid, 
        RX_D_VLD, ALU_Valid, ALU_OUT, RX_P_Data, RdData, TX_Busy, ALU_EN, 
        ALU_FUN, Address, RdEn, WrEn, WrData, TX_P_Data, TX_D_VLD );
  input [15:0] ALU_OUT;
  input [7:0] RX_P_Data;
  input [7:0] RdData;
  output [3:0] ALU_FUN;
  output [3:0] Address;
  output [7:0] WrData;
  output [7:0] TX_P_Data;
  input CLK, RST, RdData_Valid, RX_D_VLD, ALU_Valid, TX_Busy;
  output ALU_EN, RdEn, WrEn, TX_D_VLD;


  CTRL_RX_BusWidth8_FuncWidth4_AddWidth4 CTRL_RX_TOP ( .RX_P_Data(RX_P_Data), 
        .RX_D_VLD(RX_D_VLD), .RST(RST), .CLK(CLK), .Reg_Addr(Address), 
        .Reg_Wr_Data(WrData), .ALU_FUN(ALU_FUN), .RdEn(RdEn), .WrEn(WrEn), 
        .ALU_EN(ALU_EN) );
  CTRL_TX_BusWidth8 CTRL_TX_TOP ( .CLK(CLK), .RST(RST), .ALU_Valid(ALU_Valid), 
        .ALU_OUT(ALU_OUT), .RdData_Valid(RdData_Valid), .RdData(RdData), 
        .TX_Busy(TX_Busy), .TX_D_VLD(TX_D_VLD), .TX_P_Data(TX_P_Data) );
endmodule


module Synchronizer_17 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI21_X1 U2 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  OAI22_X1 U3 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module ALU_OpWidth8_FuncWidth4_DW_div_uns_0 ( a, b, quotient, remainder, 
        divide_by_0 );
  input [7:0] a;
  input [7:0] b;
  output [7:0] quotient;
  output [7:0] remainder;
  output divide_by_0;
  wire   \u_div/SumTmp[1][0] , \u_div/SumTmp[1][1] , \u_div/SumTmp[1][2] ,
         \u_div/SumTmp[1][3] , \u_div/SumTmp[1][4] , \u_div/SumTmp[1][5] ,
         \u_div/SumTmp[1][6] , \u_div/SumTmp[2][0] , \u_div/SumTmp[2][1] ,
         \u_div/SumTmp[2][2] , \u_div/SumTmp[2][3] , \u_div/SumTmp[2][4] ,
         \u_div/SumTmp[2][5] , \u_div/SumTmp[3][0] , \u_div/SumTmp[3][1] ,
         \u_div/SumTmp[3][2] , \u_div/SumTmp[3][3] , \u_div/SumTmp[3][4] ,
         \u_div/SumTmp[4][0] , \u_div/SumTmp[4][1] , \u_div/SumTmp[4][2] ,
         \u_div/SumTmp[4][3] , \u_div/SumTmp[5][0] , \u_div/SumTmp[5][1] ,
         \u_div/SumTmp[5][2] , \u_div/SumTmp[6][0] , \u_div/SumTmp[6][1] ,
         \u_div/SumTmp[7][0] , \u_div/CryTmp[0][1] , \u_div/CryTmp[0][2] ,
         \u_div/CryTmp[0][3] , \u_div/CryTmp[0][4] , \u_div/CryTmp[0][5] ,
         \u_div/CryTmp[0][6] , \u_div/CryTmp[0][7] , \u_div/CryTmp[1][1] ,
         \u_div/CryTmp[1][2] , \u_div/CryTmp[1][3] , \u_div/CryTmp[1][4] ,
         \u_div/CryTmp[1][5] , \u_div/CryTmp[1][6] , \u_div/CryTmp[1][7] ,
         \u_div/CryTmp[2][1] , \u_div/CryTmp[2][2] , \u_div/CryTmp[2][3] ,
         \u_div/CryTmp[2][4] , \u_div/CryTmp[2][5] , \u_div/CryTmp[2][6] ,
         \u_div/CryTmp[3][1] , \u_div/CryTmp[3][2] , \u_div/CryTmp[3][3] ,
         \u_div/CryTmp[3][4] , \u_div/CryTmp[3][5] , \u_div/CryTmp[4][1] ,
         \u_div/CryTmp[4][2] , \u_div/CryTmp[4][3] , \u_div/CryTmp[4][4] ,
         \u_div/CryTmp[5][1] , \u_div/CryTmp[5][2] , \u_div/CryTmp[5][3] ,
         \u_div/CryTmp[6][1] , \u_div/CryTmp[6][2] , \u_div/CryTmp[7][1] ,
         \u_div/PartRem[1][1] , \u_div/PartRem[1][2] , \u_div/PartRem[1][3] ,
         \u_div/PartRem[1][4] , \u_div/PartRem[1][5] , \u_div/PartRem[1][6] ,
         \u_div/PartRem[1][7] , \u_div/PartRem[2][1] , \u_div/PartRem[2][2] ,
         \u_div/PartRem[2][3] , \u_div/PartRem[2][4] , \u_div/PartRem[2][5] ,
         \u_div/PartRem[2][6] , \u_div/PartRem[3][1] , \u_div/PartRem[3][2] ,
         \u_div/PartRem[3][3] , \u_div/PartRem[3][4] , \u_div/PartRem[3][5] ,
         \u_div/PartRem[4][1] , \u_div/PartRem[4][2] , \u_div/PartRem[4][3] ,
         \u_div/PartRem[4][4] , \u_div/PartRem[5][1] , \u_div/PartRem[5][2] ,
         \u_div/PartRem[5][3] , \u_div/PartRem[6][1] , \u_div/PartRem[6][2] ,
         \u_div/PartRem[7][1] , n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12;

  FA_X1 \u_div/u_fa_PartRem_0_6_1  ( .A(\u_div/PartRem[7][1] ), .B(n8), .CI(
        \u_div/CryTmp[6][1] ), .CO(\u_div/CryTmp[6][2] ), .S(
        \u_div/SumTmp[6][1] ) );
  FA_X1 \u_div/u_fa_PartRem_0_5_2  ( .A(\u_div/PartRem[6][2] ), .B(n7), .CI(
        \u_div/CryTmp[5][2] ), .CO(\u_div/CryTmp[5][3] ), .S(
        \u_div/SumTmp[5][2] ) );
  FA_X1 \u_div/u_fa_PartRem_0_5_1  ( .A(\u_div/PartRem[6][1] ), .B(n8), .CI(
        \u_div/CryTmp[5][1] ), .CO(\u_div/CryTmp[5][2] ), .S(
        \u_div/SumTmp[5][1] ) );
  FA_X1 \u_div/u_fa_PartRem_0_4_3  ( .A(\u_div/PartRem[5][3] ), .B(n6), .CI(
        \u_div/CryTmp[4][3] ), .CO(\u_div/CryTmp[4][4] ), .S(
        \u_div/SumTmp[4][3] ) );
  FA_X1 \u_div/u_fa_PartRem_0_4_2  ( .A(\u_div/PartRem[5][2] ), .B(n7), .CI(
        \u_div/CryTmp[4][2] ), .CO(\u_div/CryTmp[4][3] ), .S(
        \u_div/SumTmp[4][2] ) );
  FA_X1 \u_div/u_fa_PartRem_0_4_1  ( .A(\u_div/PartRem[5][1] ), .B(n8), .CI(
        \u_div/CryTmp[4][1] ), .CO(\u_div/CryTmp[4][2] ), .S(
        \u_div/SumTmp[4][1] ) );
  FA_X1 \u_div/u_fa_PartRem_0_3_4  ( .A(\u_div/PartRem[4][4] ), .B(n5), .CI(
        \u_div/CryTmp[3][4] ), .CO(\u_div/CryTmp[3][5] ), .S(
        \u_div/SumTmp[3][4] ) );
  FA_X1 \u_div/u_fa_PartRem_0_3_3  ( .A(\u_div/PartRem[4][3] ), .B(n6), .CI(
        \u_div/CryTmp[3][3] ), .CO(\u_div/CryTmp[3][4] ), .S(
        \u_div/SumTmp[3][3] ) );
  FA_X1 \u_div/u_fa_PartRem_0_3_2  ( .A(\u_div/PartRem[4][2] ), .B(n7), .CI(
        \u_div/CryTmp[3][2] ), .CO(\u_div/CryTmp[3][3] ), .S(
        \u_div/SumTmp[3][2] ) );
  FA_X1 \u_div/u_fa_PartRem_0_3_1  ( .A(\u_div/PartRem[4][1] ), .B(n8), .CI(
        \u_div/CryTmp[3][1] ), .CO(\u_div/CryTmp[3][2] ), .S(
        \u_div/SumTmp[3][1] ) );
  FA_X1 \u_div/u_fa_PartRem_0_2_5  ( .A(\u_div/PartRem[3][5] ), .B(n4), .CI(
        \u_div/CryTmp[2][5] ), .CO(\u_div/CryTmp[2][6] ), .S(
        \u_div/SumTmp[2][5] ) );
  FA_X1 \u_div/u_fa_PartRem_0_2_4  ( .A(\u_div/PartRem[3][4] ), .B(n5), .CI(
        \u_div/CryTmp[2][4] ), .CO(\u_div/CryTmp[2][5] ), .S(
        \u_div/SumTmp[2][4] ) );
  FA_X1 \u_div/u_fa_PartRem_0_2_3  ( .A(\u_div/PartRem[3][3] ), .B(n6), .CI(
        \u_div/CryTmp[2][3] ), .CO(\u_div/CryTmp[2][4] ), .S(
        \u_div/SumTmp[2][3] ) );
  FA_X1 \u_div/u_fa_PartRem_0_2_2  ( .A(\u_div/PartRem[3][2] ), .B(n7), .CI(
        \u_div/CryTmp[2][2] ), .CO(\u_div/CryTmp[2][3] ), .S(
        \u_div/SumTmp[2][2] ) );
  FA_X1 \u_div/u_fa_PartRem_0_2_1  ( .A(\u_div/PartRem[3][1] ), .B(n8), .CI(
        \u_div/CryTmp[2][1] ), .CO(\u_div/CryTmp[2][2] ), .S(
        \u_div/SumTmp[2][1] ) );
  FA_X1 \u_div/u_fa_PartRem_0_1_6  ( .A(\u_div/PartRem[2][6] ), .B(n3), .CI(
        \u_div/CryTmp[1][6] ), .CO(\u_div/CryTmp[1][7] ), .S(
        \u_div/SumTmp[1][6] ) );
  FA_X1 \u_div/u_fa_PartRem_0_1_5  ( .A(\u_div/PartRem[2][5] ), .B(n4), .CI(
        \u_div/CryTmp[1][5] ), .CO(\u_div/CryTmp[1][6] ), .S(
        \u_div/SumTmp[1][5] ) );
  FA_X1 \u_div/u_fa_PartRem_0_1_4  ( .A(\u_div/PartRem[2][4] ), .B(n5), .CI(
        \u_div/CryTmp[1][4] ), .CO(\u_div/CryTmp[1][5] ), .S(
        \u_div/SumTmp[1][4] ) );
  FA_X1 \u_div/u_fa_PartRem_0_1_3  ( .A(\u_div/PartRem[2][3] ), .B(n6), .CI(
        \u_div/CryTmp[1][3] ), .CO(\u_div/CryTmp[1][4] ), .S(
        \u_div/SumTmp[1][3] ) );
  FA_X1 \u_div/u_fa_PartRem_0_1_2  ( .A(\u_div/PartRem[2][2] ), .B(n7), .CI(
        \u_div/CryTmp[1][2] ), .CO(\u_div/CryTmp[1][3] ), .S(
        \u_div/SumTmp[1][2] ) );
  FA_X1 \u_div/u_fa_PartRem_0_1_1  ( .A(\u_div/PartRem[2][1] ), .B(n8), .CI(
        \u_div/CryTmp[1][1] ), .CO(\u_div/CryTmp[1][2] ), .S(
        \u_div/SumTmp[1][1] ) );
  FA_X1 \u_div/u_fa_PartRem_0_0_7  ( .A(\u_div/PartRem[1][7] ), .B(n2), .CI(
        \u_div/CryTmp[0][7] ), .CO(quotient[0]) );
  FA_X1 \u_div/u_fa_PartRem_0_0_6  ( .A(\u_div/PartRem[1][6] ), .B(n3), .CI(
        \u_div/CryTmp[0][6] ), .CO(\u_div/CryTmp[0][7] ) );
  FA_X1 \u_div/u_fa_PartRem_0_0_5  ( .A(\u_div/PartRem[1][5] ), .B(n4), .CI(
        \u_div/CryTmp[0][5] ), .CO(\u_div/CryTmp[0][6] ) );
  FA_X1 \u_div/u_fa_PartRem_0_0_4  ( .A(\u_div/PartRem[1][4] ), .B(n5), .CI(
        \u_div/CryTmp[0][4] ), .CO(\u_div/CryTmp[0][5] ) );
  FA_X1 \u_div/u_fa_PartRem_0_0_3  ( .A(\u_div/PartRem[1][3] ), .B(n6), .CI(
        \u_div/CryTmp[0][3] ), .CO(\u_div/CryTmp[0][4] ) );
  FA_X1 \u_div/u_fa_PartRem_0_0_2  ( .A(\u_div/PartRem[1][2] ), .B(n7), .CI(
        \u_div/CryTmp[0][2] ), .CO(\u_div/CryTmp[0][3] ) );
  FA_X1 \u_div/u_fa_PartRem_0_0_1  ( .A(\u_div/PartRem[1][1] ), .B(n8), .CI(
        \u_div/CryTmp[0][1] ), .CO(\u_div/CryTmp[0][2] ) );
  INV_X1 U1 ( .A(b[0]), .ZN(n9) );
  INV_X1 U2 ( .A(b[1]), .ZN(n8) );
  INV_X1 U3 ( .A(b[2]), .ZN(n7) );
  INV_X1 U4 ( .A(b[3]), .ZN(n6) );
  INV_X1 U5 ( .A(b[4]), .ZN(n5) );
  INV_X1 U6 ( .A(b[5]), .ZN(n4) );
  OR2_X1 U7 ( .A1(n9), .A2(a[7]), .ZN(\u_div/CryTmp[7][1] ) );
  XNOR2_X1 U8 ( .A(n9), .B(a[7]), .ZN(\u_div/SumTmp[7][0] ) );
  XNOR2_X1 U9 ( .A(n9), .B(a[6]), .ZN(\u_div/SumTmp[6][0] ) );
  XNOR2_X1 U10 ( .A(n9), .B(a[4]), .ZN(\u_div/SumTmp[4][0] ) );
  XNOR2_X1 U11 ( .A(n9), .B(a[3]), .ZN(\u_div/SumTmp[3][0] ) );
  XNOR2_X1 U12 ( .A(n9), .B(a[2]), .ZN(\u_div/SumTmp[2][0] ) );
  XNOR2_X1 U13 ( .A(n9), .B(a[5]), .ZN(\u_div/SumTmp[5][0] ) );
  OR2_X1 U14 ( .A1(n9), .A2(a[5]), .ZN(\u_div/CryTmp[5][1] ) );
  OR2_X1 U15 ( .A1(n9), .A2(a[4]), .ZN(\u_div/CryTmp[4][1] ) );
  OR2_X1 U16 ( .A1(n9), .A2(a[3]), .ZN(\u_div/CryTmp[3][1] ) );
  OR2_X1 U17 ( .A1(n9), .A2(a[2]), .ZN(\u_div/CryTmp[2][1] ) );
  OR2_X1 U18 ( .A1(n9), .A2(a[1]), .ZN(\u_div/CryTmp[1][1] ) );
  XNOR2_X1 U19 ( .A(n9), .B(a[1]), .ZN(\u_div/SumTmp[1][0] ) );
  OR2_X1 U20 ( .A1(n9), .A2(a[6]), .ZN(\u_div/CryTmp[6][1] ) );
  INV_X1 U21 ( .A(b[6]), .ZN(n3) );
  INV_X1 U22 ( .A(a[0]), .ZN(n1) );
  INV_X1 U23 ( .A(b[7]), .ZN(n2) );
  NAND2_X1 U24 ( .A1(b[0]), .A2(n1), .ZN(\u_div/CryTmp[0][1] ) );
  MUX2_X1 U25 ( .A(\u_div/PartRem[2][6] ), .B(\u_div/SumTmp[1][6] ), .S(
        quotient[1]), .Z(\u_div/PartRem[1][7] ) );
  MUX2_X1 U26 ( .A(\u_div/PartRem[3][5] ), .B(\u_div/SumTmp[2][5] ), .S(
        quotient[2]), .Z(\u_div/PartRem[2][6] ) );
  MUX2_X1 U27 ( .A(\u_div/PartRem[4][4] ), .B(\u_div/SumTmp[3][4] ), .S(
        quotient[3]), .Z(\u_div/PartRem[3][5] ) );
  MUX2_X1 U28 ( .A(\u_div/PartRem[5][3] ), .B(\u_div/SumTmp[4][3] ), .S(
        quotient[4]), .Z(\u_div/PartRem[4][4] ) );
  MUX2_X1 U29 ( .A(\u_div/PartRem[6][2] ), .B(\u_div/SumTmp[5][2] ), .S(
        quotient[5]), .Z(\u_div/PartRem[5][3] ) );
  MUX2_X1 U30 ( .A(\u_div/PartRem[7][1] ), .B(\u_div/SumTmp[6][1] ), .S(
        quotient[6]), .Z(\u_div/PartRem[6][2] ) );
  MUX2_X1 U31 ( .A(a[7]), .B(\u_div/SumTmp[7][0] ), .S(quotient[7]), .Z(
        \u_div/PartRem[7][1] ) );
  MUX2_X1 U32 ( .A(\u_div/PartRem[2][5] ), .B(\u_div/SumTmp[1][5] ), .S(
        quotient[1]), .Z(\u_div/PartRem[1][6] ) );
  MUX2_X1 U33 ( .A(\u_div/PartRem[3][4] ), .B(\u_div/SumTmp[2][4] ), .S(
        quotient[2]), .Z(\u_div/PartRem[2][5] ) );
  MUX2_X1 U34 ( .A(\u_div/PartRem[4][3] ), .B(\u_div/SumTmp[3][3] ), .S(
        quotient[3]), .Z(\u_div/PartRem[3][4] ) );
  MUX2_X1 U35 ( .A(\u_div/PartRem[5][2] ), .B(\u_div/SumTmp[4][2] ), .S(
        quotient[4]), .Z(\u_div/PartRem[4][3] ) );
  MUX2_X1 U36 ( .A(\u_div/PartRem[6][1] ), .B(\u_div/SumTmp[5][1] ), .S(
        quotient[5]), .Z(\u_div/PartRem[5][2] ) );
  MUX2_X1 U37 ( .A(a[6]), .B(\u_div/SumTmp[6][0] ), .S(quotient[6]), .Z(
        \u_div/PartRem[6][1] ) );
  MUX2_X1 U38 ( .A(\u_div/PartRem[2][4] ), .B(\u_div/SumTmp[1][4] ), .S(
        quotient[1]), .Z(\u_div/PartRem[1][5] ) );
  MUX2_X1 U39 ( .A(\u_div/PartRem[3][3] ), .B(\u_div/SumTmp[2][3] ), .S(
        quotient[2]), .Z(\u_div/PartRem[2][4] ) );
  MUX2_X1 U40 ( .A(\u_div/PartRem[4][2] ), .B(\u_div/SumTmp[3][2] ), .S(
        quotient[3]), .Z(\u_div/PartRem[3][3] ) );
  MUX2_X1 U41 ( .A(\u_div/PartRem[5][1] ), .B(\u_div/SumTmp[4][1] ), .S(
        quotient[4]), .Z(\u_div/PartRem[4][2] ) );
  MUX2_X1 U42 ( .A(a[5]), .B(\u_div/SumTmp[5][0] ), .S(quotient[5]), .Z(
        \u_div/PartRem[5][1] ) );
  MUX2_X1 U43 ( .A(\u_div/PartRem[2][3] ), .B(\u_div/SumTmp[1][3] ), .S(
        quotient[1]), .Z(\u_div/PartRem[1][4] ) );
  MUX2_X1 U44 ( .A(\u_div/PartRem[3][2] ), .B(\u_div/SumTmp[2][2] ), .S(
        quotient[2]), .Z(\u_div/PartRem[2][3] ) );
  MUX2_X1 U45 ( .A(\u_div/PartRem[4][1] ), .B(\u_div/SumTmp[3][1] ), .S(
        quotient[3]), .Z(\u_div/PartRem[3][2] ) );
  MUX2_X1 U46 ( .A(a[4]), .B(\u_div/SumTmp[4][0] ), .S(quotient[4]), .Z(
        \u_div/PartRem[4][1] ) );
  MUX2_X1 U47 ( .A(\u_div/PartRem[2][2] ), .B(\u_div/SumTmp[1][2] ), .S(
        quotient[1]), .Z(\u_div/PartRem[1][3] ) );
  MUX2_X1 U48 ( .A(\u_div/PartRem[3][1] ), .B(\u_div/SumTmp[2][1] ), .S(
        quotient[2]), .Z(\u_div/PartRem[2][2] ) );
  MUX2_X1 U49 ( .A(a[3]), .B(\u_div/SumTmp[3][0] ), .S(quotient[3]), .Z(
        \u_div/PartRem[3][1] ) );
  MUX2_X1 U50 ( .A(\u_div/PartRem[2][1] ), .B(\u_div/SumTmp[1][1] ), .S(
        quotient[1]), .Z(\u_div/PartRem[1][2] ) );
  MUX2_X1 U51 ( .A(a[2]), .B(\u_div/SumTmp[2][0] ), .S(quotient[2]), .Z(
        \u_div/PartRem[2][1] ) );
  MUX2_X1 U52 ( .A(a[1]), .B(\u_div/SumTmp[1][0] ), .S(quotient[1]), .Z(
        \u_div/PartRem[1][1] ) );
  AND4_X1 U53 ( .A1(\u_div/CryTmp[7][1] ), .A2(n10), .A3(n8), .A4(n7), .ZN(
        quotient[7]) );
  AND3_X1 U54 ( .A1(n10), .A2(n7), .A3(\u_div/CryTmp[6][2] ), .ZN(quotient[6])
         );
  AND2_X1 U55 ( .A1(\u_div/CryTmp[5][3] ), .A2(n10), .ZN(quotient[5]) );
  AND2_X1 U56 ( .A1(n11), .A2(n6), .ZN(n10) );
  AND2_X1 U57 ( .A1(\u_div/CryTmp[4][4] ), .A2(n11), .ZN(quotient[4]) );
  AND3_X1 U58 ( .A1(n5), .A2(n4), .A3(n12), .ZN(n11) );
  AND3_X1 U59 ( .A1(n12), .A2(n4), .A3(\u_div/CryTmp[3][5] ), .ZN(quotient[3])
         );
  AND2_X1 U60 ( .A1(\u_div/CryTmp[2][6] ), .A2(n12), .ZN(quotient[2]) );
  NOR2_X1 U61 ( .A1(b[6]), .A2(b[7]), .ZN(n12) );
  AND2_X1 U62 ( .A1(\u_div/CryTmp[1][7] ), .A2(n2), .ZN(quotient[1]) );
endmodule


module ALU_OpWidth8_FuncWidth4_DW01_sub_0 ( A, B, CI, DIFF, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] DIFF;
  input CI;
  output CO;
  wire   n1, n3, n4, n5, n6, n7, n8, n9, n10;
  wire   [9:0] carry;

  FA_X1 U2_7 ( .A(A[7]), .B(n3), .CI(carry[7]), .CO(carry[8]), .S(DIFF[7]) );
  FA_X1 U2_6 ( .A(A[6]), .B(n4), .CI(carry[6]), .CO(carry[7]), .S(DIFF[6]) );
  FA_X1 U2_5 ( .A(A[5]), .B(n5), .CI(carry[5]), .CO(carry[6]), .S(DIFF[5]) );
  FA_X1 U2_4 ( .A(A[4]), .B(n6), .CI(carry[4]), .CO(carry[5]), .S(DIFF[4]) );
  FA_X1 U2_3 ( .A(A[3]), .B(n7), .CI(carry[3]), .CO(carry[4]), .S(DIFF[3]) );
  FA_X1 U2_2 ( .A(A[2]), .B(n8), .CI(carry[2]), .CO(carry[3]), .S(DIFF[2]) );
  FA_X1 U2_1 ( .A(A[1]), .B(n9), .CI(carry[1]), .CO(carry[2]), .S(DIFF[1]) );
  INV_X1 U1 ( .A(carry[8]), .ZN(DIFF[8]) );
  XNOR2_X1 U2 ( .A(n10), .B(A[0]), .ZN(DIFF[0]) );
  INV_X1 U3 ( .A(B[0]), .ZN(n10) );
  INV_X1 U4 ( .A(B[7]), .ZN(n3) );
  INV_X1 U5 ( .A(B[6]), .ZN(n4) );
  INV_X1 U6 ( .A(B[2]), .ZN(n8) );
  INV_X1 U7 ( .A(B[3]), .ZN(n7) );
  INV_X1 U8 ( .A(B[4]), .ZN(n6) );
  INV_X1 U9 ( .A(B[5]), .ZN(n5) );
  INV_X1 U10 ( .A(B[1]), .ZN(n9) );
  INV_X1 U11 ( .A(A[0]), .ZN(n1) );
  NAND2_X1 U12 ( .A1(B[0]), .A2(n1), .ZN(carry[1]) );
endmodule


module ALU_OpWidth8_FuncWidth4_DW01_add_0 ( A, B, CI, SUM, CO );
  input [8:0] A;
  input [8:0] B;
  output [8:0] SUM;
  input CI;
  output CO;
  wire   n1;
  wire   [8:1] carry;

  FA_X1 U1_7 ( .A(A[7]), .B(B[7]), .CI(carry[7]), .CO(SUM[8]), .S(SUM[7]) );
  FA_X1 U1_6 ( .A(A[6]), .B(B[6]), .CI(carry[6]), .CO(carry[7]), .S(SUM[6]) );
  FA_X1 U1_5 ( .A(A[5]), .B(B[5]), .CI(carry[5]), .CO(carry[6]), .S(SUM[5]) );
  FA_X1 U1_4 ( .A(A[4]), .B(B[4]), .CI(carry[4]), .CO(carry[5]), .S(SUM[4]) );
  FA_X1 U1_3 ( .A(A[3]), .B(B[3]), .CI(carry[3]), .CO(carry[4]), .S(SUM[3]) );
  FA_X1 U1_2 ( .A(A[2]), .B(B[2]), .CI(carry[2]), .CO(carry[3]), .S(SUM[2]) );
  FA_X1 U1_1 ( .A(A[1]), .B(B[1]), .CI(n1), .CO(carry[2]), .S(SUM[1]) );
  AND2_X1 U1 ( .A1(B[0]), .A2(A[0]), .ZN(n1) );
  XOR2_X1 U2 ( .A(B[0]), .B(A[0]), .Z(SUM[0]) );
endmodule


module ALU_OpWidth8_FuncWidth4_DW01_add_1 ( A, B, CI, SUM, CO );
  input [13:0] A;
  input [13:0] B;
  output [13:0] SUM;
  input CI;
  output CO;
  wire   \A[5] , \A[4] , \A[3] , \A[2] , \A[1] , \A[0] , n1, n2, n3, n4, n5,
         n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n24, n25, n26;
  assign SUM[6] = A[6];
  assign SUM[5] = \A[5] ;
  assign \A[5]  = A[5];
  assign SUM[4] = \A[4] ;
  assign \A[4]  = A[4];
  assign SUM[3] = \A[3] ;
  assign \A[3]  = A[3];
  assign SUM[2] = \A[2] ;
  assign \A[2]  = A[2];
  assign SUM[1] = \A[1] ;
  assign \A[1]  = A[1];
  assign SUM[0] = \A[0] ;
  assign \A[0]  = A[0];

  INV_X1 U2 ( .A(n9), .ZN(n4) );
  INV_X1 U3 ( .A(n20), .ZN(n2) );
  INV_X1 U4 ( .A(n22), .ZN(n3) );
  INV_X1 U5 ( .A(n12), .ZN(n5) );
  INV_X1 U6 ( .A(n14), .ZN(n1) );
  NAND2_X1 U7 ( .A1(A[7]), .A2(B[7]), .ZN(n26) );
  XOR2_X1 U8 ( .A(n6), .B(n7), .Z(SUM[9]) );
  NOR2_X1 U9 ( .A1(n8), .A2(n9), .ZN(n7) );
  XOR2_X1 U10 ( .A(n10), .B(n26), .Z(SUM[8]) );
  NAND2_X1 U11 ( .A1(n5), .A2(n11), .ZN(n10) );
  XOR2_X1 U12 ( .A(B[7]), .B(A[7]), .Z(SUM[7]) );
  XOR2_X1 U13 ( .A(n13), .B(B[13]), .Z(SUM[13]) );
  OAI21_X1 U14 ( .B1(n14), .B2(n15), .A(n16), .ZN(n13) );
  XOR2_X1 U15 ( .A(n17), .B(n15), .Z(SUM[12]) );
  AOI21_X1 U16 ( .B1(n2), .B2(n18), .A(n19), .ZN(n15) );
  NAND2_X1 U17 ( .A1(n1), .A2(n16), .ZN(n17) );
  NAND2_X1 U18 ( .A1(B[12]), .A2(A[12]), .ZN(n16) );
  NOR2_X1 U19 ( .A1(B[12]), .A2(A[12]), .ZN(n14) );
  XOR2_X1 U20 ( .A(n18), .B(n21), .Z(SUM[11]) );
  NOR2_X1 U21 ( .A1(n19), .A2(n20), .ZN(n21) );
  NOR2_X1 U22 ( .A1(B[11]), .A2(A[11]), .ZN(n20) );
  AND2_X1 U23 ( .A1(B[11]), .A2(A[11]), .ZN(n19) );
  OAI21_X1 U24 ( .B1(n22), .B2(n23), .A(n24), .ZN(n18) );
  XOR2_X1 U25 ( .A(n25), .B(n23), .Z(SUM[10]) );
  AOI21_X1 U26 ( .B1(n6), .B2(n4), .A(n8), .ZN(n23) );
  AND2_X1 U27 ( .A1(B[9]), .A2(A[9]), .ZN(n8) );
  NOR2_X1 U28 ( .A1(B[9]), .A2(A[9]), .ZN(n9) );
  OAI21_X1 U29 ( .B1(n26), .B2(n12), .A(n11), .ZN(n6) );
  NAND2_X1 U30 ( .A1(B[8]), .A2(A[8]), .ZN(n11) );
  NOR2_X1 U31 ( .A1(B[8]), .A2(A[8]), .ZN(n12) );
  NAND2_X1 U32 ( .A1(n3), .A2(n24), .ZN(n25) );
  NAND2_X1 U33 ( .A1(B[10]), .A2(A[10]), .ZN(n24) );
  NOR2_X1 U34 ( .A1(B[10]), .A2(A[10]), .ZN(n22) );
endmodule


module ALU_OpWidth8_FuncWidth4_DW02_mult_0 ( A, B, TC, PRODUCT );
  input [7:0] A;
  input [7:0] B;
  output [15:0] PRODUCT;
  input TC;
  wire   \ab[7][7] , \ab[7][6] , \ab[7][5] , \ab[7][4] , \ab[7][3] ,
         \ab[7][2] , \ab[7][1] , \ab[7][0] , \ab[6][7] , \ab[6][6] ,
         \ab[6][5] , \ab[6][4] , \ab[6][3] , \ab[6][2] , \ab[6][1] ,
         \ab[6][0] , \ab[5][7] , \ab[5][6] , \ab[5][5] , \ab[5][4] ,
         \ab[5][3] , \ab[5][2] , \ab[5][1] , \ab[5][0] , \ab[4][7] ,
         \ab[4][6] , \ab[4][5] , \ab[4][4] , \ab[4][3] , \ab[4][2] ,
         \ab[4][1] , \ab[4][0] , \ab[3][7] , \ab[3][6] , \ab[3][5] ,
         \ab[3][4] , \ab[3][3] , \ab[3][2] , \ab[3][1] , \ab[3][0] ,
         \ab[2][7] , \ab[2][6] , \ab[2][5] , \ab[2][4] , \ab[2][3] ,
         \ab[2][2] , \ab[2][1] , \ab[2][0] , \ab[1][7] , \ab[1][6] ,
         \ab[1][5] , \ab[1][4] , \ab[1][3] , \ab[1][2] , \ab[1][1] ,
         \ab[1][0] , \ab[0][7] , \ab[0][6] , \ab[0][5] , \ab[0][4] ,
         \ab[0][3] , \ab[0][2] , \ab[0][1] , \CARRYB[7][6] , \CARRYB[7][5] ,
         \CARRYB[7][4] , \CARRYB[7][3] , \CARRYB[7][2] , \CARRYB[7][1] ,
         \CARRYB[7][0] , \CARRYB[6][6] , \CARRYB[6][5] , \CARRYB[6][4] ,
         \CARRYB[6][3] , \CARRYB[6][2] , \CARRYB[6][1] , \CARRYB[6][0] ,
         \CARRYB[5][6] , \CARRYB[5][5] , \CARRYB[5][4] , \CARRYB[5][3] ,
         \CARRYB[5][2] , \CARRYB[5][1] , \CARRYB[5][0] , \CARRYB[4][6] ,
         \CARRYB[4][5] , \CARRYB[4][4] , \CARRYB[4][3] , \CARRYB[4][2] ,
         \CARRYB[4][1] , \CARRYB[4][0] , \CARRYB[3][6] , \CARRYB[3][5] ,
         \CARRYB[3][4] , \CARRYB[3][3] , \CARRYB[3][2] , \CARRYB[3][1] ,
         \CARRYB[3][0] , \CARRYB[2][6] , \CARRYB[2][5] , \CARRYB[2][4] ,
         \CARRYB[2][3] , \CARRYB[2][2] , \CARRYB[2][1] , \CARRYB[2][0] ,
         \SUMB[7][6] , \SUMB[7][5] , \SUMB[7][4] , \SUMB[7][3] , \SUMB[7][2] ,
         \SUMB[7][1] , \SUMB[7][0] , \SUMB[6][6] , \SUMB[6][5] , \SUMB[6][4] ,
         \SUMB[6][3] , \SUMB[6][2] , \SUMB[6][1] , \SUMB[5][6] , \SUMB[5][5] ,
         \SUMB[5][4] , \SUMB[5][3] , \SUMB[5][2] , \SUMB[5][1] , \SUMB[4][6] ,
         \SUMB[4][5] , \SUMB[4][4] , \SUMB[4][3] , \SUMB[4][2] , \SUMB[4][1] ,
         \SUMB[3][6] , \SUMB[3][5] , \SUMB[3][4] , \SUMB[3][3] , \SUMB[3][2] ,
         \SUMB[3][1] , \SUMB[2][6] , \SUMB[2][5] , \SUMB[2][4] , \SUMB[2][3] ,
         \SUMB[2][2] , \SUMB[2][1] , \A1[4] , \A1[3] , \A1[2] , \A1[1] ,
         \A1[0] , n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15,
         n16, n18, n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30,
         n31, n32, n33, n34, n35, n36, n37, n38, n39, n40, n41, n42, n43, n44,
         n45, n46;

  FA_X1 S4_0 ( .A(\ab[7][0] ), .B(\CARRYB[6][0] ), .CI(\SUMB[6][1] ), .CO(
        \CARRYB[7][0] ), .S(\SUMB[7][0] ) );
  FA_X1 S4_1 ( .A(\ab[7][1] ), .B(\CARRYB[6][1] ), .CI(\SUMB[6][2] ), .CO(
        \CARRYB[7][1] ), .S(\SUMB[7][1] ) );
  FA_X1 S4_2 ( .A(\ab[7][2] ), .B(\CARRYB[6][2] ), .CI(\SUMB[6][3] ), .CO(
        \CARRYB[7][2] ), .S(\SUMB[7][2] ) );
  FA_X1 S4_3 ( .A(\ab[7][3] ), .B(\CARRYB[6][3] ), .CI(\SUMB[6][4] ), .CO(
        \CARRYB[7][3] ), .S(\SUMB[7][3] ) );
  FA_X1 S4_4 ( .A(\ab[7][4] ), .B(\CARRYB[6][4] ), .CI(\SUMB[6][5] ), .CO(
        \CARRYB[7][4] ), .S(\SUMB[7][4] ) );
  FA_X1 S4_5 ( .A(\ab[7][5] ), .B(\CARRYB[6][5] ), .CI(\SUMB[6][6] ), .CO(
        \CARRYB[7][5] ), .S(\SUMB[7][5] ) );
  FA_X1 S5_6 ( .A(\ab[7][6] ), .B(\CARRYB[6][6] ), .CI(\ab[6][7] ), .CO(
        \CARRYB[7][6] ), .S(\SUMB[7][6] ) );
  FA_X1 S1_6_0 ( .A(\ab[6][0] ), .B(\CARRYB[5][0] ), .CI(\SUMB[5][1] ), .CO(
        \CARRYB[6][0] ), .S(\A1[4] ) );
  FA_X1 S2_6_1 ( .A(\ab[6][1] ), .B(\CARRYB[5][1] ), .CI(\SUMB[5][2] ), .CO(
        \CARRYB[6][1] ), .S(\SUMB[6][1] ) );
  FA_X1 S2_6_2 ( .A(\ab[6][2] ), .B(\CARRYB[5][2] ), .CI(\SUMB[5][3] ), .CO(
        \CARRYB[6][2] ), .S(\SUMB[6][2] ) );
  FA_X1 S2_6_3 ( .A(\ab[6][3] ), .B(\CARRYB[5][3] ), .CI(\SUMB[5][4] ), .CO(
        \CARRYB[6][3] ), .S(\SUMB[6][3] ) );
  FA_X1 S2_6_4 ( .A(\ab[6][4] ), .B(\CARRYB[5][4] ), .CI(\SUMB[5][5] ), .CO(
        \CARRYB[6][4] ), .S(\SUMB[6][4] ) );
  FA_X1 S2_6_5 ( .A(\ab[6][5] ), .B(\CARRYB[5][5] ), .CI(\SUMB[5][6] ), .CO(
        \CARRYB[6][5] ), .S(\SUMB[6][5] ) );
  FA_X1 S3_6_6 ( .A(\ab[6][6] ), .B(\CARRYB[5][6] ), .CI(\ab[5][7] ), .CO(
        \CARRYB[6][6] ), .S(\SUMB[6][6] ) );
  FA_X1 S1_5_0 ( .A(\ab[5][0] ), .B(\CARRYB[4][0] ), .CI(\SUMB[4][1] ), .CO(
        \CARRYB[5][0] ), .S(\A1[3] ) );
  FA_X1 S2_5_1 ( .A(\ab[5][1] ), .B(\CARRYB[4][1] ), .CI(\SUMB[4][2] ), .CO(
        \CARRYB[5][1] ), .S(\SUMB[5][1] ) );
  FA_X1 S2_5_2 ( .A(\ab[5][2] ), .B(\CARRYB[4][2] ), .CI(\SUMB[4][3] ), .CO(
        \CARRYB[5][2] ), .S(\SUMB[5][2] ) );
  FA_X1 S2_5_3 ( .A(\ab[5][3] ), .B(\CARRYB[4][3] ), .CI(\SUMB[4][4] ), .CO(
        \CARRYB[5][3] ), .S(\SUMB[5][3] ) );
  FA_X1 S2_5_4 ( .A(\ab[5][4] ), .B(\CARRYB[4][4] ), .CI(\SUMB[4][5] ), .CO(
        \CARRYB[5][4] ), .S(\SUMB[5][4] ) );
  FA_X1 S2_5_5 ( .A(\ab[5][5] ), .B(\CARRYB[4][5] ), .CI(\SUMB[4][6] ), .CO(
        \CARRYB[5][5] ), .S(\SUMB[5][5] ) );
  FA_X1 S3_5_6 ( .A(\ab[5][6] ), .B(\CARRYB[4][6] ), .CI(\ab[4][7] ), .CO(
        \CARRYB[5][6] ), .S(\SUMB[5][6] ) );
  FA_X1 S1_4_0 ( .A(\ab[4][0] ), .B(\CARRYB[3][0] ), .CI(\SUMB[3][1] ), .CO(
        \CARRYB[4][0] ), .S(\A1[2] ) );
  FA_X1 S2_4_1 ( .A(\ab[4][1] ), .B(\CARRYB[3][1] ), .CI(\SUMB[3][2] ), .CO(
        \CARRYB[4][1] ), .S(\SUMB[4][1] ) );
  FA_X1 S2_4_2 ( .A(\ab[4][2] ), .B(\CARRYB[3][2] ), .CI(\SUMB[3][3] ), .CO(
        \CARRYB[4][2] ), .S(\SUMB[4][2] ) );
  FA_X1 S2_4_3 ( .A(\ab[4][3] ), .B(\CARRYB[3][3] ), .CI(\SUMB[3][4] ), .CO(
        \CARRYB[4][3] ), .S(\SUMB[4][3] ) );
  FA_X1 S2_4_4 ( .A(\ab[4][4] ), .B(\CARRYB[3][4] ), .CI(\SUMB[3][5] ), .CO(
        \CARRYB[4][4] ), .S(\SUMB[4][4] ) );
  FA_X1 S2_4_5 ( .A(\ab[4][5] ), .B(\CARRYB[3][5] ), .CI(\SUMB[3][6] ), .CO(
        \CARRYB[4][5] ), .S(\SUMB[4][5] ) );
  FA_X1 S3_4_6 ( .A(\ab[4][6] ), .B(\CARRYB[3][6] ), .CI(\ab[3][7] ), .CO(
        \CARRYB[4][6] ), .S(\SUMB[4][6] ) );
  FA_X1 S1_3_0 ( .A(\ab[3][0] ), .B(\CARRYB[2][0] ), .CI(\SUMB[2][1] ), .CO(
        \CARRYB[3][0] ), .S(\A1[1] ) );
  FA_X1 S2_3_1 ( .A(\ab[3][1] ), .B(\CARRYB[2][1] ), .CI(\SUMB[2][2] ), .CO(
        \CARRYB[3][1] ), .S(\SUMB[3][1] ) );
  FA_X1 S2_3_2 ( .A(\ab[3][2] ), .B(\CARRYB[2][2] ), .CI(\SUMB[2][3] ), .CO(
        \CARRYB[3][2] ), .S(\SUMB[3][2] ) );
  FA_X1 S2_3_3 ( .A(\ab[3][3] ), .B(\CARRYB[2][3] ), .CI(\SUMB[2][4] ), .CO(
        \CARRYB[3][3] ), .S(\SUMB[3][3] ) );
  FA_X1 S2_3_4 ( .A(\ab[3][4] ), .B(\CARRYB[2][4] ), .CI(\SUMB[2][5] ), .CO(
        \CARRYB[3][4] ), .S(\SUMB[3][4] ) );
  FA_X1 S2_3_5 ( .A(\ab[3][5] ), .B(\CARRYB[2][5] ), .CI(\SUMB[2][6] ), .CO(
        \CARRYB[3][5] ), .S(\SUMB[3][5] ) );
  FA_X1 S3_3_6 ( .A(\ab[3][6] ), .B(\CARRYB[2][6] ), .CI(\ab[2][7] ), .CO(
        \CARRYB[3][6] ), .S(\SUMB[3][6] ) );
  FA_X1 S1_2_0 ( .A(\ab[2][0] ), .B(n15), .CI(n8), .CO(\CARRYB[2][0] ), .S(
        \A1[0] ) );
  FA_X1 S2_2_1 ( .A(\ab[2][1] ), .B(n3), .CI(n14), .CO(\CARRYB[2][1] ), .S(
        \SUMB[2][1] ) );
  FA_X1 S2_2_2 ( .A(\ab[2][2] ), .B(n6), .CI(n12), .CO(\CARRYB[2][2] ), .S(
        \SUMB[2][2] ) );
  FA_X1 S2_2_3 ( .A(\ab[2][3] ), .B(n4), .CI(n13), .CO(\CARRYB[2][3] ), .S(
        \SUMB[2][3] ) );
  FA_X1 S2_2_4 ( .A(\ab[2][4] ), .B(n5), .CI(n11), .CO(\CARRYB[2][4] ), .S(
        \SUMB[2][4] ) );
  FA_X1 S2_2_5 ( .A(\ab[2][5] ), .B(n7), .CI(n10), .CO(\CARRYB[2][5] ), .S(
        \SUMB[2][5] ) );
  FA_X1 S3_2_6 ( .A(\ab[2][6] ), .B(n9), .CI(\ab[1][7] ), .CO(\CARRYB[2][6] ), 
        .S(\SUMB[2][6] ) );
  ALU_OpWidth8_FuncWidth4_DW01_add_1 FS_1 ( .A({1'b0, n29, n26, n22, n25, n21, 
        n19, n18, \SUMB[7][0] , \A1[4] , \A1[3] , \A1[2] , \A1[1] , \A1[0] }), 
        .B({n16, n30, n28, n24, n27, n23, n20, 1'b0, 1'b0, 1'b0, 1'b0, 1'b0, 
        1'b0, 1'b0}), .CI(1'b0), .SUM(PRODUCT[15:2]) );
  AND2_X1 U2 ( .A1(\ab[0][2] ), .A2(\ab[1][1] ), .ZN(n3) );
  AND2_X1 U3 ( .A1(\ab[0][4] ), .A2(\ab[1][3] ), .ZN(n4) );
  AND2_X1 U4 ( .A1(\ab[0][5] ), .A2(\ab[1][4] ), .ZN(n5) );
  AND2_X1 U5 ( .A1(\ab[0][3] ), .A2(\ab[1][2] ), .ZN(n6) );
  AND2_X1 U6 ( .A1(\ab[0][6] ), .A2(\ab[1][5] ), .ZN(n7) );
  XOR2_X1 U7 ( .A(\ab[1][1] ), .B(\ab[0][2] ), .Z(n8) );
  AND2_X1 U8 ( .A1(\ab[0][7] ), .A2(\ab[1][6] ), .ZN(n9) );
  XOR2_X1 U9 ( .A(\ab[1][6] ), .B(\ab[0][7] ), .Z(n10) );
  XOR2_X1 U10 ( .A(\ab[1][5] ), .B(\ab[0][6] ), .Z(n11) );
  XOR2_X1 U11 ( .A(\ab[1][3] ), .B(\ab[0][4] ), .Z(n12) );
  XOR2_X1 U12 ( .A(\ab[1][4] ), .B(\ab[0][5] ), .Z(n13) );
  XOR2_X1 U13 ( .A(\ab[1][2] ), .B(\ab[0][3] ), .Z(n14) );
  AND2_X1 U14 ( .A1(\ab[0][1] ), .A2(\ab[1][0] ), .ZN(n15) );
  AND2_X1 U15 ( .A1(\CARRYB[7][6] ), .A2(\ab[7][7] ), .ZN(n16) );
  XOR2_X1 U16 ( .A(\ab[1][0] ), .B(\ab[0][1] ), .Z(PRODUCT[1]) );
  XOR2_X1 U17 ( .A(\CARRYB[7][0] ), .B(\SUMB[7][1] ), .Z(n18) );
  XOR2_X1 U18 ( .A(\CARRYB[7][1] ), .B(\SUMB[7][2] ), .Z(n19) );
  AND2_X1 U19 ( .A1(\CARRYB[7][0] ), .A2(\SUMB[7][1] ), .ZN(n20) );
  XOR2_X1 U20 ( .A(\CARRYB[7][2] ), .B(\SUMB[7][3] ), .Z(n21) );
  XOR2_X1 U21 ( .A(\CARRYB[7][4] ), .B(\SUMB[7][5] ), .Z(n22) );
  AND2_X1 U22 ( .A1(\CARRYB[7][1] ), .A2(\SUMB[7][2] ), .ZN(n23) );
  AND2_X1 U23 ( .A1(\CARRYB[7][3] ), .A2(\SUMB[7][4] ), .ZN(n24) );
  XOR2_X1 U24 ( .A(\CARRYB[7][3] ), .B(\SUMB[7][4] ), .Z(n25) );
  XOR2_X1 U25 ( .A(\CARRYB[7][5] ), .B(\SUMB[7][6] ), .Z(n26) );
  AND2_X1 U26 ( .A1(\CARRYB[7][2] ), .A2(\SUMB[7][3] ), .ZN(n27) );
  AND2_X1 U27 ( .A1(\CARRYB[7][4] ), .A2(\SUMB[7][5] ), .ZN(n28) );
  XOR2_X1 U28 ( .A(\CARRYB[7][6] ), .B(\ab[7][7] ), .Z(n29) );
  AND2_X1 U29 ( .A1(\CARRYB[7][5] ), .A2(\SUMB[7][6] ), .ZN(n30) );
  INV_X1 U30 ( .A(A[1]), .ZN(n45) );
  INV_X1 U31 ( .A(A[2]), .ZN(n44) );
  INV_X1 U32 ( .A(A[3]), .ZN(n43) );
  INV_X1 U33 ( .A(A[0]), .ZN(n46) );
  INV_X1 U34 ( .A(B[0]), .ZN(n38) );
  INV_X1 U35 ( .A(B[6]), .ZN(n32) );
  INV_X1 U36 ( .A(B[1]), .ZN(n37) );
  INV_X1 U37 ( .A(B[7]), .ZN(n31) );
  INV_X1 U38 ( .A(B[3]), .ZN(n35) );
  INV_X1 U39 ( .A(B[5]), .ZN(n33) );
  INV_X1 U40 ( .A(B[2]), .ZN(n36) );
  INV_X1 U41 ( .A(B[4]), .ZN(n34) );
  INV_X1 U42 ( .A(A[7]), .ZN(n39) );
  INV_X1 U43 ( .A(A[6]), .ZN(n40) );
  INV_X1 U44 ( .A(A[4]), .ZN(n42) );
  INV_X1 U45 ( .A(A[5]), .ZN(n41) );
  NOR2_X1 U47 ( .A1(n39), .A2(n31), .ZN(\ab[7][7] ) );
  NOR2_X1 U48 ( .A1(n39), .A2(n32), .ZN(\ab[7][6] ) );
  NOR2_X1 U49 ( .A1(n39), .A2(n33), .ZN(\ab[7][5] ) );
  NOR2_X1 U50 ( .A1(n39), .A2(n34), .ZN(\ab[7][4] ) );
  NOR2_X1 U51 ( .A1(n39), .A2(n35), .ZN(\ab[7][3] ) );
  NOR2_X1 U52 ( .A1(n39), .A2(n36), .ZN(\ab[7][2] ) );
  NOR2_X1 U53 ( .A1(n39), .A2(n37), .ZN(\ab[7][1] ) );
  NOR2_X1 U54 ( .A1(n39), .A2(n38), .ZN(\ab[7][0] ) );
  NOR2_X1 U55 ( .A1(n31), .A2(n40), .ZN(\ab[6][7] ) );
  NOR2_X1 U56 ( .A1(n32), .A2(n40), .ZN(\ab[6][6] ) );
  NOR2_X1 U57 ( .A1(n33), .A2(n40), .ZN(\ab[6][5] ) );
  NOR2_X1 U58 ( .A1(n34), .A2(n40), .ZN(\ab[6][4] ) );
  NOR2_X1 U59 ( .A1(n35), .A2(n40), .ZN(\ab[6][3] ) );
  NOR2_X1 U60 ( .A1(n36), .A2(n40), .ZN(\ab[6][2] ) );
  NOR2_X1 U61 ( .A1(n37), .A2(n40), .ZN(\ab[6][1] ) );
  NOR2_X1 U62 ( .A1(n38), .A2(n40), .ZN(\ab[6][0] ) );
  NOR2_X1 U63 ( .A1(n31), .A2(n41), .ZN(\ab[5][7] ) );
  NOR2_X1 U64 ( .A1(n32), .A2(n41), .ZN(\ab[5][6] ) );
  NOR2_X1 U65 ( .A1(n33), .A2(n41), .ZN(\ab[5][5] ) );
  NOR2_X1 U66 ( .A1(n34), .A2(n41), .ZN(\ab[5][4] ) );
  NOR2_X1 U67 ( .A1(n35), .A2(n41), .ZN(\ab[5][3] ) );
  NOR2_X1 U68 ( .A1(n36), .A2(n41), .ZN(\ab[5][2] ) );
  NOR2_X1 U69 ( .A1(n37), .A2(n41), .ZN(\ab[5][1] ) );
  NOR2_X1 U70 ( .A1(n38), .A2(n41), .ZN(\ab[5][0] ) );
  NOR2_X1 U71 ( .A1(n31), .A2(n42), .ZN(\ab[4][7] ) );
  NOR2_X1 U72 ( .A1(n32), .A2(n42), .ZN(\ab[4][6] ) );
  NOR2_X1 U73 ( .A1(n33), .A2(n42), .ZN(\ab[4][5] ) );
  NOR2_X1 U74 ( .A1(n34), .A2(n42), .ZN(\ab[4][4] ) );
  NOR2_X1 U75 ( .A1(n35), .A2(n42), .ZN(\ab[4][3] ) );
  NOR2_X1 U76 ( .A1(n36), .A2(n42), .ZN(\ab[4][2] ) );
  NOR2_X1 U77 ( .A1(n37), .A2(n42), .ZN(\ab[4][1] ) );
  NOR2_X1 U78 ( .A1(n38), .A2(n42), .ZN(\ab[4][0] ) );
  NOR2_X1 U79 ( .A1(n31), .A2(n43), .ZN(\ab[3][7] ) );
  NOR2_X1 U80 ( .A1(n32), .A2(n43), .ZN(\ab[3][6] ) );
  NOR2_X1 U81 ( .A1(n33), .A2(n43), .ZN(\ab[3][5] ) );
  NOR2_X1 U82 ( .A1(n34), .A2(n43), .ZN(\ab[3][4] ) );
  NOR2_X1 U83 ( .A1(n35), .A2(n43), .ZN(\ab[3][3] ) );
  NOR2_X1 U84 ( .A1(n36), .A2(n43), .ZN(\ab[3][2] ) );
  NOR2_X1 U85 ( .A1(n37), .A2(n43), .ZN(\ab[3][1] ) );
  NOR2_X1 U86 ( .A1(n38), .A2(n43), .ZN(\ab[3][0] ) );
  NOR2_X1 U87 ( .A1(n31), .A2(n44), .ZN(\ab[2][7] ) );
  NOR2_X1 U88 ( .A1(n32), .A2(n44), .ZN(\ab[2][6] ) );
  NOR2_X1 U89 ( .A1(n33), .A2(n44), .ZN(\ab[2][5] ) );
  NOR2_X1 U90 ( .A1(n34), .A2(n44), .ZN(\ab[2][4] ) );
  NOR2_X1 U91 ( .A1(n35), .A2(n44), .ZN(\ab[2][3] ) );
  NOR2_X1 U92 ( .A1(n36), .A2(n44), .ZN(\ab[2][2] ) );
  NOR2_X1 U93 ( .A1(n37), .A2(n44), .ZN(\ab[2][1] ) );
  NOR2_X1 U94 ( .A1(n38), .A2(n44), .ZN(\ab[2][0] ) );
  NOR2_X1 U95 ( .A1(n31), .A2(n45), .ZN(\ab[1][7] ) );
  NOR2_X1 U96 ( .A1(n32), .A2(n45), .ZN(\ab[1][6] ) );
  NOR2_X1 U97 ( .A1(n33), .A2(n45), .ZN(\ab[1][5] ) );
  NOR2_X1 U98 ( .A1(n34), .A2(n45), .ZN(\ab[1][4] ) );
  NOR2_X1 U99 ( .A1(n35), .A2(n45), .ZN(\ab[1][3] ) );
  NOR2_X1 U100 ( .A1(n36), .A2(n45), .ZN(\ab[1][2] ) );
  NOR2_X1 U101 ( .A1(n37), .A2(n45), .ZN(\ab[1][1] ) );
  NOR2_X1 U102 ( .A1(n38), .A2(n45), .ZN(\ab[1][0] ) );
  NOR2_X1 U103 ( .A1(n31), .A2(n46), .ZN(\ab[0][7] ) );
  NOR2_X1 U104 ( .A1(n32), .A2(n46), .ZN(\ab[0][6] ) );
  NOR2_X1 U105 ( .A1(n33), .A2(n46), .ZN(\ab[0][5] ) );
  NOR2_X1 U106 ( .A1(n34), .A2(n46), .ZN(\ab[0][4] ) );
  NOR2_X1 U107 ( .A1(n35), .A2(n46), .ZN(\ab[0][3] ) );
  NOR2_X1 U108 ( .A1(n36), .A2(n46), .ZN(\ab[0][2] ) );
  NOR2_X1 U109 ( .A1(n37), .A2(n46), .ZN(\ab[0][1] ) );
  NOR2_X1 U110 ( .A1(n38), .A2(n46), .ZN(PRODUCT[0]) );
endmodule


module ALU_OpWidth8_FuncWidth4 ( CLK, RST, Enable, A, B, ALU_FUN, ALU_OUT, 
        OUT_VALID );
  input [7:0] A;
  input [7:0] B;
  input [3:0] ALU_FUN;
  output [15:0] ALU_OUT;
  input CLK, RST, Enable;
  output OUT_VALID;
  wire   N88, N89, N90, N91, N92, N93, N94, N95, N96, N97, N98, N99, N100,
         N101, N102, N103, N104, N105, N106, N107, N108, N109, N110, N111,
         N112, N113, N114, N115, N116, N117, N118, N119, N120, N121, N122,
         N123, N124, N125, N126, N127, N128, N129, N162, N163, N181, N182,
         N183, N184, N185, N186, N187, N188, N189, N190, N191, N192, N193,
         N194, N195, N196, N197, n40, n41, n42, n43, n44, n45, n46, n47, n48,
         n49, n50, n51, n52, n53, n54, n55, n56, n57, n58, n59, n60, n61, n62,
         n63, n64, n65, n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76,
         n77, n78, n79, n80, n81, n82, n83, n84, n85, n86, n87, n88, n89, n90,
         n91, n92, n93, n94, n95, n96, n97, n98, n99, n100, n101, n102, n103,
         n104, n105, n106, n107, n108, n109, n110, n111, n112, n113, n114,
         n115, n116, n117, n118, n119, n3, n4, n5, n6, n7, n8, n9, n10, n11,
         n12, n13, n14, n15, n16, n17, n18, n19, n20, n21, n22, n23, n24, n25,
         n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n37, n38, n39,
         n120, n121, n122, n123, n124, n125, n126, n127, n128, n129, n130,
         n131, n132, n133;

  DFFR_X1 \ALU_OUT_reg[15]  ( .D(N196), .CK(CLK), .RN(n3), .Q(ALU_OUT[15]) );
  DFFR_X1 \ALU_OUT_reg[14]  ( .D(N195), .CK(CLK), .RN(n3), .Q(ALU_OUT[14]) );
  DFFR_X1 \ALU_OUT_reg[13]  ( .D(N194), .CK(CLK), .RN(n3), .Q(ALU_OUT[13]) );
  DFFR_X1 \ALU_OUT_reg[12]  ( .D(N193), .CK(CLK), .RN(n3), .Q(ALU_OUT[12]) );
  DFFR_X1 \ALU_OUT_reg[11]  ( .D(N192), .CK(CLK), .RN(n3), .Q(ALU_OUT[11]) );
  DFFR_X1 \ALU_OUT_reg[10]  ( .D(N191), .CK(CLK), .RN(n3), .Q(ALU_OUT[10]) );
  DFFR_X1 \ALU_OUT_reg[9]  ( .D(N190), .CK(CLK), .RN(n3), .Q(ALU_OUT[9]) );
  DFFR_X1 \ALU_OUT_reg[8]  ( .D(N189), .CK(CLK), .RN(n3), .Q(ALU_OUT[8]) );
  DFFR_X1 \ALU_OUT_reg[7]  ( .D(N188), .CK(CLK), .RN(n3), .Q(ALU_OUT[7]) );
  DFFR_X1 \ALU_OUT_reg[6]  ( .D(N187), .CK(CLK), .RN(n3), .Q(ALU_OUT[6]) );
  DFFR_X1 \ALU_OUT_reg[5]  ( .D(N186), .CK(CLK), .RN(n3), .Q(ALU_OUT[5]) );
  DFFR_X1 \ALU_OUT_reg[4]  ( .D(N185), .CK(CLK), .RN(n3), .Q(ALU_OUT[4]) );
  DFFR_X1 \ALU_OUT_reg[3]  ( .D(N184), .CK(CLK), .RN(n4), .Q(ALU_OUT[3]) );
  DFFR_X1 \ALU_OUT_reg[2]  ( .D(N183), .CK(CLK), .RN(n4), .Q(ALU_OUT[2]) );
  DFFR_X1 \ALU_OUT_reg[1]  ( .D(N182), .CK(CLK), .RN(n4), .Q(ALU_OUT[1]) );
  DFFR_X1 \ALU_OUT_reg[0]  ( .D(N181), .CK(CLK), .RN(n4), .Q(ALU_OUT[0]) );
  DFFR_X1 OUT_VALID_reg ( .D(N197), .CK(CLK), .RN(n4), .Q(OUT_VALID) );
  NOR3_X2 U82 ( .A1(ALU_FUN[2]), .A2(ALU_FUN[3]), .A3(n118), .ZN(n54) );
  NOR3_X2 U83 ( .A1(ALU_FUN[2]), .A2(ALU_FUN[3]), .A3(n105), .ZN(n56) );
  NAND2_X1 U115 ( .A1(n41), .A2(n42), .ZN(N196) );
  NAND2_X1 U116 ( .A1(N121), .A2(n43), .ZN(n42) );
  NAND2_X1 U117 ( .A1(n41), .A2(n44), .ZN(N195) );
  NAND2_X1 U118 ( .A1(N120), .A2(n43), .ZN(n44) );
  NAND2_X1 U119 ( .A1(n41), .A2(n45), .ZN(N194) );
  NAND2_X1 U120 ( .A1(N119), .A2(n43), .ZN(n45) );
  NAND2_X1 U121 ( .A1(n41), .A2(n46), .ZN(N193) );
  NAND2_X1 U122 ( .A1(N118), .A2(n43), .ZN(n46) );
  NAND2_X1 U123 ( .A1(n41), .A2(n47), .ZN(N192) );
  NAND2_X1 U124 ( .A1(N117), .A2(n43), .ZN(n47) );
  NAND2_X1 U125 ( .A1(n41), .A2(n48), .ZN(N191) );
  NAND2_X1 U126 ( .A1(N116), .A2(n43), .ZN(n48) );
  NAND2_X1 U127 ( .A1(n41), .A2(n49), .ZN(N190) );
  NAND2_X1 U128 ( .A1(N115), .A2(n43), .ZN(n49) );
  NAND2_X1 U129 ( .A1(Enable), .A2(n32), .ZN(n41) );
  NAND2_X1 U130 ( .A1(ALU_FUN[3]), .A2(ALU_FUN[2]), .ZN(n40) );
  NAND2_X1 U131 ( .A1(ALU_FUN[2]), .A2(n38), .ZN(n116) );
  NAND2_X1 U132 ( .A1(n36), .A2(n34), .ZN(n118) );
  NAND2_X1 U133 ( .A1(ALU_FUN[0]), .A2(n36), .ZN(n105) );
  ALU_OpWidth8_FuncWidth4_DW_div_uns_0 div_36 ( .a(A), .b(B), .quotient({N129, 
        N128, N127, N126, N125, N124, N123, N122}) );
  ALU_OpWidth8_FuncWidth4_DW01_sub_0 sub_28 ( .A({1'b0, A}), .B({1'b0, B}), 
        .CI(1'b0), .DIFF({N105, N104, N103, N102, N101, N100, N99, N98, N97})
         );
  ALU_OpWidth8_FuncWidth4_DW01_add_0 add_24 ( .A({1'b0, A}), .B({1'b0, B}), 
        .CI(1'b0), .SUM({N96, N95, N94, N93, N92, N91, N90, N89, N88}) );
  ALU_OpWidth8_FuncWidth4_DW02_mult_0 mult_32 ( .A(A), .B(B), .TC(1'b0), 
        .PRODUCT({N121, N120, N119, N118, N117, N116, N115, N114, N113, N112, 
        N111, N110, N109, N108, N107, N106}) );
  INV_X1 U3 ( .A(n53), .ZN(n35) );
  OAI21_X1 U4 ( .B1(n36), .B2(n116), .A(n117), .ZN(n57) );
  OAI21_X1 U7 ( .B1(n116), .B2(n118), .A(n117), .ZN(n66) );
  NOR2_X2 U8 ( .A1(n105), .A2(n116), .ZN(n61) );
  NOR2_X1 U9 ( .A1(n118), .A2(n40), .ZN(n71) );
  AND2_X1 U10 ( .A1(n119), .A2(n34), .ZN(n50) );
  NOR2_X1 U11 ( .A1(n105), .A2(n40), .ZN(n53) );
  INV_X1 U12 ( .A(Enable), .ZN(n39) );
  AND2_X1 U13 ( .A1(ALU_FUN[0]), .A2(n119), .ZN(n68) );
  NOR3_X1 U14 ( .A1(ALU_FUN[2]), .A2(ALU_FUN[3]), .A3(n36), .ZN(n119) );
  INV_X1 U15 ( .A(ALU_FUN[1]), .ZN(n36) );
  AND2_X1 U16 ( .A1(n50), .A2(Enable), .ZN(n43) );
  INV_X1 U17 ( .A(ALU_FUN[3]), .ZN(n38) );
  AOI21_X1 U18 ( .B1(ALU_FUN[1]), .B2(n37), .A(n39), .ZN(N197) );
  INV_X1 U19 ( .A(n40), .ZN(n37) );
  INV_X1 U20 ( .A(ALU_FUN[0]), .ZN(n34) );
  OR3_X1 U21 ( .A1(n38), .A2(ALU_FUN[2]), .A3(n105), .ZN(n117) );
  OR4_X1 U22 ( .A1(ALU_FUN[2]), .A2(n115), .A3(n38), .A4(n36), .ZN(n114) );
  AOI22_X1 U23 ( .A1(N162), .A2(n34), .B1(N163), .B2(ALU_FUN[0]), .ZN(n115) );
  INV_X1 U24 ( .A(n55), .ZN(n32) );
  AOI21_X1 U25 ( .B1(n56), .B2(N105), .A(n57), .ZN(n55) );
  INV_X1 U26 ( .A(n67), .ZN(n25) );
  AOI22_X1 U27 ( .A1(N129), .A2(n68), .B1(N113), .B2(n50), .ZN(n67) );
  BUF_X1 U28 ( .A(RST), .Z(n3) );
  BUF_X1 U29 ( .A(RST), .Z(n4) );
  AOI222_X1 U30 ( .A1(N106), .A2(n50), .B1(A[0]), .B2(n61), .C1(N122), .C2(n68), .ZN(n109) );
  AOI21_X1 U31 ( .B1(n100), .B2(n101), .A(n39), .ZN(N182) );
  AOI221_X1 U32 ( .B1(A[2]), .B2(n71), .C1(n60), .C2(n132), .A(n102), .ZN(n101) );
  AOI221_X1 U33 ( .B1(N98), .B2(n56), .C1(N89), .C2(n54), .A(n31), .ZN(n100)
         );
  OAI222_X1 U34 ( .A1(n103), .A2(n125), .B1(B[1]), .B2(n104), .C1(n35), .C2(
        n133), .ZN(n102) );
  INV_X1 U35 ( .A(n106), .ZN(n31) );
  AOI222_X1 U36 ( .A1(N107), .A2(n50), .B1(A[1]), .B2(n61), .C1(N123), .C2(n68), .ZN(n106) );
  NOR2_X1 U37 ( .A1(n107), .A2(n39), .ZN(N181) );
  AND4_X1 U38 ( .A1(n108), .A2(n109), .A3(n110), .A4(n33), .ZN(n107) );
  AOI22_X1 U39 ( .A1(N97), .A2(n56), .B1(N88), .B2(n54), .ZN(n108) );
  AOI22_X1 U40 ( .A1(A[1]), .A2(n71), .B1(n60), .B2(n133), .ZN(n110) );
  AOI21_X1 U41 ( .B1(n94), .B2(n95), .A(n39), .ZN(N183) );
  AOI221_X1 U42 ( .B1(A[3]), .B2(n71), .C1(n60), .C2(n131), .A(n96), .ZN(n95)
         );
  AOI221_X1 U43 ( .B1(N99), .B2(n56), .C1(N90), .C2(n54), .A(n30), .ZN(n94) );
  OAI222_X1 U44 ( .A1(n97), .A2(n124), .B1(B[2]), .B2(n98), .C1(n35), .C2(n132), .ZN(n96) );
  AOI21_X1 U45 ( .B1(n88), .B2(n89), .A(n39), .ZN(N184) );
  AOI221_X1 U46 ( .B1(A[4]), .B2(n71), .C1(n60), .C2(n23), .A(n90), .ZN(n89)
         );
  AOI221_X1 U47 ( .B1(N100), .B2(n56), .C1(N91), .C2(n54), .A(n29), .ZN(n88)
         );
  OAI222_X1 U48 ( .A1(n91), .A2(n123), .B1(B[3]), .B2(n92), .C1(n35), .C2(n131), .ZN(n90) );
  AOI21_X1 U49 ( .B1(n82), .B2(n83), .A(n39), .ZN(N185) );
  AOI221_X1 U50 ( .B1(n71), .B2(A[5]), .C1(n60), .C2(n130), .A(n84), .ZN(n83)
         );
  AOI221_X1 U51 ( .B1(N101), .B2(n56), .C1(N92), .C2(n54), .A(n28), .ZN(n82)
         );
  OAI222_X1 U52 ( .A1(n85), .A2(n122), .B1(B[4]), .B2(n86), .C1(n35), .C2(n23), 
        .ZN(n84) );
  INV_X1 U53 ( .A(n99), .ZN(n30) );
  AOI222_X1 U54 ( .A1(N108), .A2(n50), .B1(A[2]), .B2(n61), .C1(N124), .C2(n68), .ZN(n99) );
  INV_X1 U55 ( .A(n93), .ZN(n29) );
  AOI222_X1 U56 ( .A1(N109), .A2(n50), .B1(A[3]), .B2(n61), .C1(N125), .C2(n68), .ZN(n93) );
  INV_X1 U57 ( .A(n87), .ZN(n28) );
  AOI222_X1 U58 ( .A1(N110), .A2(n50), .B1(A[4]), .B2(n61), .C1(N126), .C2(n68), .ZN(n87) );
  INV_X1 U59 ( .A(n75), .ZN(n26) );
  AOI222_X1 U60 ( .A1(N112), .A2(n50), .B1(n61), .B2(A[6]), .C1(N128), .C2(n68), .ZN(n75) );
  AOI221_X1 U61 ( .B1(A[1]), .B2(n65), .C1(n57), .C2(n132), .A(n60), .ZN(n104)
         );
  AOI221_X1 U62 ( .B1(A[6]), .B2(n65), .C1(n57), .C2(n128), .A(n60), .ZN(n74)
         );
  AOI221_X1 U63 ( .B1(A[2]), .B2(n65), .C1(n57), .C2(n131), .A(n60), .ZN(n98)
         );
  AOI221_X1 U64 ( .B1(A[3]), .B2(n65), .C1(n57), .C2(n23), .A(n60), .ZN(n92)
         );
  AOI221_X1 U65 ( .B1(A[4]), .B2(n65), .C1(n57), .C2(n130), .A(n60), .ZN(n86)
         );
  AOI221_X1 U66 ( .B1(A[5]), .B2(n65), .C1(n57), .C2(n129), .A(n60), .ZN(n80)
         );
  AOI221_X1 U67 ( .B1(n65), .B2(A[7]), .C1(n57), .C2(n127), .A(n60), .ZN(n64)
         );
  AOI221_X1 U68 ( .B1(n65), .B2(n132), .C1(A[1]), .C2(n66), .A(n61), .ZN(n103)
         );
  AOI221_X1 U69 ( .B1(n65), .B2(n131), .C1(A[2]), .C2(n66), .A(n61), .ZN(n97)
         );
  AOI221_X1 U70 ( .B1(n65), .B2(n23), .C1(A[3]), .C2(n66), .A(n61), .ZN(n91)
         );
  AOI221_X1 U71 ( .B1(n65), .B2(n130), .C1(A[4]), .C2(n66), .A(n61), .ZN(n85)
         );
  AOI221_X1 U72 ( .B1(n65), .B2(n129), .C1(A[5]), .C2(n66), .A(n61), .ZN(n79)
         );
  AOI221_X1 U73 ( .B1(n65), .B2(n128), .C1(A[6]), .C2(n66), .A(n61), .ZN(n73)
         );
  AOI221_X1 U74 ( .B1(n65), .B2(n127), .C1(A[7]), .C2(n66), .A(n61), .ZN(n63)
         );
  AOI221_X1 U75 ( .B1(n66), .B2(A[0]), .C1(n133), .C2(n65), .A(n61), .ZN(n112)
         );
  INV_X1 U76 ( .A(A[1]), .ZN(n132) );
  INV_X1 U77 ( .A(A[6]), .ZN(n128) );
  INV_X1 U78 ( .A(A[2]), .ZN(n131) );
  INV_X1 U79 ( .A(A[4]), .ZN(n130) );
  INV_X1 U80 ( .A(A[5]), .ZN(n129) );
  INV_X1 U81 ( .A(A[0]), .ZN(n133) );
  INV_X1 U84 ( .A(A[7]), .ZN(n127) );
  INV_X1 U85 ( .A(A[3]), .ZN(n23) );
  AOI21_X1 U86 ( .B1(n58), .B2(n59), .A(n39), .ZN(N188) );
  AOI221_X1 U87 ( .B1(n60), .B2(n127), .C1(n61), .C2(A[7]), .A(n62), .ZN(n59)
         );
  AOI221_X1 U88 ( .B1(N104), .B2(n56), .C1(N95), .C2(n54), .A(n25), .ZN(n58)
         );
  OAI222_X1 U89 ( .A1(n63), .A2(n120), .B1(B[7]), .B2(n64), .C1(n35), .C2(n128), .ZN(n62) );
  AOI21_X1 U90 ( .B1(n51), .B2(n52), .A(n39), .ZN(N189) );
  AOI21_X1 U91 ( .B1(N96), .B2(n54), .A(n32), .ZN(n51) );
  AOI22_X1 U92 ( .A1(A[7]), .A2(n53), .B1(N114), .B2(n50), .ZN(n52) );
  AOI21_X1 U93 ( .B1(n76), .B2(n77), .A(n39), .ZN(N186) );
  AOI221_X1 U94 ( .B1(n71), .B2(A[6]), .C1(n60), .C2(n129), .A(n78), .ZN(n77)
         );
  AOI221_X1 U95 ( .B1(N102), .B2(n56), .C1(N93), .C2(n54), .A(n27), .ZN(n76)
         );
  OAI222_X1 U96 ( .A1(n79), .A2(n121), .B1(B[5]), .B2(n80), .C1(n35), .C2(n130), .ZN(n78) );
  AOI21_X1 U97 ( .B1(n69), .B2(n70), .A(n39), .ZN(N187) );
  AOI221_X1 U98 ( .B1(n71), .B2(A[7]), .C1(n60), .C2(n128), .A(n72), .ZN(n70)
         );
  AOI221_X1 U99 ( .B1(N103), .B2(n56), .C1(N94), .C2(n54), .A(n26), .ZN(n69)
         );
  OAI222_X1 U100 ( .A1(n73), .A2(n24), .B1(B[6]), .B2(n74), .C1(n35), .C2(n129), .ZN(n72) );
  INV_X1 U101 ( .A(B[1]), .ZN(n125) );
  INV_X1 U102 ( .A(B[7]), .ZN(n120) );
  INV_X1 U103 ( .A(B[6]), .ZN(n24) );
  INV_X1 U104 ( .A(B[2]), .ZN(n124) );
  INV_X1 U105 ( .A(B[4]), .ZN(n122) );
  INV_X1 U106 ( .A(B[3]), .ZN(n123) );
  INV_X1 U107 ( .A(B[5]), .ZN(n121) );
  INV_X1 U108 ( .A(n81), .ZN(n27) );
  AOI222_X1 U109 ( .A1(N111), .A2(n50), .B1(A[5]), .B2(n61), .C1(N127), .C2(
        n68), .ZN(n81) );
  INV_X1 U110 ( .A(n111), .ZN(n33) );
  OAI221_X1 U111 ( .B1(n126), .B2(n112), .C1(n113), .C2(B[0]), .A(n114), .ZN(
        n111) );
  INV_X1 U112 ( .A(B[0]), .ZN(n126) );
  AOI221_X1 U113 ( .B1(n133), .B2(n57), .C1(n65), .C2(A[0]), .A(n60), .ZN(n113) );
  NOR3_X4 U114 ( .A1(n36), .A2(ALU_FUN[0]), .A3(n116), .ZN(n60) );
  NOR3_X4 U134 ( .A1(n38), .A2(ALU_FUN[2]), .A3(n118), .ZN(n65) );
  AND2_X1 U135 ( .A1(B[0]), .A2(n133), .ZN(n5) );
  OAI22_X1 U136 ( .A1(n5), .A2(n132), .B1(B[1]), .B2(n5), .ZN(n6) );
  OR2_X1 U137 ( .A1(n24), .A2(A[6]), .ZN(n7) );
  NAND2_X1 U138 ( .A1(B[5]), .A2(n129), .ZN(n8) );
  NAND2_X1 U139 ( .A1(B[4]), .A2(n130), .ZN(n15) );
  NAND4_X1 U140 ( .A1(n6), .A2(n7), .A3(n8), .A4(n15), .ZN(n22) );
  NAND2_X1 U141 ( .A1(B[3]), .A2(n23), .ZN(n14) );
  NAND2_X1 U142 ( .A1(B[2]), .A2(n131), .ZN(n9) );
  NAND2_X1 U143 ( .A1(n14), .A2(n9), .ZN(n21) );
  AND2_X1 U144 ( .A1(B[7]), .A2(n127), .ZN(n20) );
  AND2_X1 U145 ( .A1(n8), .A2(n7), .ZN(n18) );
  NOR2_X1 U146 ( .A1(n133), .A2(B[0]), .ZN(n10) );
  AND2_X1 U147 ( .A1(n10), .A2(A[1]), .ZN(n11) );
  OAI221_X1 U148 ( .B1(n11), .B2(n125), .C1(A[1]), .C2(n10), .A(n9), .ZN(n12)
         );
  OAI221_X1 U149 ( .B1(B[2]), .B2(n131), .C1(B[3]), .C2(n23), .A(n12), .ZN(n13) );
  NAND3_X1 U150 ( .A1(n15), .A2(n14), .A3(n13), .ZN(n16) );
  OAI221_X1 U151 ( .B1(B[4]), .B2(n130), .C1(B[5]), .C2(n129), .A(n16), .ZN(
        n17) );
  AOI22_X1 U152 ( .A1(A[6]), .A2(n24), .B1(n18), .B2(n17), .ZN(n19) );
  OAI22_X1 U153 ( .A1(B[7]), .A2(n127), .B1(n20), .B2(n19), .ZN(N163) );
  NOR4_X1 U154 ( .A1(n22), .A2(n21), .A3(N163), .A4(n20), .ZN(N162) );
endmodule


module RegisterFile_AddWidth4_BusWidth8_RegDepth16 ( CLK, RST, Address, RdEn, 
        WrEn, WrData, RdData_Valid, RdData, REG0, REG1, REG2 );
  input [3:0] Address;
  input [7:0] WrData;
  output [7:0] RdData;
  output [7:0] REG0;
  output [7:0] REG1;
  output [7:0] REG2;
  input CLK, RST, RdEn, WrEn;
  output RdData_Valid;
  wire   \RegFile[0][7] , \RegFile[0][6] , \RegFile[0][5] , \RegFile[0][4] ,
         \RegFile[0][3] , \RegFile[0][2] , \RegFile[0][1] , \RegFile[0][0] ,
         \RegFile[1][7] , \RegFile[1][6] , \RegFile[1][5] , \RegFile[1][4] ,
         \RegFile[1][3] , \RegFile[1][2] , \RegFile[1][1] , \RegFile[1][0] ,
         \RegFile[2][7] , \RegFile[2][6] , \RegFile[2][5] , \RegFile[2][4] ,
         \RegFile[2][3] , \RegFile[2][2] , \RegFile[2][1] , \RegFile[2][0] ,
         \RegFile[3][7] , \RegFile[3][6] , \RegFile[3][5] , \RegFile[3][4] ,
         \RegFile[3][3] , \RegFile[3][2] , \RegFile[3][1] , \RegFile[3][0] ,
         \RegFile[4][7] , \RegFile[4][6] , \RegFile[4][5] , \RegFile[4][4] ,
         \RegFile[4][3] , \RegFile[4][2] , \RegFile[4][1] , \RegFile[4][0] ,
         \RegFile[5][7] , \RegFile[5][6] , \RegFile[5][5] , \RegFile[5][4] ,
         \RegFile[5][3] , \RegFile[5][2] , \RegFile[5][1] , \RegFile[5][0] ,
         \RegFile[8][7] , \RegFile[8][6] , \RegFile[8][5] , \RegFile[8][4] ,
         \RegFile[8][3] , \RegFile[8][2] , \RegFile[8][1] , \RegFile[8][0] ,
         \RegFile[9][7] , \RegFile[9][6] , \RegFile[9][5] , \RegFile[9][4] ,
         \RegFile[9][3] , \RegFile[9][2] , \RegFile[9][1] , \RegFile[9][0] ,
         \RegFile[12][7] , \RegFile[12][6] , \RegFile[12][5] ,
         \RegFile[12][4] , \RegFile[12][3] , \RegFile[12][2] ,
         \RegFile[12][1] , \RegFile[12][0] , \RegFile[13][7] ,
         \RegFile[13][6] , \RegFile[13][5] , \RegFile[13][4] ,
         \RegFile[13][3] , \RegFile[13][2] , \RegFile[13][1] ,
         \RegFile[13][0] , n2, n4, n6, n8, n10, n12, n14, n16, n18, n20, n22,
         n24, n26, n28, n30, n32, n33, n34, n35, n36, n37, n38, n39, n40, n65,
         n66, n67, n68, n69, n70, n71, n72, n73, n74, n75, n76, n77, n78, n79,
         n80, n97, n98, n99, n100, n101, n102, n103, n104, n105, n106, n107,
         n108, n109, n110, n111, n112, n129, n130, n131, n132, n133, n134,
         n135, n136, n137, n138, n139, n140, n141, n142, n143, n144, n145,
         n146, n147, n148, n149, n150, n151, n152, n154, n155, n156, n157,
         n158, n159, n160, n161, n197, n198, n199, n200, n201, n202, n203,
         n204, n205, n206, n207, n208, n209, n210, n211, n212, n213, n214,
         n215, n216, n217, n218, n219, n220, n221, n222, n223, n224, n225,
         n226, n227, n228, n231, n232, n233, n234, n235, n236, n237, n238,
         n239, n240, n241, n242, n243, n244, n245, n246, n247, n248, n249,
         n250, n251, n252, n253, n254, n255, n256, n257, n258, n259, n260,
         n261, n262, n263, n264, n265, n266, n267, n268, n269, n270, n271,
         n272, n273, n274, n275, n276, n277, n278, n279, n280, n281, n282,
         n283, n284, n285, n286, n287, n288, n289, n290, n291, n292, n293,
         n294, n295, n296, n297, n298, n299, n300, n301, n302, n303, n304,
         n305, n306, n307, n308, n309, n310, n311, n312, n313, n314, n315,
         n316, n317, n318, n319, n320, n321, n322, n323, n324, n325, n326,
         n327, n328, n329, n330, n331, n332, n333, n334, n335, n336, n337,
         n338, n339, n340, n341, n342, n343, n344, n345, n346, n347, n348,
         n349, n350, n351, n352, n353, n354, n355, n356, n357, n358, n359,
         n360, n361, n362, n363, n364, n365, n366, n367, n368, n369, n370,
         n371, n372, n373, n374, n375, n376, n377, n378, n379, n380, n381,
         n382, n383, n384, n385, n386, n387, n388, n389, n390, n391, n392,
         n393, n394, n395, n396, n397, n398, n399, n400, n401, n402, n403,
         n404, n405, n406, n407, n408, n409, n410, n411, n412, n413, n414,
         n415, n416, n417, n418, n419, n420, n421, n422, n423, n424, n425,
         n426, n427, n428, n429, n430, n431, n432, n433, n434, n435, n436,
         n437, n438, n439, n440, n441, n442, n443, n444, n445, n446, n447,
         n448, n449, n450, n451, n452, n453, n454, n455, n456, n457, n458,
         n459, n460, n461, n462, n463, n464, n465, n466, n467, n468, n1, n3,
         n5, n7, n9, n11, n13, n15, n17, n19, n21, n23, n25, n27, n29, n31,
         n41, n42, n43, n44, n45, n46, n47, n48, n49, n50, n51, n52, n53, n54,
         n55, n56, n57, n58, n59, n60, n61, n62, n63, n64, n81, n82, n83, n84,
         n85, n86, n87, n88, n89, n90, n91, n92, n93, n94, n95, n96, n113,
         n114, n115, n116, n117, n118, n119, n120, n121, n122, n123, n124,
         n125, n126, n127, n128, n153, n162, n163, n164, n165, n166, n167,
         n168, n169, n170, n171, n172, n173, n174, n175, n176, n177, n178,
         n179, n180, n181, n182, n183, n184, n185, n186, n187, n188, n189,
         n190, n191, n192, n193, n194, n195, n196, n229, n230, n469, n470,
         n471, n472, n473, n474, n475, n476, n477, n478, n479, n480, n481,
         n482, n483, n484, n485, n486, n487, n488, n489, n490, n491;

  DFF_X1 \RegFile_reg[0][7]  ( .D(n468), .CK(CLK), .Q(\RegFile[0][7] ), .QN(n2) );
  DFF_X1 \RegFile_reg[0][6]  ( .D(n467), .CK(CLK), .Q(\RegFile[0][6] ), .QN(n4) );
  DFF_X1 \RegFile_reg[0][5]  ( .D(n466), .CK(CLK), .Q(\RegFile[0][5] ), .QN(n6) );
  DFF_X1 \RegFile_reg[0][4]  ( .D(n465), .CK(CLK), .Q(\RegFile[0][4] ), .QN(n8) );
  DFF_X1 \RegFile_reg[0][3]  ( .D(n464), .CK(CLK), .Q(\RegFile[0][3] ), .QN(
        n10) );
  DFF_X1 \RegFile_reg[0][2]  ( .D(n463), .CK(CLK), .Q(\RegFile[0][2] ), .QN(
        n12) );
  DFF_X1 \RegFile_reg[0][1]  ( .D(n462), .CK(CLK), .Q(\RegFile[0][1] ), .QN(
        n14) );
  DFF_X1 \RegFile_reg[0][0]  ( .D(n461), .CK(CLK), .Q(\RegFile[0][0] ), .QN(
        n16) );
  DFF_X1 \RegFile_reg[1][7]  ( .D(n460), .CK(CLK), .Q(\RegFile[1][7] ), .QN(
        n18) );
  DFF_X1 \RegFile_reg[1][6]  ( .D(n459), .CK(CLK), .Q(\RegFile[1][6] ), .QN(
        n20) );
  DFF_X1 \RegFile_reg[1][5]  ( .D(n458), .CK(CLK), .Q(\RegFile[1][5] ), .QN(
        n22) );
  DFF_X1 \RegFile_reg[1][4]  ( .D(n457), .CK(CLK), .Q(\RegFile[1][4] ), .QN(
        n24) );
  DFF_X1 \RegFile_reg[1][3]  ( .D(n456), .CK(CLK), .Q(\RegFile[1][3] ), .QN(
        n26) );
  DFF_X1 \RegFile_reg[1][2]  ( .D(n455), .CK(CLK), .Q(\RegFile[1][2] ), .QN(
        n28) );
  DFF_X1 \RegFile_reg[1][1]  ( .D(n454), .CK(CLK), .Q(\RegFile[1][1] ), .QN(
        n30) );
  DFF_X1 \RegFile_reg[1][0]  ( .D(n453), .CK(CLK), .Q(\RegFile[1][0] ), .QN(
        n32) );
  DFF_X1 \RegFile_reg[2][7]  ( .D(n452), .CK(CLK), .Q(\RegFile[2][7] ), .QN(
        n33) );
  DFF_X1 \RegFile_reg[2][6]  ( .D(n451), .CK(CLK), .Q(\RegFile[2][6] ), .QN(
        n34) );
  DFF_X1 \RegFile_reg[2][5]  ( .D(n450), .CK(CLK), .Q(\RegFile[2][5] ), .QN(
        n35) );
  DFF_X1 \RegFile_reg[2][4]  ( .D(n449), .CK(CLK), .Q(\RegFile[2][4] ), .QN(
        n36) );
  DFF_X1 \RegFile_reg[2][3]  ( .D(n448), .CK(CLK), .Q(\RegFile[2][3] ), .QN(
        n37) );
  DFF_X1 \RegFile_reg[2][2]  ( .D(n447), .CK(CLK), .Q(\RegFile[2][2] ), .QN(
        n38) );
  DFF_X1 \RegFile_reg[2][1]  ( .D(n446), .CK(CLK), .Q(\RegFile[2][1] ), .QN(
        n39) );
  DFF_X1 \RegFile_reg[2][0]  ( .D(n445), .CK(CLK), .Q(\RegFile[2][0] ), .QN(
        n40) );
  DFFR_X1 \RegFile_reg[3][7]  ( .D(n191), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][7] ) );
  DFFR_X1 \RegFile_reg[3][6]  ( .D(n190), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][6] ) );
  DFFR_X1 \RegFile_reg[3][5]  ( .D(n189), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][5] ) );
  DFFR_X1 \RegFile_reg[3][4]  ( .D(n188), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][4] ) );
  DFFR_X1 \RegFile_reg[3][3]  ( .D(n187), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][3] ) );
  DFFR_X1 \RegFile_reg[3][2]  ( .D(n186), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][2] ) );
  DFFR_X1 \RegFile_reg[3][1]  ( .D(n185), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][1] ) );
  DFFR_X1 \RegFile_reg[3][0]  ( .D(n184), .CK(CLK), .RN(n54), .Q(
        \RegFile[3][0] ) );
  DFFR_X1 \RegFile_reg[4][7]  ( .D(n153), .CK(CLK), .RN(n54), .Q(
        \RegFile[4][7] ) );
  DFFR_X1 \RegFile_reg[4][6]  ( .D(n128), .CK(CLK), .RN(n50), .Q(
        \RegFile[4][6] ) );
  DFFR_X1 \RegFile_reg[4][5]  ( .D(n127), .CK(CLK), .RN(n50), .Q(
        \RegFile[4][5] ) );
  DFFR_X1 \RegFile_reg[4][4]  ( .D(n126), .CK(CLK), .RN(n53), .Q(
        \RegFile[4][4] ) );
  DFFR_X1 \RegFile_reg[4][3]  ( .D(n125), .CK(CLK), .RN(n49), .Q(
        \RegFile[4][3] ) );
  DFFR_X1 \RegFile_reg[4][2]  ( .D(n124), .CK(CLK), .RN(n51), .Q(
        \RegFile[4][2] ) );
  DFFR_X1 \RegFile_reg[4][1]  ( .D(n123), .CK(CLK), .RN(n53), .Q(
        \RegFile[4][1] ) );
  DFFR_X1 \RegFile_reg[4][0]  ( .D(n122), .CK(CLK), .RN(n51), .Q(
        \RegFile[4][0] ) );
  DFFR_X1 \RegFile_reg[5][7]  ( .D(n84), .CK(CLK), .RN(n53), .Q(
        \RegFile[5][7] ) );
  DFFR_X1 \RegFile_reg[5][6]  ( .D(n83), .CK(CLK), .RN(n52), .Q(
        \RegFile[5][6] ) );
  DFFR_X1 \RegFile_reg[5][5]  ( .D(n82), .CK(CLK), .RN(n53), .Q(
        \RegFile[5][5] ) );
  DFFR_X1 \RegFile_reg[5][4]  ( .D(n81), .CK(CLK), .RN(n52), .Q(
        \RegFile[5][4] ) );
  DFFR_X1 \RegFile_reg[5][3]  ( .D(n64), .CK(CLK), .RN(n49), .Q(
        \RegFile[5][3] ) );
  DFFR_X1 \RegFile_reg[5][2]  ( .D(n63), .CK(CLK), .RN(n49), .Q(
        \RegFile[5][2] ) );
  DFFR_X1 \RegFile_reg[5][1]  ( .D(n62), .CK(CLK), .RN(n49), .Q(
        \RegFile[5][1] ) );
  DFFR_X1 \RegFile_reg[5][0]  ( .D(n61), .CK(CLK), .RN(n50), .Q(
        \RegFile[5][0] ) );
  DFFR_X1 \RegFile_reg[6][7]  ( .D(n444), .CK(CLK), .RN(n51), .QN(n65) );
  DFFR_X1 \RegFile_reg[6][6]  ( .D(n443), .CK(CLK), .RN(n50), .QN(n66) );
  DFFR_X1 \RegFile_reg[6][5]  ( .D(n442), .CK(CLK), .RN(n49), .QN(n67) );
  DFFR_X1 \RegFile_reg[6][4]  ( .D(n441), .CK(CLK), .RN(n50), .QN(n68) );
  DFFR_X1 \RegFile_reg[6][3]  ( .D(n440), .CK(CLK), .RN(n52), .QN(n69) );
  DFFR_X1 \RegFile_reg[6][2]  ( .D(n439), .CK(CLK), .RN(n53), .QN(n70) );
  DFFR_X1 \RegFile_reg[6][1]  ( .D(n438), .CK(CLK), .RN(n52), .QN(n71) );
  DFFR_X1 \RegFile_reg[6][0]  ( .D(n437), .CK(CLK), .RN(n51), .QN(n72) );
  DFFR_X1 \RegFile_reg[7][7]  ( .D(n436), .CK(CLK), .RN(n52), .QN(n73) );
  DFFR_X1 \RegFile_reg[7][6]  ( .D(n435), .CK(CLK), .RN(n50), .QN(n74) );
  DFFR_X1 \RegFile_reg[7][5]  ( .D(n434), .CK(CLK), .RN(n49), .QN(n75) );
  DFFR_X1 \RegFile_reg[7][4]  ( .D(n433), .CK(CLK), .RN(n53), .QN(n76) );
  DFFR_X1 \RegFile_reg[7][3]  ( .D(n432), .CK(CLK), .RN(n52), .QN(n77) );
  DFFR_X1 \RegFile_reg[7][2]  ( .D(n431), .CK(CLK), .RN(n51), .QN(n78) );
  DFFR_X1 \RegFile_reg[7][1]  ( .D(n430), .CK(CLK), .RN(n50), .QN(n79) );
  DFFR_X1 \RegFile_reg[7][0]  ( .D(n429), .CK(CLK), .RN(n49), .QN(n80) );
  DFFR_X1 \RegFile_reg[8][7]  ( .D(n170), .CK(CLK), .RN(n51), .Q(
        \RegFile[8][7] ) );
  DFFR_X1 \RegFile_reg[8][6]  ( .D(n169), .CK(CLK), .RN(n50), .Q(
        \RegFile[8][6] ) );
  DFFR_X1 \RegFile_reg[8][5]  ( .D(n168), .CK(CLK), .RN(n53), .Q(
        \RegFile[8][5] ) );
  DFFR_X1 \RegFile_reg[8][4]  ( .D(n167), .CK(CLK), .RN(n52), .Q(
        \RegFile[8][4] ) );
  DFFR_X1 \RegFile_reg[8][3]  ( .D(n166), .CK(CLK), .RN(n49), .Q(
        \RegFile[8][3] ) );
  DFFR_X1 \RegFile_reg[8][2]  ( .D(n165), .CK(CLK), .RN(n53), .Q(
        \RegFile[8][2] ) );
  DFFR_X1 \RegFile_reg[8][1]  ( .D(n164), .CK(CLK), .RN(n52), .Q(
        \RegFile[8][1] ) );
  DFFR_X1 \RegFile_reg[8][0]  ( .D(n163), .CK(CLK), .RN(n51), .Q(
        \RegFile[8][0] ) );
  DFFR_X1 \RegFile_reg[9][7]  ( .D(n93), .CK(CLK), .RN(n52), .Q(
        \RegFile[9][7] ) );
  DFFR_X1 \RegFile_reg[9][6]  ( .D(n92), .CK(CLK), .RN(n53), .Q(
        \RegFile[9][6] ) );
  DFFR_X1 \RegFile_reg[9][5]  ( .D(n91), .CK(CLK), .RN(n50), .Q(
        \RegFile[9][5] ) );
  DFFR_X1 \RegFile_reg[9][4]  ( .D(n90), .CK(CLK), .RN(n49), .Q(
        \RegFile[9][4] ) );
  DFFR_X1 \RegFile_reg[9][3]  ( .D(n89), .CK(CLK), .RN(n52), .Q(
        \RegFile[9][3] ) );
  DFFR_X1 \RegFile_reg[9][2]  ( .D(n88), .CK(CLK), .RN(n51), .Q(
        \RegFile[9][2] ) );
  DFFR_X1 \RegFile_reg[9][1]  ( .D(n87), .CK(CLK), .RN(n50), .Q(
        \RegFile[9][1] ) );
  DFFR_X1 \RegFile_reg[9][0]  ( .D(n86), .CK(CLK), .RN(n49), .Q(
        \RegFile[9][0] ) );
  DFFR_X1 \RegFile_reg[10][7]  ( .D(n428), .CK(CLK), .RN(n53), .QN(n97) );
  DFFR_X1 \RegFile_reg[10][6]  ( .D(n427), .CK(CLK), .RN(n53), .QN(n98) );
  DFFR_X1 \RegFile_reg[10][5]  ( .D(n426), .CK(CLK), .RN(n51), .QN(n99) );
  DFFR_X1 \RegFile_reg[10][4]  ( .D(n425), .CK(CLK), .RN(n53), .QN(n100) );
  DFFR_X1 \RegFile_reg[10][3]  ( .D(n424), .CK(CLK), .RN(n52), .QN(n101) );
  DFFR_X1 \RegFile_reg[10][2]  ( .D(n423), .CK(CLK), .RN(n51), .QN(n102) );
  DFFR_X1 \RegFile_reg[10][1]  ( .D(n422), .CK(CLK), .RN(n50), .QN(n103) );
  DFFR_X1 \RegFile_reg[10][0]  ( .D(n421), .CK(CLK), .RN(n49), .QN(n104) );
  DFFR_X1 \RegFile_reg[11][7]  ( .D(n420), .CK(CLK), .RN(n52), .QN(n105) );
  DFFR_X1 \RegFile_reg[11][6]  ( .D(n419), .CK(CLK), .RN(n51), .QN(n106) );
  DFFR_X1 \RegFile_reg[11][5]  ( .D(n418), .CK(CLK), .RN(n50), .QN(n107) );
  DFFR_X1 \RegFile_reg[11][4]  ( .D(n417), .CK(CLK), .RN(n49), .QN(n108) );
  DFFR_X1 \RegFile_reg[11][3]  ( .D(n416), .CK(CLK), .RN(n51), .QN(n109) );
  DFFR_X1 \RegFile_reg[11][2]  ( .D(n415), .CK(CLK), .RN(n53), .QN(n110) );
  DFFR_X1 \RegFile_reg[11][1]  ( .D(n414), .CK(CLK), .RN(n53), .QN(n111) );
  DFFR_X1 \RegFile_reg[11][0]  ( .D(n413), .CK(CLK), .RN(n53), .QN(n112) );
  DFFR_X1 \RegFile_reg[12][7]  ( .D(n179), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][7] ) );
  DFFR_X1 \RegFile_reg[12][6]  ( .D(n178), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][6] ) );
  DFFR_X1 \RegFile_reg[12][5]  ( .D(n177), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][5] ) );
  DFFR_X1 \RegFile_reg[12][4]  ( .D(n176), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][4] ) );
  DFFR_X1 \RegFile_reg[12][3]  ( .D(n175), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][3] ) );
  DFFR_X1 \RegFile_reg[12][2]  ( .D(n174), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][2] ) );
  DFFR_X1 \RegFile_reg[12][1]  ( .D(n173), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][1] ) );
  DFFR_X1 \RegFile_reg[12][0]  ( .D(n172), .CK(CLK), .RN(n53), .Q(
        \RegFile[12][0] ) );
  DFFR_X1 \RegFile_reg[13][7]  ( .D(n118), .CK(CLK), .RN(n53), .Q(
        \RegFile[13][7] ) );
  DFFR_X1 \RegFile_reg[13][6]  ( .D(n117), .CK(CLK), .RN(n52), .Q(
        \RegFile[13][6] ) );
  DFFR_X1 \RegFile_reg[13][5]  ( .D(n116), .CK(CLK), .RN(n52), .Q(
        \RegFile[13][5] ) );
  DFFR_X1 \RegFile_reg[13][4]  ( .D(n115), .CK(CLK), .RN(n52), .Q(
        \RegFile[13][4] ) );
  DFFR_X1 \RegFile_reg[13][3]  ( .D(n114), .CK(CLK), .RN(n52), .Q(
        \RegFile[13][3] ) );
  DFFR_X1 \RegFile_reg[13][2]  ( .D(n113), .CK(CLK), .RN(n52), .Q(
        \RegFile[13][2] ) );
  DFFR_X1 \RegFile_reg[13][1]  ( .D(n96), .CK(CLK), .RN(n52), .Q(
        \RegFile[13][1] ) );
  DFFR_X1 \RegFile_reg[13][0]  ( .D(n95), .CK(CLK), .RN(n52), .Q(
        \RegFile[13][0] ) );
  DFFR_X1 \RegFile_reg[14][7]  ( .D(n412), .CK(CLK), .RN(n52), .QN(n129) );
  DFFR_X1 \RegFile_reg[14][6]  ( .D(n411), .CK(CLK), .RN(n52), .QN(n130) );
  DFFR_X1 \RegFile_reg[14][5]  ( .D(n410), .CK(CLK), .RN(n52), .QN(n131) );
  DFFR_X1 \RegFile_reg[14][4]  ( .D(n409), .CK(CLK), .RN(n52), .QN(n132) );
  DFFR_X1 \RegFile_reg[14][3]  ( .D(n408), .CK(CLK), .RN(n52), .QN(n133) );
  DFFR_X1 \RegFile_reg[14][2]  ( .D(n407), .CK(CLK), .RN(n51), .QN(n134) );
  DFFR_X1 \RegFile_reg[14][1]  ( .D(n406), .CK(CLK), .RN(n51), .QN(n135) );
  DFFR_X1 \RegFile_reg[14][0]  ( .D(n405), .CK(CLK), .RN(n51), .QN(n136) );
  DFFR_X1 \RegFile_reg[15][7]  ( .D(n404), .CK(CLK), .RN(n51), .QN(n137) );
  DFFR_X1 \RegFile_reg[15][6]  ( .D(n403), .CK(CLK), .RN(n51), .QN(n138) );
  DFFR_X1 \RegFile_reg[15][5]  ( .D(n402), .CK(CLK), .RN(n51), .QN(n139) );
  DFFR_X1 \RegFile_reg[15][4]  ( .D(n401), .CK(CLK), .RN(n51), .QN(n140) );
  DFFR_X1 \RegFile_reg[15][3]  ( .D(n400), .CK(CLK), .RN(n51), .QN(n141) );
  DFFR_X1 \RegFile_reg[15][2]  ( .D(n399), .CK(CLK), .RN(n51), .QN(n142) );
  DFFR_X1 \RegFile_reg[15][1]  ( .D(n398), .CK(CLK), .RN(n51), .QN(n143) );
  DFFR_X1 \RegFile_reg[15][0]  ( .D(n397), .CK(CLK), .RN(n51), .QN(n144) );
  DFF_X1 \RdData_reg[7]  ( .D(n396), .CK(CLK), .Q(RdData[7]), .QN(n145) );
  DFF_X1 \RdData_reg[6]  ( .D(n395), .CK(CLK), .Q(RdData[6]), .QN(n146) );
  DFF_X1 \RdData_reg[5]  ( .D(n394), .CK(CLK), .Q(RdData[5]), .QN(n147) );
  DFF_X1 \RdData_reg[4]  ( .D(n393), .CK(CLK), .Q(RdData[4]), .QN(n148) );
  DFF_X1 \RdData_reg[3]  ( .D(n392), .CK(CLK), .Q(RdData[3]), .QN(n149) );
  DFF_X1 \RdData_reg[2]  ( .D(n391), .CK(CLK), .Q(RdData[2]), .QN(n150) );
  DFF_X1 \RdData_reg[1]  ( .D(n390), .CK(CLK), .Q(RdData[1]), .QN(n151) );
  DFF_X1 \RdData_reg[0]  ( .D(n389), .CK(CLK), .Q(RdData[0]), .QN(n152) );
  DFFR_X1 \REG1_reg[7]  ( .D(n489), .CK(CLK), .RN(n51), .Q(REG1[7]) );
  DFFR_X1 \REG1_reg[6]  ( .D(n488), .CK(CLK), .RN(n50), .Q(REG1[6]) );
  DFFR_X1 \REG1_reg[5]  ( .D(n487), .CK(CLK), .RN(n50), .Q(REG1[5]) );
  DFFR_X1 \REG1_reg[4]  ( .D(n486), .CK(CLK), .RN(n50), .Q(REG1[4]) );
  DFFR_X1 \REG1_reg[3]  ( .D(n485), .CK(CLK), .RN(n50), .Q(REG1[3]) );
  DFFR_X1 \REG1_reg[2]  ( .D(n484), .CK(CLK), .RN(n50), .Q(REG1[2]) );
  DFFR_X1 \REG1_reg[1]  ( .D(n483), .CK(CLK), .RN(n50), .Q(REG1[1]) );
  DFFR_X1 \REG1_reg[0]  ( .D(n482), .CK(CLK), .RN(n50), .Q(REG1[0]) );
  DFFR_X1 RdData_Valid_reg ( .D(n481), .CK(CLK), .RN(n50), .Q(RdData_Valid) );
  DFFR_X1 \REG0_reg[7]  ( .D(n480), .CK(CLK), .RN(n50), .Q(REG0[7]) );
  DFFR_X1 \REG0_reg[6]  ( .D(n479), .CK(CLK), .RN(n50), .Q(REG0[6]) );
  DFFR_X1 \REG0_reg[5]  ( .D(n478), .CK(CLK), .RN(n50), .Q(REG0[5]) );
  DFFR_X1 \REG0_reg[4]  ( .D(n477), .CK(CLK), .RN(n50), .Q(REG0[4]) );
  DFFR_X1 \REG0_reg[3]  ( .D(n476), .CK(CLK), .RN(n49), .Q(REG0[3]) );
  DFFR_X1 \REG0_reg[2]  ( .D(n475), .CK(CLK), .RN(n49), .Q(REG0[2]) );
  DFFR_X1 \REG0_reg[1]  ( .D(n474), .CK(CLK), .RN(n49), .Q(REG0[1]) );
  DFFR_X1 \REG0_reg[0]  ( .D(n473), .CK(CLK), .RN(n49), .Q(REG0[0]) );
  DFFR_X1 \REG2_reg[7]  ( .D(n388), .CK(CLK), .RN(n49), .Q(REG2[7]), .QN(n154)
         );
  DFFR_X1 \REG2_reg[6]  ( .D(n387), .CK(CLK), .RN(n49), .Q(REG2[6]), .QN(n155)
         );
  DFFR_X1 \REG2_reg[5]  ( .D(n386), .CK(CLK), .RN(n49), .Q(REG2[5]), .QN(n156)
         );
  DFFR_X1 \REG2_reg[4]  ( .D(n385), .CK(CLK), .RN(n49), .Q(REG2[4]), .QN(n157)
         );
  DFFR_X1 \REG2_reg[3]  ( .D(n384), .CK(CLK), .RN(n49), .Q(REG2[3]), .QN(n158)
         );
  DFFR_X1 \REG2_reg[2]  ( .D(n383), .CK(CLK), .RN(n49), .Q(REG2[2]), .QN(n159)
         );
  DFFR_X1 \REG2_reg[1]  ( .D(n382), .CK(CLK), .RN(n49), .Q(REG2[1]), .QN(n160)
         );
  DFFR_X1 \REG2_reg[0]  ( .D(n381), .CK(CLK), .RN(n49), .Q(REG2[0]), .QN(n161)
         );
  NOR3_X2 U106 ( .A1(n490), .A2(n55), .A3(n27), .ZN(n215) );
  NAND2_X1 U363 ( .A1(n306), .A2(n1), .ZN(n305) );
  NAND2_X1 U364 ( .A1(n306), .A2(n3), .ZN(n307) );
  NAND2_X1 U368 ( .A1(n327), .A2(n1), .ZN(n326) );
  NAND2_X1 U369 ( .A1(n327), .A2(n3), .ZN(n328) );
  NAND2_X1 U373 ( .A1(n348), .A2(n1), .ZN(n347) );
  NAND2_X1 U374 ( .A1(n348), .A2(n3), .ZN(n349) );
  NAND2_X1 U378 ( .A1(n378), .A2(n3), .ZN(n377) );
  NAND2_X1 U381 ( .A1(n378), .A2(n17), .ZN(n380) );
  NAND2_X1 U382 ( .A1(WrEn), .A2(n491), .ZN(n295) );
  INV_X1 U3 ( .A(n48), .ZN(n27) );
  INV_X1 U4 ( .A(n48), .ZN(n29) );
  INV_X1 U5 ( .A(n380), .ZN(n121) );
  INV_X1 U6 ( .A(n309), .ZN(n119) );
  INV_X1 U7 ( .A(n318), .ZN(n180) );
  INV_X1 U8 ( .A(n330), .ZN(n94) );
  INV_X1 U9 ( .A(n339), .ZN(n171) );
  INV_X1 U10 ( .A(n351), .ZN(n85) );
  INV_X1 U11 ( .A(n360), .ZN(n162) );
  INV_X1 U12 ( .A(n379), .ZN(n60) );
  INV_X1 U13 ( .A(n13), .ZN(n9) );
  INV_X1 U14 ( .A(n13), .ZN(n11) );
  INV_X1 U15 ( .A(n19), .ZN(n15) );
  INV_X1 U16 ( .A(n19), .ZN(n17) );
  INV_X1 U17 ( .A(n307), .ZN(n59) );
  INV_X1 U18 ( .A(n326), .ZN(n182) );
  INV_X1 U19 ( .A(n328), .ZN(n58) );
  INV_X1 U20 ( .A(n347), .ZN(n181) );
  INV_X1 U21 ( .A(n349), .ZN(n57) );
  INV_X1 U22 ( .A(n377), .ZN(n56) );
  NAND2_X1 U23 ( .A1(n378), .A2(n227), .ZN(n379) );
  INV_X1 U24 ( .A(n369), .ZN(n192) );
  INV_X1 U25 ( .A(n305), .ZN(n183) );
  NAND2_X1 U26 ( .A1(n306), .A2(n227), .ZN(n309) );
  NAND2_X1 U27 ( .A1(n306), .A2(n226), .ZN(n318) );
  NAND2_X1 U28 ( .A1(n327), .A2(n227), .ZN(n330) );
  NAND2_X1 U29 ( .A1(n327), .A2(n226), .ZN(n339) );
  NAND2_X1 U30 ( .A1(n348), .A2(n227), .ZN(n351) );
  NAND2_X1 U31 ( .A1(n348), .A2(n226), .ZN(n360) );
  BUF_X1 U32 ( .A(n25), .Z(n48) );
  BUF_X1 U33 ( .A(n23), .Z(n43) );
  BUF_X1 U34 ( .A(n23), .Z(n45) );
  BUF_X1 U35 ( .A(n23), .Z(n44) );
  BUF_X1 U36 ( .A(n25), .Z(n46) );
  BUF_X1 U37 ( .A(n25), .Z(n47) );
  BUF_X1 U38 ( .A(n21), .Z(n42) );
  BUF_X1 U39 ( .A(n21), .Z(n31) );
  BUF_X1 U40 ( .A(n21), .Z(n41) );
  NAND3_X1 U41 ( .A1(n217), .A2(n1), .A3(n490), .ZN(n369) );
  INV_X1 U42 ( .A(n215), .ZN(n472) );
  NOR2_X1 U43 ( .A1(n295), .A2(n223), .ZN(n306) );
  NOR2_X1 U44 ( .A1(n295), .A2(n225), .ZN(n327) );
  INV_X1 U45 ( .A(n295), .ZN(n490) );
  AND2_X1 U46 ( .A1(n490), .A2(n219), .ZN(n348) );
  AND3_X1 U47 ( .A1(n217), .A2(n54), .A3(n490), .ZN(n378) );
  BUF_X1 U48 ( .A(n197), .Z(n23) );
  BUF_X1 U49 ( .A(n197), .Z(n25) );
  BUF_X1 U50 ( .A(n197), .Z(n21) );
  NOR2_X1 U51 ( .A1(Address[2]), .A2(Address[3]), .ZN(n217) );
  NOR2_X1 U52 ( .A1(n195), .A2(Address[3]), .ZN(n219) );
  NAND2_X1 U53 ( .A1(Address[3]), .A2(Address[2]), .ZN(n223) );
  NAND2_X1 U54 ( .A1(Address[3]), .A2(n195), .ZN(n225) );
  INV_X1 U55 ( .A(WrData[3]), .ZN(n229) );
  INV_X1 U56 ( .A(WrData[1]), .ZN(n194) );
  INV_X1 U57 ( .A(WrData[2]), .ZN(n196) );
  INV_X1 U58 ( .A(WrData[0]), .ZN(n193) );
  INV_X1 U59 ( .A(WrData[6]), .ZN(n470) );
  INV_X1 U60 ( .A(WrData[7]), .ZN(n471) );
  NOR2_X1 U61 ( .A1(Address[0]), .A2(Address[1]), .ZN(n226) );
  NOR2_X1 U62 ( .A1(n120), .A2(Address[1]), .ZN(n227) );
  OAI21_X1 U63 ( .B1(WrEn), .B2(n491), .A(n295), .ZN(n197) );
  AND2_X1 U64 ( .A1(Address[1]), .A2(Address[0]), .ZN(n1) );
  AND2_X1 U65 ( .A1(Address[1]), .A2(n120), .ZN(n3) );
  INV_X1 U66 ( .A(Address[2]), .ZN(n195) );
  INV_X1 U67 ( .A(Address[0]), .ZN(n120) );
  INV_X1 U68 ( .A(RdEn), .ZN(n491) );
  INV_X1 U69 ( .A(WrData[4]), .ZN(n230) );
  INV_X1 U70 ( .A(WrData[5]), .ZN(n469) );
  INV_X1 U71 ( .A(RST), .ZN(n55) );
  OAI22_X1 U72 ( .A1(n7), .A2(n144), .B1(n5), .B2(n136), .ZN(n231) );
  OAI22_X1 U73 ( .A1(n7), .A2(n111), .B1(n5), .B2(n103), .ZN(n240) );
  OAI22_X1 U74 ( .A1(n7), .A2(n110), .B1(n5), .B2(n102), .ZN(n250) );
  OAI22_X1 U75 ( .A1(n7), .A2(n137), .B1(n5), .B2(n129), .ZN(n302) );
  OAI22_X1 U76 ( .A1(n7), .A2(n109), .B1(n5), .B2(n101), .ZN(n260) );
  OAI22_X1 U77 ( .A1(n7), .A2(n108), .B1(n5), .B2(n100), .ZN(n270) );
  OAI22_X1 U78 ( .A1(n7), .A2(n107), .B1(n5), .B2(n99), .ZN(n280) );
  OAI22_X1 U79 ( .A1(n7), .A2(n106), .B1(n5), .B2(n98), .ZN(n290) );
  OAI22_X1 U80 ( .A1(n222), .A2(n223), .B1(n224), .B2(n225), .ZN(n221) );
  AOI221_X1 U81 ( .B1(\RegFile[8][0] ), .B2(n17), .C1(\RegFile[9][0] ), .C2(n9), .A(n228), .ZN(n224) );
  AOI221_X1 U82 ( .B1(\RegFile[12][0] ), .B2(n15), .C1(\RegFile[13][0] ), .C2(
        n9), .A(n231), .ZN(n222) );
  OAI22_X1 U83 ( .A1(n7), .A2(n112), .B1(n5), .B2(n104), .ZN(n228) );
  OAI22_X1 U84 ( .A1(n238), .A2(n223), .B1(n239), .B2(n225), .ZN(n237) );
  AOI221_X1 U85 ( .B1(\RegFile[12][1] ), .B2(n17), .C1(\RegFile[13][1] ), .C2(
        n9), .A(n241), .ZN(n238) );
  AOI221_X1 U86 ( .B1(\RegFile[8][1] ), .B2(n15), .C1(\RegFile[9][1] ), .C2(n9), .A(n240), .ZN(n239) );
  OAI22_X1 U87 ( .A1(n7), .A2(n143), .B1(n5), .B2(n135), .ZN(n241) );
  OAI22_X1 U88 ( .A1(n248), .A2(n223), .B1(n249), .B2(n225), .ZN(n247) );
  AOI221_X1 U89 ( .B1(\RegFile[12][2] ), .B2(n17), .C1(\RegFile[13][2] ), .C2(
        n11), .A(n251), .ZN(n248) );
  AOI221_X1 U90 ( .B1(\RegFile[8][2] ), .B2(n15), .C1(\RegFile[9][2] ), .C2(
        n11), .A(n250), .ZN(n249) );
  OAI22_X1 U91 ( .A1(n7), .A2(n142), .B1(n5), .B2(n134), .ZN(n251) );
  OAI22_X1 U92 ( .A1(n258), .A2(n223), .B1(n259), .B2(n225), .ZN(n257) );
  AOI221_X1 U93 ( .B1(\RegFile[12][3] ), .B2(n17), .C1(\RegFile[13][3] ), .C2(
        n11), .A(n261), .ZN(n258) );
  AOI221_X1 U94 ( .B1(\RegFile[8][3] ), .B2(n17), .C1(\RegFile[9][3] ), .C2(
        n11), .A(n260), .ZN(n259) );
  OAI22_X1 U95 ( .A1(n7), .A2(n141), .B1(n5), .B2(n133), .ZN(n261) );
  OAI22_X1 U96 ( .A1(n268), .A2(n223), .B1(n269), .B2(n225), .ZN(n267) );
  AOI221_X1 U97 ( .B1(\RegFile[12][4] ), .B2(n17), .C1(\RegFile[13][4] ), .C2(
        n9), .A(n271), .ZN(n268) );
  AOI221_X1 U98 ( .B1(\RegFile[8][4] ), .B2(n17), .C1(\RegFile[9][4] ), .C2(n9), .A(n270), .ZN(n269) );
  OAI22_X1 U99 ( .A1(n7), .A2(n140), .B1(n5), .B2(n132), .ZN(n271) );
  OAI22_X1 U100 ( .A1(n278), .A2(n223), .B1(n279), .B2(n225), .ZN(n277) );
  AOI221_X1 U101 ( .B1(\RegFile[12][5] ), .B2(n17), .C1(\RegFile[13][5] ), 
        .C2(n9), .A(n281), .ZN(n278) );
  AOI221_X1 U102 ( .B1(\RegFile[8][5] ), .B2(n17), .C1(\RegFile[9][5] ), .C2(
        n9), .A(n280), .ZN(n279) );
  OAI22_X1 U103 ( .A1(n7), .A2(n139), .B1(n5), .B2(n131), .ZN(n281) );
  OAI22_X1 U104 ( .A1(n288), .A2(n223), .B1(n289), .B2(n225), .ZN(n287) );
  AOI221_X1 U105 ( .B1(\RegFile[12][6] ), .B2(n17), .C1(\RegFile[13][6] ), 
        .C2(n9), .A(n291), .ZN(n288) );
  AOI221_X1 U107 ( .B1(\RegFile[8][6] ), .B2(n17), .C1(\RegFile[9][6] ), .C2(
        n9), .A(n290), .ZN(n289) );
  OAI22_X1 U108 ( .A1(n7), .A2(n138), .B1(n5), .B2(n130), .ZN(n291) );
  OAI22_X1 U109 ( .A1(n299), .A2(n223), .B1(n300), .B2(n225), .ZN(n298) );
  AOI221_X1 U110 ( .B1(\RegFile[8][7] ), .B2(n17), .C1(\RegFile[9][7] ), .C2(
        n9), .A(n301), .ZN(n300) );
  AOI221_X1 U111 ( .B1(\RegFile[12][7] ), .B2(n15), .C1(\RegFile[13][7] ), 
        .C2(n9), .A(n302), .ZN(n299) );
  OAI22_X1 U112 ( .A1(n7), .A2(n105), .B1(n5), .B2(n97), .ZN(n301) );
  OAI22_X1 U113 ( .A1(n305), .A2(n193), .B1(n183), .B2(n144), .ZN(n397) );
  OAI22_X1 U114 ( .A1(n305), .A2(n194), .B1(n183), .B2(n143), .ZN(n398) );
  OAI22_X1 U115 ( .A1(n305), .A2(n196), .B1(n183), .B2(n142), .ZN(n399) );
  OAI22_X1 U116 ( .A1(n305), .A2(n229), .B1(n183), .B2(n141), .ZN(n400) );
  OAI22_X1 U117 ( .A1(n305), .A2(n230), .B1(n183), .B2(n140), .ZN(n401) );
  OAI22_X1 U118 ( .A1(n305), .A2(n469), .B1(n183), .B2(n139), .ZN(n402) );
  OAI22_X1 U119 ( .A1(n305), .A2(n470), .B1(n183), .B2(n138), .ZN(n403) );
  OAI22_X1 U120 ( .A1(n305), .A2(n471), .B1(n183), .B2(n137), .ZN(n404) );
  INV_X1 U121 ( .A(n204), .ZN(n479) );
  AOI22_X1 U122 ( .A1(n45), .A2(\RegFile[0][6] ), .B1(n29), .B2(REG0[6]), .ZN(
        n204) );
  OAI22_X1 U123 ( .A1(n193), .A2(n380), .B1(n121), .B2(n16), .ZN(n461) );
  OAI22_X1 U124 ( .A1(n194), .A2(n380), .B1(n121), .B2(n14), .ZN(n462) );
  OAI22_X1 U125 ( .A1(n196), .A2(n380), .B1(n121), .B2(n12), .ZN(n463) );
  OAI22_X1 U126 ( .A1(n229), .A2(n380), .B1(n121), .B2(n10), .ZN(n464) );
  OAI22_X1 U127 ( .A1(n230), .A2(n380), .B1(n121), .B2(n8), .ZN(n465) );
  OAI22_X1 U128 ( .A1(n469), .A2(n380), .B1(n121), .B2(n6), .ZN(n466) );
  OAI22_X1 U129 ( .A1(n470), .A2(n380), .B1(n121), .B2(n4), .ZN(n467) );
  OAI22_X1 U130 ( .A1(n471), .A2(n380), .B1(n121), .B2(n2), .ZN(n468) );
  OAI22_X1 U131 ( .A1(n193), .A2(n377), .B1(n56), .B2(n40), .ZN(n445) );
  OAI22_X1 U132 ( .A1(n194), .A2(n377), .B1(n56), .B2(n39), .ZN(n446) );
  OAI22_X1 U133 ( .A1(n196), .A2(n377), .B1(n56), .B2(n38), .ZN(n447) );
  OAI22_X1 U134 ( .A1(n229), .A2(n377), .B1(n56), .B2(n37), .ZN(n448) );
  OAI22_X1 U135 ( .A1(n230), .A2(n377), .B1(n56), .B2(n36), .ZN(n449) );
  OAI22_X1 U136 ( .A1(n469), .A2(n377), .B1(n56), .B2(n35), .ZN(n450) );
  OAI22_X1 U137 ( .A1(n470), .A2(n377), .B1(n56), .B2(n34), .ZN(n451) );
  OAI22_X1 U138 ( .A1(n471), .A2(n377), .B1(n56), .B2(n33), .ZN(n452) );
  OAI22_X1 U139 ( .A1(n193), .A2(n307), .B1(n59), .B2(n136), .ZN(n405) );
  OAI22_X1 U140 ( .A1(n194), .A2(n307), .B1(n59), .B2(n135), .ZN(n406) );
  OAI22_X1 U141 ( .A1(n196), .A2(n307), .B1(n59), .B2(n134), .ZN(n407) );
  OAI22_X1 U142 ( .A1(n229), .A2(n307), .B1(n59), .B2(n133), .ZN(n408) );
  OAI22_X1 U143 ( .A1(n230), .A2(n307), .B1(n59), .B2(n132), .ZN(n409) );
  OAI22_X1 U144 ( .A1(n469), .A2(n307), .B1(n59), .B2(n131), .ZN(n410) );
  OAI22_X1 U145 ( .A1(n470), .A2(n307), .B1(n59), .B2(n130), .ZN(n411) );
  OAI22_X1 U146 ( .A1(n471), .A2(n307), .B1(n59), .B2(n129), .ZN(n412) );
  OAI22_X1 U147 ( .A1(n193), .A2(n326), .B1(n182), .B2(n112), .ZN(n413) );
  OAI22_X1 U148 ( .A1(n194), .A2(n326), .B1(n182), .B2(n111), .ZN(n414) );
  OAI22_X1 U149 ( .A1(n196), .A2(n326), .B1(n182), .B2(n110), .ZN(n415) );
  OAI22_X1 U150 ( .A1(n229), .A2(n326), .B1(n182), .B2(n109), .ZN(n416) );
  OAI22_X1 U151 ( .A1(n230), .A2(n326), .B1(n182), .B2(n108), .ZN(n417) );
  OAI22_X1 U152 ( .A1(n469), .A2(n326), .B1(n182), .B2(n107), .ZN(n418) );
  OAI22_X1 U153 ( .A1(n470), .A2(n326), .B1(n182), .B2(n106), .ZN(n419) );
  OAI22_X1 U154 ( .A1(n471), .A2(n326), .B1(n182), .B2(n105), .ZN(n420) );
  OAI22_X1 U155 ( .A1(n193), .A2(n328), .B1(n58), .B2(n104), .ZN(n421) );
  OAI22_X1 U156 ( .A1(n194), .A2(n328), .B1(n58), .B2(n103), .ZN(n422) );
  OAI22_X1 U157 ( .A1(n196), .A2(n328), .B1(n58), .B2(n102), .ZN(n423) );
  OAI22_X1 U158 ( .A1(n229), .A2(n328), .B1(n58), .B2(n101), .ZN(n424) );
  OAI22_X1 U159 ( .A1(n230), .A2(n328), .B1(n58), .B2(n100), .ZN(n425) );
  OAI22_X1 U160 ( .A1(n469), .A2(n328), .B1(n58), .B2(n99), .ZN(n426) );
  OAI22_X1 U161 ( .A1(n470), .A2(n328), .B1(n58), .B2(n98), .ZN(n427) );
  OAI22_X1 U162 ( .A1(n471), .A2(n328), .B1(n58), .B2(n97), .ZN(n428) );
  OAI22_X1 U163 ( .A1(n193), .A2(n347), .B1(n181), .B2(n80), .ZN(n429) );
  OAI22_X1 U164 ( .A1(n194), .A2(n347), .B1(n181), .B2(n79), .ZN(n430) );
  OAI22_X1 U165 ( .A1(n196), .A2(n347), .B1(n181), .B2(n78), .ZN(n431) );
  OAI22_X1 U166 ( .A1(n229), .A2(n347), .B1(n181), .B2(n77), .ZN(n432) );
  OAI22_X1 U167 ( .A1(n230), .A2(n347), .B1(n181), .B2(n76), .ZN(n433) );
  OAI22_X1 U168 ( .A1(n469), .A2(n347), .B1(n181), .B2(n75), .ZN(n434) );
  OAI22_X1 U169 ( .A1(n470), .A2(n347), .B1(n181), .B2(n74), .ZN(n435) );
  OAI22_X1 U170 ( .A1(n471), .A2(n347), .B1(n181), .B2(n73), .ZN(n436) );
  OAI22_X1 U171 ( .A1(n193), .A2(n349), .B1(n57), .B2(n72), .ZN(n437) );
  OAI22_X1 U172 ( .A1(n194), .A2(n349), .B1(n57), .B2(n71), .ZN(n438) );
  OAI22_X1 U173 ( .A1(n196), .A2(n349), .B1(n57), .B2(n70), .ZN(n439) );
  OAI22_X1 U174 ( .A1(n229), .A2(n349), .B1(n57), .B2(n69), .ZN(n440) );
  OAI22_X1 U175 ( .A1(n230), .A2(n349), .B1(n57), .B2(n68), .ZN(n441) );
  OAI22_X1 U176 ( .A1(n469), .A2(n349), .B1(n57), .B2(n67), .ZN(n442) );
  OAI22_X1 U177 ( .A1(n470), .A2(n349), .B1(n57), .B2(n66), .ZN(n443) );
  OAI22_X1 U178 ( .A1(n471), .A2(n349), .B1(n57), .B2(n65), .ZN(n444) );
  OAI22_X1 U179 ( .A1(n215), .A2(n152), .B1(n216), .B2(n472), .ZN(n389) );
  AOI221_X1 U180 ( .B1(n217), .B2(n218), .C1(n219), .C2(n220), .A(n221), .ZN(
        n216) );
  OAI221_X1 U181 ( .B1(n16), .B2(n19), .C1(n32), .C2(n13), .A(n233), .ZN(n218)
         );
  OAI221_X1 U182 ( .B1(n5), .B2(n72), .C1(n7), .C2(n80), .A(n232), .ZN(n220)
         );
  OAI22_X1 U183 ( .A1(n215), .A2(n151), .B1(n234), .B2(n472), .ZN(n390) );
  AOI221_X1 U184 ( .B1(n217), .B2(n235), .C1(n219), .C2(n236), .A(n237), .ZN(
        n234) );
  OAI221_X1 U185 ( .B1(n14), .B2(n19), .C1(n30), .C2(n13), .A(n243), .ZN(n235)
         );
  OAI221_X1 U186 ( .B1(n5), .B2(n71), .C1(n7), .C2(n79), .A(n242), .ZN(n236)
         );
  OAI22_X1 U187 ( .A1(n215), .A2(n150), .B1(n244), .B2(n472), .ZN(n391) );
  AOI221_X1 U188 ( .B1(n217), .B2(n245), .C1(n219), .C2(n246), .A(n247), .ZN(
        n244) );
  OAI221_X1 U189 ( .B1(n12), .B2(n19), .C1(n28), .C2(n13), .A(n253), .ZN(n245)
         );
  OAI221_X1 U190 ( .B1(n5), .B2(n70), .C1(n7), .C2(n78), .A(n252), .ZN(n246)
         );
  OAI22_X1 U191 ( .A1(n215), .A2(n149), .B1(n254), .B2(n472), .ZN(n392) );
  AOI221_X1 U192 ( .B1(n217), .B2(n255), .C1(n219), .C2(n256), .A(n257), .ZN(
        n254) );
  OAI221_X1 U193 ( .B1(n10), .B2(n19), .C1(n26), .C2(n13), .A(n263), .ZN(n255)
         );
  OAI221_X1 U194 ( .B1(n5), .B2(n69), .C1(n7), .C2(n77), .A(n262), .ZN(n256)
         );
  OAI22_X1 U195 ( .A1(n215), .A2(n148), .B1(n264), .B2(n472), .ZN(n393) );
  AOI221_X1 U196 ( .B1(n217), .B2(n265), .C1(n219), .C2(n266), .A(n267), .ZN(
        n264) );
  OAI221_X1 U197 ( .B1(n8), .B2(n19), .C1(n24), .C2(n13), .A(n273), .ZN(n265)
         );
  OAI221_X1 U198 ( .B1(n5), .B2(n68), .C1(n7), .C2(n76), .A(n272), .ZN(n266)
         );
  OAI22_X1 U199 ( .A1(n215), .A2(n147), .B1(n274), .B2(n472), .ZN(n394) );
  AOI221_X1 U200 ( .B1(n217), .B2(n275), .C1(n219), .C2(n276), .A(n277), .ZN(
        n274) );
  OAI221_X1 U201 ( .B1(n6), .B2(n19), .C1(n22), .C2(n13), .A(n283), .ZN(n275)
         );
  OAI221_X1 U202 ( .B1(n5), .B2(n67), .C1(n7), .C2(n75), .A(n282), .ZN(n276)
         );
  OAI22_X1 U203 ( .A1(n215), .A2(n146), .B1(n284), .B2(n472), .ZN(n395) );
  AOI221_X1 U204 ( .B1(n217), .B2(n285), .C1(n219), .C2(n286), .A(n287), .ZN(
        n284) );
  OAI221_X1 U205 ( .B1(n4), .B2(n19), .C1(n20), .C2(n13), .A(n293), .ZN(n285)
         );
  OAI221_X1 U206 ( .B1(n5), .B2(n66), .C1(n7), .C2(n74), .A(n292), .ZN(n286)
         );
  OAI22_X1 U207 ( .A1(n294), .A2(n472), .B1(n215), .B2(n145), .ZN(n396) );
  AOI221_X1 U208 ( .B1(n217), .B2(n296), .C1(n219), .C2(n297), .A(n298), .ZN(
        n294) );
  OAI221_X1 U209 ( .B1(n2), .B2(n19), .C1(n18), .C2(n13), .A(n304), .ZN(n296)
         );
  OAI221_X1 U210 ( .B1(n5), .B2(n65), .C1(n7), .C2(n73), .A(n303), .ZN(n297)
         );
  INV_X1 U211 ( .A(n368), .ZN(n184) );
  AOI22_X1 U212 ( .A1(WrData[0]), .A2(n192), .B1(n369), .B2(\RegFile[3][0] ), 
        .ZN(n368) );
  INV_X1 U213 ( .A(n370), .ZN(n185) );
  AOI22_X1 U214 ( .A1(WrData[1]), .A2(n192), .B1(n369), .B2(\RegFile[3][1] ), 
        .ZN(n370) );
  INV_X1 U215 ( .A(n371), .ZN(n186) );
  AOI22_X1 U216 ( .A1(WrData[2]), .A2(n192), .B1(n369), .B2(\RegFile[3][2] ), 
        .ZN(n371) );
  INV_X1 U217 ( .A(n372), .ZN(n187) );
  AOI22_X1 U218 ( .A1(WrData[3]), .A2(n192), .B1(n369), .B2(\RegFile[3][3] ), 
        .ZN(n372) );
  INV_X1 U219 ( .A(n207), .ZN(n482) );
  AOI22_X1 U220 ( .A1(n45), .A2(\RegFile[1][0] ), .B1(n29), .B2(REG1[0]), .ZN(
        n207) );
  INV_X1 U221 ( .A(n213), .ZN(n488) );
  AOI22_X1 U222 ( .A1(n47), .A2(\RegFile[1][6] ), .B1(n29), .B2(REG1[6]), .ZN(
        n213) );
  INV_X1 U223 ( .A(n208), .ZN(n483) );
  AOI22_X1 U224 ( .A1(n46), .A2(\RegFile[1][1] ), .B1(n29), .B2(REG1[1]), .ZN(
        n208) );
  INV_X1 U225 ( .A(n210), .ZN(n485) );
  AOI22_X1 U226 ( .A1(n44), .A2(\RegFile[1][3] ), .B1(n29), .B2(REG1[3]), .ZN(
        n210) );
  INV_X1 U227 ( .A(n212), .ZN(n487) );
  AOI22_X1 U228 ( .A1(n47), .A2(\RegFile[1][5] ), .B1(n29), .B2(REG1[5]), .ZN(
        n212) );
  INV_X1 U229 ( .A(n209), .ZN(n484) );
  AOI22_X1 U230 ( .A1(n46), .A2(\RegFile[1][2] ), .B1(n29), .B2(REG1[2]), .ZN(
        n209) );
  INV_X1 U231 ( .A(n211), .ZN(n486) );
  AOI22_X1 U232 ( .A1(n46), .A2(\RegFile[1][4] ), .B1(n29), .B2(REG1[4]), .ZN(
        n211) );
  OAI22_X1 U233 ( .A1(n193), .A2(n379), .B1(n60), .B2(n32), .ZN(n453) );
  OAI22_X1 U234 ( .A1(n194), .A2(n379), .B1(n60), .B2(n30), .ZN(n454) );
  OAI22_X1 U235 ( .A1(n196), .A2(n379), .B1(n60), .B2(n28), .ZN(n455) );
  OAI22_X1 U236 ( .A1(n229), .A2(n379), .B1(n60), .B2(n26), .ZN(n456) );
  OAI22_X1 U237 ( .A1(n230), .A2(n379), .B1(n60), .B2(n24), .ZN(n457) );
  OAI22_X1 U238 ( .A1(n469), .A2(n379), .B1(n60), .B2(n22), .ZN(n458) );
  OAI22_X1 U239 ( .A1(n470), .A2(n379), .B1(n60), .B2(n20), .ZN(n459) );
  OAI22_X1 U240 ( .A1(n471), .A2(n379), .B1(n60), .B2(n18), .ZN(n460) );
  AOI22_X1 U241 ( .A1(\RegFile[4][0] ), .A2(n15), .B1(\RegFile[5][0] ), .B2(
        n11), .ZN(n232) );
  AOI22_X1 U242 ( .A1(\RegFile[4][1] ), .A2(n15), .B1(\RegFile[5][1] ), .B2(
        n11), .ZN(n242) );
  AOI22_X1 U243 ( .A1(\RegFile[4][2] ), .A2(n15), .B1(\RegFile[5][2] ), .B2(
        n11), .ZN(n252) );
  AOI22_X1 U244 ( .A1(\RegFile[4][3] ), .A2(n15), .B1(\RegFile[5][3] ), .B2(
        n11), .ZN(n262) );
  AOI22_X1 U245 ( .A1(\RegFile[4][4] ), .A2(n15), .B1(\RegFile[5][4] ), .B2(
        n11), .ZN(n272) );
  AOI22_X1 U246 ( .A1(\RegFile[4][5] ), .A2(n15), .B1(\RegFile[5][5] ), .B2(
        n11), .ZN(n282) );
  AOI22_X1 U247 ( .A1(\RegFile[4][6] ), .A2(n15), .B1(\RegFile[5][6] ), .B2(
        n11), .ZN(n292) );
  AOI22_X1 U248 ( .A1(\RegFile[4][7] ), .A2(n15), .B1(\RegFile[5][7] ), .B2(
        n11), .ZN(n303) );
  OAI22_X1 U249 ( .A1(n27), .A2(n40), .B1(n42), .B2(n161), .ZN(n381) );
  OAI22_X1 U250 ( .A1(n27), .A2(n33), .B1(n42), .B2(n154), .ZN(n388) );
  OAI22_X1 U251 ( .A1(n27), .A2(n39), .B1(n31), .B2(n160), .ZN(n382) );
  OAI22_X1 U252 ( .A1(n27), .A2(n38), .B1(n31), .B2(n159), .ZN(n383) );
  OAI22_X1 U253 ( .A1(n27), .A2(n37), .B1(n31), .B2(n158), .ZN(n384) );
  OAI22_X1 U254 ( .A1(n27), .A2(n36), .B1(n41), .B2(n157), .ZN(n385) );
  OAI22_X1 U255 ( .A1(n27), .A2(n35), .B1(n41), .B2(n156), .ZN(n386) );
  OAI22_X1 U256 ( .A1(n27), .A2(n34), .B1(n41), .B2(n155), .ZN(n387) );
  INV_X1 U257 ( .A(n313), .ZN(n115) );
  AOI22_X1 U258 ( .A1(WrData[4]), .A2(n119), .B1(n309), .B2(\RegFile[13][4] ), 
        .ZN(n313) );
  INV_X1 U259 ( .A(n314), .ZN(n116) );
  AOI22_X1 U260 ( .A1(WrData[5]), .A2(n119), .B1(n309), .B2(\RegFile[13][5] ), 
        .ZN(n314) );
  AOI22_X1 U261 ( .A1(n3), .A2(\RegFile[2][0] ), .B1(\RegFile[3][0] ), .B2(n1), 
        .ZN(n233) );
  AOI22_X1 U262 ( .A1(n3), .A2(\RegFile[2][1] ), .B1(\RegFile[3][1] ), .B2(n1), 
        .ZN(n243) );
  AOI22_X1 U263 ( .A1(n3), .A2(\RegFile[2][2] ), .B1(\RegFile[3][2] ), .B2(n1), 
        .ZN(n253) );
  AOI22_X1 U264 ( .A1(n3), .A2(\RegFile[2][3] ), .B1(\RegFile[3][3] ), .B2(n1), 
        .ZN(n263) );
  AOI22_X1 U265 ( .A1(n3), .A2(\RegFile[2][4] ), .B1(\RegFile[3][4] ), .B2(n1), 
        .ZN(n273) );
  AOI22_X1 U266 ( .A1(n3), .A2(\RegFile[2][5] ), .B1(\RegFile[3][5] ), .B2(n1), 
        .ZN(n283) );
  AOI22_X1 U267 ( .A1(n3), .A2(\RegFile[2][6] ), .B1(\RegFile[3][6] ), .B2(n1), 
        .ZN(n293) );
  AOI22_X1 U268 ( .A1(n3), .A2(\RegFile[2][7] ), .B1(\RegFile[3][7] ), .B2(n1), 
        .ZN(n304) );
  INV_X1 U269 ( .A(n205), .ZN(n480) );
  AOI22_X1 U270 ( .A1(n45), .A2(\RegFile[0][7] ), .B1(n29), .B2(REG0[7]), .ZN(
        n205) );
  INV_X1 U271 ( .A(n199), .ZN(n474) );
  AOI22_X1 U272 ( .A1(n43), .A2(\RegFile[0][1] ), .B1(n27), .B2(REG0[1]), .ZN(
        n199) );
  INV_X1 U273 ( .A(n200), .ZN(n475) );
  AOI22_X1 U274 ( .A1(n43), .A2(\RegFile[0][2] ), .B1(n29), .B2(REG0[2]), .ZN(
        n200) );
  INV_X1 U275 ( .A(n201), .ZN(n476) );
  AOI22_X1 U276 ( .A1(n43), .A2(\RegFile[0][3] ), .B1(n29), .B2(REG0[3]), .ZN(
        n201) );
  INV_X1 U277 ( .A(n202), .ZN(n477) );
  AOI22_X1 U278 ( .A1(n44), .A2(\RegFile[0][4] ), .B1(n29), .B2(REG0[4]), .ZN(
        n202) );
  INV_X1 U279 ( .A(n203), .ZN(n478) );
  AOI22_X1 U280 ( .A1(n44), .A2(\RegFile[0][5] ), .B1(n29), .B2(REG0[5]), .ZN(
        n203) );
  INV_X1 U281 ( .A(n198), .ZN(n473) );
  AOI22_X1 U282 ( .A1(n42), .A2(\RegFile[0][0] ), .B1(n27), .B2(REG0[0]), .ZN(
        n198) );
  INV_X1 U283 ( .A(n312), .ZN(n114) );
  AOI22_X1 U284 ( .A1(WrData[3]), .A2(n119), .B1(n309), .B2(\RegFile[13][3] ), 
        .ZN(n312) );
  INV_X1 U285 ( .A(n321), .ZN(n175) );
  AOI22_X1 U286 ( .A1(WrData[3]), .A2(n180), .B1(n318), .B2(\RegFile[12][3] ), 
        .ZN(n321) );
  INV_X1 U287 ( .A(n333), .ZN(n89) );
  AOI22_X1 U288 ( .A1(WrData[3]), .A2(n94), .B1(n330), .B2(\RegFile[9][3] ), 
        .ZN(n333) );
  INV_X1 U289 ( .A(n342), .ZN(n166) );
  AOI22_X1 U290 ( .A1(WrData[3]), .A2(n171), .B1(n339), .B2(\RegFile[8][3] ), 
        .ZN(n342) );
  INV_X1 U291 ( .A(n354), .ZN(n64) );
  AOI22_X1 U292 ( .A1(WrData[3]), .A2(n85), .B1(n351), .B2(\RegFile[5][3] ), 
        .ZN(n354) );
  INV_X1 U293 ( .A(n363), .ZN(n125) );
  AOI22_X1 U294 ( .A1(WrData[3]), .A2(n162), .B1(n360), .B2(\RegFile[4][3] ), 
        .ZN(n363) );
  INV_X1 U295 ( .A(n308), .ZN(n95) );
  AOI22_X1 U296 ( .A1(WrData[0]), .A2(n119), .B1(n309), .B2(\RegFile[13][0] ), 
        .ZN(n308) );
  INV_X1 U297 ( .A(n310), .ZN(n96) );
  AOI22_X1 U298 ( .A1(WrData[1]), .A2(n119), .B1(n309), .B2(\RegFile[13][1] ), 
        .ZN(n310) );
  INV_X1 U299 ( .A(n311), .ZN(n113) );
  AOI22_X1 U300 ( .A1(WrData[2]), .A2(n119), .B1(n309), .B2(\RegFile[13][2] ), 
        .ZN(n311) );
  INV_X1 U301 ( .A(n317), .ZN(n172) );
  AOI22_X1 U302 ( .A1(WrData[0]), .A2(n180), .B1(n318), .B2(\RegFile[12][0] ), 
        .ZN(n317) );
  INV_X1 U303 ( .A(n319), .ZN(n173) );
  AOI22_X1 U304 ( .A1(WrData[1]), .A2(n180), .B1(n318), .B2(\RegFile[12][1] ), 
        .ZN(n319) );
  INV_X1 U305 ( .A(n320), .ZN(n174) );
  AOI22_X1 U306 ( .A1(WrData[2]), .A2(n180), .B1(n318), .B2(\RegFile[12][2] ), 
        .ZN(n320) );
  INV_X1 U307 ( .A(n329), .ZN(n86) );
  AOI22_X1 U308 ( .A1(WrData[0]), .A2(n94), .B1(n330), .B2(\RegFile[9][0] ), 
        .ZN(n329) );
  INV_X1 U309 ( .A(n331), .ZN(n87) );
  AOI22_X1 U310 ( .A1(WrData[1]), .A2(n94), .B1(n330), .B2(\RegFile[9][1] ), 
        .ZN(n331) );
  INV_X1 U311 ( .A(n332), .ZN(n88) );
  AOI22_X1 U312 ( .A1(WrData[2]), .A2(n94), .B1(n330), .B2(\RegFile[9][2] ), 
        .ZN(n332) );
  INV_X1 U313 ( .A(n338), .ZN(n163) );
  AOI22_X1 U314 ( .A1(WrData[0]), .A2(n171), .B1(n339), .B2(\RegFile[8][0] ), 
        .ZN(n338) );
  INV_X1 U315 ( .A(n340), .ZN(n164) );
  AOI22_X1 U316 ( .A1(WrData[1]), .A2(n171), .B1(n339), .B2(\RegFile[8][1] ), 
        .ZN(n340) );
  INV_X1 U317 ( .A(n341), .ZN(n165) );
  AOI22_X1 U318 ( .A1(WrData[2]), .A2(n171), .B1(n339), .B2(\RegFile[8][2] ), 
        .ZN(n341) );
  INV_X1 U319 ( .A(n350), .ZN(n61) );
  AOI22_X1 U320 ( .A1(WrData[0]), .A2(n85), .B1(n351), .B2(\RegFile[5][0] ), 
        .ZN(n350) );
  INV_X1 U321 ( .A(n352), .ZN(n62) );
  AOI22_X1 U322 ( .A1(WrData[1]), .A2(n85), .B1(n351), .B2(\RegFile[5][1] ), 
        .ZN(n352) );
  INV_X1 U323 ( .A(n353), .ZN(n63) );
  AOI22_X1 U324 ( .A1(WrData[2]), .A2(n85), .B1(n351), .B2(\RegFile[5][2] ), 
        .ZN(n353) );
  INV_X1 U325 ( .A(n359), .ZN(n122) );
  AOI22_X1 U326 ( .A1(WrData[0]), .A2(n162), .B1(n360), .B2(\RegFile[4][0] ), 
        .ZN(n359) );
  INV_X1 U327 ( .A(n361), .ZN(n123) );
  AOI22_X1 U328 ( .A1(WrData[1]), .A2(n162), .B1(n360), .B2(\RegFile[4][1] ), 
        .ZN(n361) );
  INV_X1 U329 ( .A(n362), .ZN(n124) );
  AOI22_X1 U330 ( .A1(WrData[2]), .A2(n162), .B1(n360), .B2(\RegFile[4][2] ), 
        .ZN(n362) );
  INV_X1 U331 ( .A(n315), .ZN(n117) );
  AOI22_X1 U332 ( .A1(WrData[6]), .A2(n119), .B1(n309), .B2(\RegFile[13][6] ), 
        .ZN(n315) );
  INV_X1 U333 ( .A(n316), .ZN(n118) );
  AOI22_X1 U334 ( .A1(WrData[7]), .A2(n119), .B1(n309), .B2(\RegFile[13][7] ), 
        .ZN(n316) );
  INV_X1 U335 ( .A(n324), .ZN(n178) );
  AOI22_X1 U336 ( .A1(WrData[6]), .A2(n180), .B1(n318), .B2(\RegFile[12][6] ), 
        .ZN(n324) );
  INV_X1 U337 ( .A(n325), .ZN(n179) );
  AOI22_X1 U338 ( .A1(WrData[7]), .A2(n180), .B1(n318), .B2(\RegFile[12][7] ), 
        .ZN(n325) );
  INV_X1 U339 ( .A(n336), .ZN(n92) );
  AOI22_X1 U340 ( .A1(WrData[6]), .A2(n94), .B1(n330), .B2(\RegFile[9][6] ), 
        .ZN(n336) );
  INV_X1 U341 ( .A(n337), .ZN(n93) );
  AOI22_X1 U342 ( .A1(WrData[7]), .A2(n94), .B1(n330), .B2(\RegFile[9][7] ), 
        .ZN(n337) );
  INV_X1 U343 ( .A(n345), .ZN(n169) );
  AOI22_X1 U344 ( .A1(WrData[6]), .A2(n171), .B1(n339), .B2(\RegFile[8][6] ), 
        .ZN(n345) );
  INV_X1 U345 ( .A(n346), .ZN(n170) );
  AOI22_X1 U346 ( .A1(WrData[7]), .A2(n171), .B1(n339), .B2(\RegFile[8][7] ), 
        .ZN(n346) );
  INV_X1 U347 ( .A(n357), .ZN(n83) );
  AOI22_X1 U348 ( .A1(WrData[6]), .A2(n85), .B1(n351), .B2(\RegFile[5][6] ), 
        .ZN(n357) );
  INV_X1 U349 ( .A(n358), .ZN(n84) );
  AOI22_X1 U350 ( .A1(WrData[7]), .A2(n85), .B1(n351), .B2(\RegFile[5][7] ), 
        .ZN(n358) );
  INV_X1 U351 ( .A(n366), .ZN(n128) );
  AOI22_X1 U352 ( .A1(WrData[6]), .A2(n162), .B1(n360), .B2(\RegFile[4][6] ), 
        .ZN(n366) );
  INV_X1 U353 ( .A(n367), .ZN(n153) );
  AOI22_X1 U354 ( .A1(WrData[7]), .A2(n162), .B1(n360), .B2(\RegFile[4][7] ), 
        .ZN(n367) );
  INV_X1 U355 ( .A(n375), .ZN(n190) );
  AOI22_X1 U356 ( .A1(WrData[6]), .A2(n192), .B1(n369), .B2(\RegFile[3][6] ), 
        .ZN(n375) );
  INV_X1 U357 ( .A(n376), .ZN(n191) );
  AOI22_X1 U358 ( .A1(WrData[7]), .A2(n192), .B1(n369), .B2(\RegFile[3][7] ), 
        .ZN(n376) );
  INV_X1 U359 ( .A(n214), .ZN(n489) );
  AOI22_X1 U360 ( .A1(n47), .A2(\RegFile[1][7] ), .B1(n27), .B2(REG1[7]), .ZN(
        n214) );
  INV_X1 U361 ( .A(n373), .ZN(n188) );
  AOI22_X1 U362 ( .A1(WrData[4]), .A2(n192), .B1(n369), .B2(\RegFile[3][4] ), 
        .ZN(n373) );
  INV_X1 U365 ( .A(n374), .ZN(n189) );
  AOI22_X1 U366 ( .A1(WrData[5]), .A2(n192), .B1(n369), .B2(\RegFile[3][5] ), 
        .ZN(n374) );
  INV_X1 U367 ( .A(n206), .ZN(n481) );
  AOI22_X1 U370 ( .A1(n27), .A2(RdData_Valid), .B1(n48), .B2(RdEn), .ZN(n206)
         );
  INV_X1 U371 ( .A(n334), .ZN(n90) );
  AOI22_X1 U372 ( .A1(WrData[4]), .A2(n94), .B1(n330), .B2(\RegFile[9][4] ), 
        .ZN(n334) );
  INV_X1 U375 ( .A(n335), .ZN(n91) );
  AOI22_X1 U376 ( .A1(WrData[5]), .A2(n94), .B1(n330), .B2(\RegFile[9][5] ), 
        .ZN(n335) );
  INV_X1 U377 ( .A(n355), .ZN(n81) );
  AOI22_X1 U379 ( .A1(WrData[4]), .A2(n85), .B1(n351), .B2(\RegFile[5][4] ), 
        .ZN(n355) );
  INV_X1 U380 ( .A(n356), .ZN(n82) );
  AOI22_X1 U383 ( .A1(WrData[5]), .A2(n85), .B1(n351), .B2(\RegFile[5][5] ), 
        .ZN(n356) );
  INV_X1 U384 ( .A(n322), .ZN(n176) );
  AOI22_X1 U385 ( .A1(WrData[4]), .A2(n180), .B1(n318), .B2(\RegFile[12][4] ), 
        .ZN(n322) );
  INV_X1 U386 ( .A(n323), .ZN(n177) );
  AOI22_X1 U387 ( .A1(WrData[5]), .A2(n180), .B1(n318), .B2(\RegFile[12][5] ), 
        .ZN(n323) );
  INV_X1 U388 ( .A(n343), .ZN(n167) );
  AOI22_X1 U389 ( .A1(WrData[4]), .A2(n171), .B1(n339), .B2(\RegFile[8][4] ), 
        .ZN(n343) );
  INV_X1 U390 ( .A(n344), .ZN(n168) );
  AOI22_X1 U391 ( .A1(WrData[5]), .A2(n171), .B1(n339), .B2(\RegFile[8][5] ), 
        .ZN(n344) );
  INV_X1 U392 ( .A(n364), .ZN(n126) );
  AOI22_X1 U393 ( .A1(WrData[4]), .A2(n162), .B1(n360), .B2(\RegFile[4][4] ), 
        .ZN(n364) );
  INV_X1 U394 ( .A(n365), .ZN(n127) );
  AOI22_X1 U395 ( .A1(WrData[5]), .A2(n162), .B1(n360), .B2(\RegFile[4][5] ), 
        .ZN(n365) );
  INV_X1 U396 ( .A(n3), .ZN(n5) );
  INV_X1 U397 ( .A(n1), .ZN(n7) );
  INV_X1 U398 ( .A(n227), .ZN(n13) );
  INV_X1 U399 ( .A(n226), .ZN(n19) );
  INV_X1 U400 ( .A(n55), .ZN(n49) );
  INV_X1 U401 ( .A(n55), .ZN(n50) );
  INV_X1 U402 ( .A(n55), .ZN(n51) );
  INV_X1 U403 ( .A(n55), .ZN(n52) );
  INV_X1 U404 ( .A(n55), .ZN(n53) );
  INV_X1 U405 ( .A(n55), .ZN(n54) );
endmodule


module FSM ( CLK, RST, SData, StartError, ParityError, ParityEn, StopError, 
        BitCounter, EdgeCounter, CounterEnable, ParityCheckEn, StartCheckEn, 
        StopCheckEn, DeserializerEn, DataValid, OutData );
  input [3:0] BitCounter;
  input [2:0] EdgeCounter;
  input CLK, RST, SData, StartError, ParityError, ParityEn, StopError;
  output CounterEnable, ParityCheckEn, StartCheckEn, StopCheckEn,
         DeserializerEn, DataValid, OutData;
  wire   n3, n4, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n18, n19, n20,
         n21, n22, n23, n1, n2, n5, n7;
  wire   [2:0] PresentState;
  wire   [2:0] NextState;

  DFFR_X1 \PresentState_reg[0]  ( .D(NextState[0]), .CK(CLK), .RN(RST), .Q(
        PresentState[0]) );
  NAND2_X1 U32 ( .A1(n21), .A2(n8), .ZN(CounterEnable) );
  DFFR_X1 \PresentState_reg[2]  ( .D(NextState[2]), .CK(CLK), .RN(RST), .Q(
        PresentState[2]), .QN(n3) );
  DFFR_X1 \PresentState_reg[1]  ( .D(NextState[1]), .CK(CLK), .RN(RST), .Q(
        PresentState[1]), .QN(n4) );
  INV_X1 U3 ( .A(n8), .ZN(n7) );
  OAI21_X1 U4 ( .B1(n11), .B2(n8), .A(n21), .ZN(NextState[0]) );
  NOR2_X1 U5 ( .A1(n9), .A2(n14), .ZN(DeserializerEn) );
  INV_X1 U6 ( .A(n10), .ZN(OutData) );
  NOR2_X1 U7 ( .A1(n19), .A2(n9), .ZN(StartCheckEn) );
  NAND3_X1 U8 ( .A1(EdgeCounter[1]), .A2(EdgeCounter[0]), .A3(EdgeCounter[2]), 
        .ZN(n9) );
  NAND3_X1 U9 ( .A1(PresentState[0]), .A2(n4), .A3(PresentState[2]), .ZN(n8)
         );
  NOR2_X1 U10 ( .A1(n9), .A2(n10), .ZN(ParityCheckEn) );
  OAI221_X1 U11 ( .B1(n15), .B2(n14), .C1(n16), .C2(n10), .A(n17), .ZN(
        NextState[1]) );
  NOR4_X1 U12 ( .A1(n9), .A2(n20), .A3(n5), .A4(n1), .ZN(n16) );
  NAND3_X1 U13 ( .A1(StartCheckEn), .A2(n1), .A3(n18), .ZN(n17) );
  NOR3_X1 U14 ( .A1(n13), .A2(ParityEn), .A3(BitCounter[1]), .ZN(n15) );
  NOR2_X1 U15 ( .A1(n2), .A2(n13), .ZN(n11) );
  INV_X1 U16 ( .A(BitCounter[1]), .ZN(n2) );
  OR4_X1 U17 ( .A1(n5), .A2(n9), .A3(BitCounter[0]), .A4(BitCounter[2]), .ZN(
        n13) );
  AND3_X1 U18 ( .A1(n11), .A2(n7), .A3(n22), .ZN(DataValid) );
  AOI211_X1 U19 ( .C1(ParityError), .C2(ParityEn), .A(StopError), .B(
        StartError), .ZN(n22) );
  INV_X1 U20 ( .A(BitCounter[3]), .ZN(n5) );
  AND4_X1 U21 ( .A1(n23), .A2(n14), .A3(n19), .A4(n10), .ZN(n21) );
  OR3_X1 U22 ( .A1(SData), .A2(PresentState[2]), .A3(PresentState[1]), .ZN(n23) );
  NAND3_X1 U23 ( .A1(PresentState[2]), .A2(PresentState[0]), .A3(
        PresentState[1]), .ZN(n10) );
  NAND3_X1 U24 ( .A1(PresentState[0]), .A2(n3), .A3(PresentState[1]), .ZN(n14)
         );
  NOR3_X1 U25 ( .A1(BitCounter[1]), .A2(BitCounter[3]), .A3(BitCounter[2]), 
        .ZN(n18) );
  NOR2_X1 U26 ( .A1(n8), .A2(n9), .ZN(StopCheckEn) );
  NAND3_X1 U27 ( .A1(n4), .A2(n3), .A3(PresentState[0]), .ZN(n19) );
  OAI211_X1 U28 ( .C1(n11), .C2(n8), .A(n12), .B(n10), .ZN(NextState[2]) );
  OR3_X1 U29 ( .A1(n13), .A2(BitCounter[1]), .A3(n14), .ZN(n12) );
  INV_X1 U30 ( .A(BitCounter[0]), .ZN(n1) );
  OR2_X1 U31 ( .A1(BitCounter[1]), .A2(BitCounter[2]), .ZN(n20) );
endmodule


module ParityCheck ( CLK, RST, Enable, ParityEn, Data, ParityType, 
        SampledParity, ParityError );
  input [7:0] Data;
  input CLK, RST, Enable, ParityEn, ParityType, SampledParity;
  output ParityError;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13, n14, n15, n1;

  DFFR_X1 CalculatedParity_reg ( .D(n15), .CK(CLK), .RN(RST), .QN(n13) );
  XOR2_X1 U3 ( .A(n13), .B(SampledParity), .Z(n3) );
  XOR2_X1 U5 ( .A(n5), .B(ParityType), .Z(n4) );
  XOR2_X1 U6 ( .A(n6), .B(n7), .Z(n5) );
  XOR2_X1 U7 ( .A(n8), .B(n9), .Z(n7) );
  XOR2_X1 U10 ( .A(n10), .B(n11), .Z(n6) );
  XOR2_X1 U11 ( .A(Data[3]), .B(Data[2]), .Z(n11) );
  NAND2_X1 U14 ( .A1(ParityEn), .A2(Enable), .ZN(n2) );
  DFFR_X1 ParityError_reg ( .D(n14), .CK(CLK), .RN(RST), .Q(ParityError), .QN(
        n12) );
  INV_X1 U2 ( .A(n2), .ZN(n1) );
  OAI22_X1 U4 ( .A1(n12), .A2(n1), .B1(n2), .B2(n3), .ZN(n14) );
  OAI22_X1 U8 ( .A1(n13), .A2(n1), .B1(n4), .B2(n2), .ZN(n15) );
  XNOR2_X1 U9 ( .A(Data[7]), .B(Data[6]), .ZN(n8) );
  XNOR2_X1 U12 ( .A(Data[5]), .B(Data[4]), .ZN(n9) );
  XNOR2_X1 U13 ( .A(Data[1]), .B(Data[0]), .ZN(n10) );
endmodule


module StopCheck ( CLK, RST, Enable, SampledStop, StopError );
  input CLK, RST, Enable, SampledStop;
  output StopError;
  wire   n2, n3, n1;

  DFFR_X1 StopError_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(StopError), .QN(n2)
         );
  OAI22_X1 U2 ( .A1(SampledStop), .A2(n1), .B1(n2), .B2(Enable), .ZN(n3) );
  INV_X1 U3 ( .A(Enable), .ZN(n1) );
endmodule


module Deserializer ( CLK, RST, SampledBit, Enable, OutData, PData );
  output [7:0] PData;
  input CLK, RST, SampledBit, Enable, OutData;
  wire   n19, n20, n21, n22, n23, n24, n25, n26, n27, n28, n29, n30, n31, n32,
         n33, n34, n35, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n12, n13,
         n14, n15, n16, n17, n18, n36, n37;
  wire   [7:0] IntPData;

  DFFR_X1 \IntPData_reg[0]  ( .D(n10), .CK(CLK), .RN(n1), .Q(IntPData[0]) );
  DFFR_X1 \IntPData_reg[1]  ( .D(n9), .CK(CLK), .RN(n1), .Q(IntPData[1]) );
  DFFR_X1 \IntPData_reg[2]  ( .D(n8), .CK(CLK), .RN(n1), .Q(IntPData[2]) );
  DFFR_X1 \IntPData_reg[3]  ( .D(n7), .CK(CLK), .RN(n1), .Q(IntPData[3]) );
  DFFR_X1 \IntPData_reg[4]  ( .D(n6), .CK(CLK), .RN(n1), .Q(IntPData[4]) );
  DFFR_X1 \IntPData_reg[5]  ( .D(n5), .CK(CLK), .RN(n1), .Q(IntPData[5]) );
  DFFR_X1 \IntPData_reg[6]  ( .D(n4), .CK(CLK), .RN(n1), .Q(IntPData[6]) );
  DFFR_X1 \IntPData_reg[7]  ( .D(n3), .CK(CLK), .RN(n1), .Q(IntPData[7]) );
  DFFR_X1 \PData_reg[7]  ( .D(n36), .CK(CLK), .RN(n1), .Q(PData[7]) );
  DFFR_X1 \PData_reg[6]  ( .D(n18), .CK(CLK), .RN(n1), .Q(PData[6]) );
  DFFR_X1 \PData_reg[5]  ( .D(n17), .CK(CLK), .RN(n1), .Q(PData[5]) );
  DFFR_X1 \PData_reg[4]  ( .D(n16), .CK(CLK), .RN(n1), .Q(PData[4]) );
  DFFR_X1 \PData_reg[3]  ( .D(n15), .CK(CLK), .RN(n2), .Q(PData[3]) );
  DFFR_X1 \PData_reg[2]  ( .D(n14), .CK(CLK), .RN(n2), .Q(PData[2]) );
  DFFR_X1 \PData_reg[1]  ( .D(n13), .CK(CLK), .RN(n2), .Q(PData[1]) );
  DFFR_X1 \PData_reg[0]  ( .D(n12), .CK(CLK), .RN(n2), .Q(PData[0]) );
  NAND2_X1 U37 ( .A1(Enable), .A2(n37), .ZN(n28) );
  INV_X1 U3 ( .A(n28), .ZN(n11) );
  INV_X1 U4 ( .A(OutData), .ZN(n37) );
  BUF_X1 U5 ( .A(RST), .Z(n1) );
  BUF_X1 U6 ( .A(RST), .Z(n2) );
  INV_X1 U7 ( .A(n27), .ZN(n3) );
  AOI22_X1 U8 ( .A1(IntPData[6]), .A2(n11), .B1(n28), .B2(IntPData[7]), .ZN(
        n27) );
  INV_X1 U9 ( .A(n29), .ZN(n4) );
  AOI22_X1 U10 ( .A1(IntPData[5]), .A2(n11), .B1(n28), .B2(IntPData[6]), .ZN(
        n29) );
  INV_X1 U11 ( .A(n30), .ZN(n5) );
  AOI22_X1 U12 ( .A1(IntPData[4]), .A2(n11), .B1(n28), .B2(IntPData[5]), .ZN(
        n30) );
  INV_X1 U13 ( .A(n31), .ZN(n6) );
  AOI22_X1 U14 ( .A1(IntPData[3]), .A2(n11), .B1(n28), .B2(IntPData[4]), .ZN(
        n31) );
  INV_X1 U15 ( .A(n32), .ZN(n7) );
  AOI22_X1 U16 ( .A1(IntPData[2]), .A2(n11), .B1(n28), .B2(IntPData[3]), .ZN(
        n32) );
  INV_X1 U17 ( .A(n33), .ZN(n8) );
  AOI22_X1 U18 ( .A1(IntPData[1]), .A2(n11), .B1(n28), .B2(IntPData[2]), .ZN(
        n33) );
  INV_X1 U19 ( .A(n34), .ZN(n9) );
  AOI22_X1 U20 ( .A1(IntPData[0]), .A2(n11), .B1(n28), .B2(IntPData[1]), .ZN(
        n34) );
  INV_X1 U21 ( .A(n35), .ZN(n10) );
  AOI22_X1 U22 ( .A1(n11), .A2(SampledBit), .B1(n28), .B2(IntPData[0]), .ZN(
        n35) );
  INV_X1 U23 ( .A(n19), .ZN(n12) );
  AOI22_X1 U24 ( .A1(IntPData[0]), .A2(OutData), .B1(n37), .B2(PData[0]), .ZN(
        n19) );
  INV_X1 U25 ( .A(n20), .ZN(n13) );
  AOI22_X1 U26 ( .A1(OutData), .A2(IntPData[1]), .B1(n37), .B2(PData[1]), .ZN(
        n20) );
  INV_X1 U27 ( .A(n21), .ZN(n14) );
  AOI22_X1 U28 ( .A1(OutData), .A2(IntPData[2]), .B1(n37), .B2(PData[2]), .ZN(
        n21) );
  INV_X1 U29 ( .A(n22), .ZN(n15) );
  AOI22_X1 U30 ( .A1(OutData), .A2(IntPData[3]), .B1(n37), .B2(PData[3]), .ZN(
        n22) );
  INV_X1 U31 ( .A(n23), .ZN(n16) );
  AOI22_X1 U32 ( .A1(OutData), .A2(IntPData[4]), .B1(n37), .B2(PData[4]), .ZN(
        n23) );
  INV_X1 U33 ( .A(n24), .ZN(n17) );
  AOI22_X1 U34 ( .A1(OutData), .A2(IntPData[5]), .B1(n37), .B2(PData[5]), .ZN(
        n24) );
  INV_X1 U35 ( .A(n25), .ZN(n18) );
  AOI22_X1 U36 ( .A1(OutData), .A2(IntPData[6]), .B1(n37), .B2(PData[6]), .ZN(
        n25) );
  INV_X1 U38 ( .A(n26), .ZN(n36) );
  AOI22_X1 U39 ( .A1(OutData), .A2(IntPData[7]), .B1(n37), .B2(PData[7]), .ZN(
        n26) );
endmodule


module StartCheck ( CLK, RST, Enable, SampledStart, StartError );
  input CLK, RST, Enable, SampledStart;
  output StartError;
  wire   n1, n2, n3;

  NAND2_X1 U3 ( .A1(SampledStart), .A2(Enable), .ZN(n1) );
  DFFR_X1 StartError_reg ( .D(n3), .CK(CLK), .RN(RST), .Q(StartError), .QN(n2)
         );
  OAI21_X1 U2 ( .B1(n2), .B2(Enable), .A(n1), .ZN(n3) );
endmodule


module OverSampling ( CLK, RST, EdgeCounter, SData, SampledBit );
  input [2:0] EdgeCounter;
  input CLK, RST, SData;
  output SampledBit;
  wire   n1, n2, n3, n8, n9, n10, n11, n12, n13, n14, n15, n16, n17, n4, n5,
         n6, n7;
  wire   [2:0] Samples;

  DFFR_X1 SampledBit_reg ( .D(n14), .CK(CLK), .RN(RST), .Q(SampledBit) );
  NAND2_X1 U15 ( .A1(SampledBit), .A2(n9), .ZN(n10) );
  NAND2_X1 U16 ( .A1(n2), .A2(n3), .ZN(n11) );
  DFFR_X1 \Samples_reg[2]  ( .D(n15), .CK(CLK), .RN(RST), .Q(Samples[2]), .QN(
        n1) );
  DFFR_X1 \Samples_reg[1]  ( .D(n16), .CK(CLK), .RN(RST), .Q(Samples[1]), .QN(
        n2) );
  DFFR_X1 \Samples_reg[0]  ( .D(n17), .CK(CLK), .RN(RST), .Q(Samples[0]), .QN(
        n3) );
  INV_X1 U3 ( .A(n12), .ZN(n5) );
  OAI22_X1 U4 ( .A1(n5), .A2(n7), .B1(n3), .B2(n12), .ZN(n17) );
  INV_X1 U5 ( .A(SData), .ZN(n7) );
  OAI21_X1 U6 ( .B1(EdgeCounter[1]), .B2(n6), .A(n13), .ZN(n12) );
  NAND3_X1 U7 ( .A1(EdgeCounter[1]), .A2(n6), .A3(EdgeCounter[0]), .ZN(n13) );
  INV_X1 U8 ( .A(EdgeCounter[2]), .ZN(n6) );
  OAI22_X1 U9 ( .A1(n5), .A2(n2), .B1(n1), .B2(n12), .ZN(n15) );
  OAI22_X1 U10 ( .A1(n5), .A2(n3), .B1(n2), .B2(n12), .ZN(n16) );
  OAI21_X1 U11 ( .B1(n8), .B2(n9), .A(n10), .ZN(n14) );
  AOI22_X1 U12 ( .A1(Samples[2]), .A2(n11), .B1(Samples[1]), .B2(Samples[0]), 
        .ZN(n8) );
  NAND3_X1 U13 ( .A1(EdgeCounter[1]), .A2(n4), .A3(EdgeCounter[2]), .ZN(n9) );
  INV_X1 U14 ( .A(EdgeCounter[0]), .ZN(n4) );
endmodule


module EdgeBitCounter ( Enable, ParityEn, CLK, RST, BitCounter, EdgeCounter );
  output [3:0] BitCounter;
  output [2:0] EdgeCounter;
  input Enable, ParityEn, CLK, RST;
  wire   n3, n4, n6, n9, n10, n11, n13, n14, n16, n19, n20, n21, n23, n24, n26,
         n27, n28, n29, n30, n31, n32, n33, n34, n35, n36, n1, n2, n5, n7, n8;

  XOR2_X1 U5 ( .A(n4), .B(n24), .Z(n27) );
  XOR2_X1 U6 ( .A(Enable), .B(EdgeCounter[0]), .Z(n28) );
  NAND2_X1 U28 ( .A1(Enable), .A2(EdgeCounter[0]), .ZN(n4) );
  DFFR_X1 \EdgeCounter_reg[0]  ( .D(n28), .CK(CLK), .RN(RST), .Q(
        EdgeCounter[0]) );
  DFFR_X1 \EdgeCounter_reg[1]  ( .D(n27), .CK(CLK), .RN(RST), .Q(
        EdgeCounter[1]), .QN(n24) );
  DFFR_X1 \EdgeCounter_reg[2]  ( .D(n26), .CK(CLK), .RN(RST), .Q(
        EdgeCounter[2]), .QN(n23) );
  DFFR_X1 \BitCounter_reg[0]  ( .D(n36), .CK(CLK), .RN(RST), .Q(BitCounter[0]), 
        .QN(n33) );
  DFFR_X1 \BitCounter_reg[1]  ( .D(n29), .CK(CLK), .RN(RST), .Q(BitCounter[1]), 
        .QN(n32) );
  DFFR_X1 \BitCounter_reg[2]  ( .D(n35), .CK(CLK), .RN(RST), .Q(BitCounter[2]), 
        .QN(n31) );
  DFFR_X1 \BitCounter_reg[3]  ( .D(n34), .CK(CLK), .RN(RST), .Q(BitCounter[3]), 
        .QN(n30) );
  OAI21_X1 U3 ( .B1(n7), .B2(BitCounter[1]), .A(n6), .ZN(n14) );
  INV_X1 U4 ( .A(n13), .ZN(n7) );
  INV_X1 U7 ( .A(n19), .ZN(n5) );
  NOR3_X1 U8 ( .A1(n7), .A2(n33), .A3(n5), .ZN(n9) );
  OAI211_X1 U9 ( .C1(n32), .C2(n33), .A(n31), .B(n21), .ZN(n13) );
  AOI221_X1 U10 ( .B1(n32), .B2(ParityEn), .C1(n33), .C2(n8), .A(n30), .ZN(n21) );
  INV_X1 U11 ( .A(ParityEn), .ZN(n8) );
  AOI21_X1 U12 ( .B1(n13), .B2(n33), .A(n5), .ZN(n6) );
  OAI22_X1 U13 ( .A1(n32), .A2(n6), .B1(BitCounter[1]), .B2(n1), .ZN(n29) );
  INV_X1 U14 ( .A(n9), .ZN(n1) );
  OAI21_X1 U15 ( .B1(n30), .B2(n10), .A(n11), .ZN(n34) );
  NAND4_X1 U16 ( .A1(n30), .A2(n9), .A3(BitCounter[1]), .A4(BitCounter[2]), 
        .ZN(n11) );
  AOI21_X1 U17 ( .B1(n31), .B2(n13), .A(n14), .ZN(n10) );
  OAI21_X1 U18 ( .B1(n33), .B2(n19), .A(n20), .ZN(n36) );
  NAND3_X1 U19 ( .A1(n33), .A2(n13), .A3(n19), .ZN(n20) );
  OAI21_X1 U20 ( .B1(n31), .B2(n2), .A(n16), .ZN(n35) );
  INV_X1 U21 ( .A(n14), .ZN(n2) );
  NAND3_X1 U22 ( .A1(n31), .A2(BitCounter[1]), .A3(n9), .ZN(n16) );
  NOR3_X1 U23 ( .A1(n24), .A2(n23), .A3(n4), .ZN(n19) );
  XNOR2_X1 U24 ( .A(n23), .B(n3), .ZN(n26) );
  NOR2_X1 U25 ( .A1(n24), .A2(n4), .ZN(n3) );
endmodule


module UART_RX ( RX_IN, CLK, RST, ParityEn, ParityType, PData, DataValid );
  output [7:0] PData;
  input RX_IN, CLK, RST, ParityEn, ParityType;
  output DataValid;
  wire   StartErrorTop, ParityErrorTop, StopErrorTop, CounterEnableTop,
         ParityCheckEnTop, StartCheckEnTop, StopCheckEnTop, DeserializerEnTop,
         OutDataTop, SampledBitTop, n1;
  wire   [3:0] BitCounterTop;
  wire   [2:0] EdgeCounterTop;

  FSM FSMTop ( .CLK(CLK), .RST(n1), .SData(RX_IN), .StartError(StartErrorTop), 
        .ParityError(ParityErrorTop), .ParityEn(ParityEn), .StopError(
        StopErrorTop), .BitCounter(BitCounterTop), .EdgeCounter(EdgeCounterTop), .CounterEnable(CounterEnableTop), .ParityCheckEn(ParityCheckEnTop), 
        .StartCheckEn(StartCheckEnTop), .StopCheckEn(StopCheckEnTop), 
        .DeserializerEn(DeserializerEnTop), .DataValid(DataValid), .OutData(
        OutDataTop) );
  ParityCheck ParityCheckTop ( .CLK(CLK), .RST(n1), .Enable(ParityCheckEnTop), 
        .ParityEn(ParityEn), .Data(PData), .ParityType(ParityType), 
        .SampledParity(SampledBitTop), .ParityError(ParityErrorTop) );
  StopCheck StopCheckTop ( .CLK(CLK), .RST(n1), .Enable(StopCheckEnTop), 
        .SampledStop(SampledBitTop), .StopError(StopErrorTop) );
  Deserializer DeserializerTop ( .CLK(CLK), .RST(n1), .SampledBit(
        SampledBitTop), .Enable(DeserializerEnTop), .OutData(OutDataTop), 
        .PData(PData) );
  StartCheck StartCheckTop ( .CLK(CLK), .RST(n1), .Enable(StartCheckEnTop), 
        .SampledStart(SampledBitTop), .StartError(StartErrorTop) );
  OverSampling OverSamplingTop ( .CLK(CLK), .RST(n1), .EdgeCounter(
        EdgeCounterTop), .SData(RX_IN), .SampledBit(SampledBitTop) );
  EdgeBitCounter CounterTop ( .Enable(CounterEnableTop), .ParityEn(ParityEn), 
        .CLK(CLK), .RST(n1), .BitCounter(BitCounterTop), .EdgeCounter(
        EdgeCounterTop) );
  BUF_X1 U1 ( .A(RST), .Z(n1) );
endmodule


module ParityCalc_size8 ( ParallelData, DataValid, ParityType, CLK, RST, 
        ParityBit );
  input [7:0] ParallelData;
  input DataValid, ParityType, CLK, RST;
  output ParityBit;
  wire   n2, n3, n4, n5, n6, n7, n8, n9, n10, n11, n1;

  DFFR_X1 ParityBit_reg ( .D(n11), .CK(CLK), .RN(RST), .Q(ParityBit) );
  NAND2_X1 U7 ( .A1(ParityBit), .A2(n1), .ZN(n3) );
  XOR2_X1 U8 ( .A(n4), .B(ParityType), .Z(n2) );
  XOR2_X1 U9 ( .A(n5), .B(n6), .Z(n4) );
  XOR2_X1 U10 ( .A(n7), .B(n8), .Z(n6) );
  XOR2_X1 U11 ( .A(n9), .B(n10), .Z(n5) );
  XOR2_X1 U12 ( .A(ParallelData[3]), .B(ParallelData[2]), .Z(n10) );
  OAI21_X1 U2 ( .B1(n2), .B2(n1), .A(n3), .ZN(n11) );
  XNOR2_X1 U3 ( .A(ParallelData[1]), .B(ParallelData[0]), .ZN(n9) );
  XNOR2_X1 U4 ( .A(ParallelData[5]), .B(ParallelData[4]), .ZN(n8) );
  XNOR2_X1 U5 ( .A(ParallelData[7]), .B(ParallelData[6]), .ZN(n7) );
  INV_X1 U6 ( .A(DataValid), .ZN(n1) );
endmodule


module Serializer_size8 ( ParallelData, DataValid, SerEn, CLK, RST, SerDone, 
        SerData );
  input [7:0] ParallelData;
  input DataValid, SerEn, CLK, RST;
  output SerDone, SerData;
  wire   \parallel[6] , N30, n2, n3, n5, n7, n8, n12, n13, n14, n15, n18, n20,
         n22, n24, n25, n26, n27, n28, n29, n30, n31, n32, n33, n34, n35, n36,
         n37, n39, n40, n41, n42, n43, n1, n4, n6, n9, n10, n11, n16, n17, n19,
         n21, n23, n38, n44;

  DFFR_X1 \counter_reg[0]  ( .D(n36), .CK(CLK), .RN(RST), .QN(n32) );
  DFFR_X1 \counter_reg[1]  ( .D(n35), .CK(CLK), .RN(RST), .QN(n31) );
  DFFR_X1 \counter_reg[2]  ( .D(n34), .CK(CLK), .RN(RST), .Q(n4), .QN(n30) );
  DFFR_X1 SerDone_reg ( .D(N30), .CK(CLK), .RN(RST), .Q(SerDone) );
  DFF_X1 \parallel_reg[6]  ( .D(n9), .CK(CLK), .Q(\parallel[6] ), .QN(n16) );
  DFF_X1 \parallel_reg[5]  ( .D(n39), .CK(CLK), .QN(n17) );
  DFF_X1 \parallel_reg[4]  ( .D(n40), .CK(CLK), .QN(n19) );
  DFF_X1 \parallel_reg[3]  ( .D(n41), .CK(CLK), .QN(n21) );
  DFF_X1 \parallel_reg[2]  ( .D(n42), .CK(CLK), .QN(n23) );
  DFF_X1 \parallel_reg[1]  ( .D(n43), .CK(CLK), .QN(n38) );
  DFF_X1 \parallel_reg[0]  ( .D(n37), .CK(CLK), .Q(n28), .QN(n44) );
  DFFR_X1 SerData_reg ( .D(n33), .CK(CLK), .RN(RST), .Q(SerData), .QN(n29) );
  XOR2_X1 U7 ( .A(n31), .B(n7), .Z(n35) );
  XOR2_X1 U8 ( .A(n3), .B(n32), .Z(n36) );
  NAND2_X1 U10 ( .A1(ParallelData[1]), .A2(n13), .ZN(n12) );
  NAND2_X1 U15 ( .A1(ParallelData[6]), .A2(n13), .ZN(n18) );
  NAND2_X1 U18 ( .A1(ParallelData[5]), .A2(n13), .ZN(n20) );
  NAND2_X1 U21 ( .A1(ParallelData[4]), .A2(n13), .ZN(n22) );
  NAND2_X1 U24 ( .A1(ParallelData[3]), .A2(n13), .ZN(n24) );
  NAND2_X1 U27 ( .A1(ParallelData[2]), .A2(n13), .ZN(n25) );
  NAND2_X1 U31 ( .A1(n26), .A2(n6), .ZN(n8) );
  NAND2_X1 U41 ( .A1(SerEn), .A2(DataValid), .ZN(n3) );
  NOR2_X1 U3 ( .A1(n15), .A2(n5), .ZN(n13) );
  INV_X1 U4 ( .A(n15), .ZN(n6) );
  INV_X1 U5 ( .A(n3), .ZN(n10) );
  INV_X1 U6 ( .A(n5), .ZN(n11) );
  OAI221_X1 U9 ( .B1(n8), .B2(n38), .C1(n6), .C2(n44), .A(n12), .ZN(n37) );
  OAI221_X1 U11 ( .B1(n8), .B2(n23), .C1(n6), .C2(n38), .A(n25), .ZN(n43) );
  OAI221_X1 U12 ( .B1(n8), .B2(n21), .C1(n6), .C2(n23), .A(n24), .ZN(n42) );
  OAI221_X1 U13 ( .B1(n8), .B2(n19), .C1(n6), .C2(n21), .A(n22), .ZN(n41) );
  OAI221_X1 U14 ( .B1(n8), .B2(n17), .C1(n6), .C2(n19), .A(n20), .ZN(n40) );
  OAI221_X1 U16 ( .B1(n8), .B2(n16), .C1(n6), .C2(n17), .A(n18), .ZN(n39) );
  OAI211_X1 U17 ( .C1(n11), .C2(n26), .A(n10), .B(RST), .ZN(n15) );
  INV_X1 U19 ( .A(n14), .ZN(n9) );
  AOI22_X1 U20 ( .A1(n15), .A2(\parallel[6] ), .B1(n13), .B2(ParallelData[7]), 
        .ZN(n14) );
  NAND3_X1 U22 ( .A1(n31), .A2(n32), .A3(n30), .ZN(n5) );
  OAI22_X1 U23 ( .A1(n29), .A2(n10), .B1(n2), .B2(n3), .ZN(n33) );
  AOI22_X1 U25 ( .A1(ParallelData[0]), .A2(n11), .B1(n28), .B2(n5), .ZN(n2) );
  XOR2_X1 U26 ( .A(n1), .B(n4), .Z(n34) );
  NOR2_X1 U28 ( .A1(n7), .A2(n31), .ZN(n1) );
  NOR3_X1 U29 ( .A1(n7), .A2(n30), .A3(n31), .ZN(N30) );
  OR2_X1 U30 ( .A1(n3), .A2(n32), .ZN(n7) );
  AND2_X1 U32 ( .A1(n5), .A2(n27), .ZN(n26) );
  OR3_X1 U33 ( .A1(n31), .A2(n30), .A3(n32), .ZN(n27) );
endmodule


module MUX ( MuxSelection, SerData, ParityBit, TXOut );
  input [1:0] MuxSelection;
  input SerData, ParityBit;
  output TXOut;
  wire   n3, n4, n1, n2;

  NAND2_X1 U7 ( .A1(n3), .A2(n4), .ZN(TXOut) );
  INV_X1 U3 ( .A(MuxSelection[1]), .ZN(n2) );
  NAND3_X1 U4 ( .A1(MuxSelection[1]), .A2(n1), .A3(SerData), .ZN(n4) );
  OAI21_X1 U5 ( .B1(ParityBit), .B2(n2), .A(MuxSelection[0]), .ZN(n3) );
  INV_X1 U6 ( .A(MuxSelection[0]), .ZN(n1) );
endmodule


module FSM_TX ( DataValid, ParityEn, SerDone, CLK, RST, MuxSelection, SerEn, 
        Busy );
  output [1:0] MuxSelection;
  input DataValid, ParityEn, SerDone, CLK, RST;
  output SerEn, Busy;
  wire   n3, n4, n6, n7, n1, n2, n5;
  wire   [2:0] PresentState;
  wire   [2:0] NextState;

  DFFR_X1 \PresentState_reg[0]  ( .D(NextState[0]), .CK(CLK), .RN(RST), .Q(
        PresentState[0]) );
  DFFR_X1 \PresentState_reg[2]  ( .D(NextState[2]), .CK(CLK), .RN(RST), .Q(
        PresentState[2]), .QN(n3) );
  DFFR_X1 \PresentState_reg[1]  ( .D(NextState[1]), .CK(CLK), .RN(RST), .Q(
        PresentState[1]), .QN(n4) );
  NAND2_X1 U13 ( .A1(n2), .A2(n7), .ZN(NextState[1]) );
  NAND2_X1 U15 ( .A1(PresentState[0]), .A2(n3), .ZN(n7) );
  INV_X1 U3 ( .A(MuxSelection[1]), .ZN(n2) );
  OAI21_X1 U4 ( .B1(PresentState[0]), .B2(n4), .A(n7), .ZN(Busy) );
  AND2_X1 U5 ( .A1(MuxSelection[1]), .A2(n6), .ZN(NextState[2]) );
  OAI21_X1 U6 ( .B1(ParityEn), .B2(n5), .A(PresentState[0]), .ZN(n6) );
  INV_X1 U7 ( .A(SerDone), .ZN(n5) );
  NOR2_X1 U8 ( .A1(n4), .A2(PresentState[2]), .ZN(MuxSelection[1]) );
  AOI21_X1 U9 ( .B1(PresentState[2]), .B2(n4), .A(PresentState[0]), .ZN(
        MuxSelection[0]) );
  AOI21_X1 U10 ( .B1(PresentState[1]), .B2(SerDone), .A(n7), .ZN(SerEn) );
  OR2_X1 U11 ( .A1(SerEn), .A2(n1), .ZN(NextState[0]) );
  AND3_X1 U12 ( .A1(n4), .A2(n3), .A3(DataValid), .ZN(n1) );
endmodule


module UART_TX ( CLK, RST, ParallelData, ParityType, ParityEn, DataValid, Busy, 
        TXOut );
  input [7:0] ParallelData;
  input CLK, RST, ParityType, ParityEn, DataValid;
  output Busy, TXOut;
  wire   ParityBit, SerEn, SerDone, SerData;
  wire   [1:0] MuxSelection;

  ParityCalc_size8 ParityCalcTop ( .ParallelData(ParallelData), .DataValid(
        DataValid), .ParityType(ParityType), .CLK(CLK), .RST(RST), .ParityBit(
        ParityBit) );
  Serializer_size8 SerializerTop ( .ParallelData(ParallelData), .DataValid(
        DataValid), .SerEn(SerEn), .CLK(CLK), .RST(RST), .SerDone(SerDone), 
        .SerData(SerData) );
  MUX MuxTop ( .MuxSelection(MuxSelection), .SerData(SerData), .ParityBit(
        ParityBit), .TXOut(TXOut) );
  FSM_TX FSMTopTX ( .DataValid(DataValid), .ParityEn(ParityEn), .SerDone(
        SerDone), .CLK(CLK), .RST(RST), .MuxSelection(MuxSelection), .SerEn(
        SerEn), .Busy(Busy) );
endmodule


module UART ( RX_IN, RX_CLK, TX_CLK, RX_RST, TX_RST, ParityEn, ParityType, 
        TX_D_VLD, TX_P_Data, TX_Busy, RX_P_Data, RX_D_VLD, TX_S_Data );
  input [7:0] TX_P_Data;
  output [7:0] RX_P_Data;
  input RX_IN, RX_CLK, TX_CLK, RX_RST, TX_RST, ParityEn, ParityType, TX_D_VLD;
  output TX_Busy, RX_D_VLD, TX_S_Data;


  UART_RX UART_RX_TOP ( .RX_IN(RX_IN), .CLK(RX_CLK), .RST(RX_RST), .ParityEn(
        ParityEn), .ParityType(ParityType), .PData(RX_P_Data), .DataValid(
        RX_D_VLD) );
  UART_TX UART_TX_Top ( .CLK(TX_CLK), .RST(TX_RST), .ParallelData(TX_P_Data), 
        .ParityType(ParityType), .ParityEn(ParityEn), .DataValid(TX_D_VLD), 
        .Busy(TX_Busy), .TXOut(TX_S_Data) );
endmodule


module Synchronizer_16 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11, n12;

  DFFR_X1 int_sig_reg ( .D(n8), .CK(CLK), .RN(RST), .QN(n10) );
  DFFR_X1 SyncBit_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n11) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(n1), .ZN(n12) );
  OAI21_X1 U2 ( .B1(n10), .B2(n1), .A(n12), .ZN(n8) );
  OAI22_X1 U3 ( .A1(n10), .A2(n7), .B1(n11), .B2(n1), .ZN(n9) );
  INV_X1 U4 ( .A(n7), .ZN(n1) );
  INV_X1 U6 ( .A(EN), .ZN(n7) );
endmodule


module Synchronizer_15 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11, n12;

  DFFR_X1 int_sig_reg ( .D(n8), .CK(CLK), .RN(RST), .QN(n10) );
  DFFR_X1 SyncBit_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n11) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(n1), .ZN(n12) );
  OAI21_X1 U2 ( .B1(n10), .B2(n1), .A(n12), .ZN(n8) );
  OAI22_X1 U3 ( .A1(n10), .A2(n7), .B1(n11), .B2(n1), .ZN(n9) );
  INV_X1 U4 ( .A(n7), .ZN(n1) );
  INV_X1 U6 ( .A(EN), .ZN(n7) );
endmodule


module Synchronizer_14 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11, n12;

  DFFR_X1 int_sig_reg ( .D(n8), .CK(CLK), .RN(RST), .QN(n10) );
  DFFR_X1 SyncBit_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n11) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(n1), .ZN(n12) );
  OAI21_X1 U2 ( .B1(n10), .B2(n1), .A(n12), .ZN(n8) );
  OAI22_X1 U3 ( .A1(n10), .A2(n7), .B1(n11), .B2(n1), .ZN(n9) );
  INV_X1 U4 ( .A(n7), .ZN(n1) );
  INV_X1 U6 ( .A(EN), .ZN(n7) );
endmodule


module Synchronizer_13 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11, n12;

  DFFR_X1 int_sig_reg ( .D(n8), .CK(CLK), .RN(RST), .QN(n10) );
  DFFR_X1 SyncBit_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n11) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(n1), .ZN(n12) );
  OAI21_X1 U2 ( .B1(n10), .B2(n1), .A(n12), .ZN(n8) );
  OAI22_X1 U3 ( .A1(n10), .A2(n7), .B1(n11), .B2(n1), .ZN(n9) );
  INV_X1 U4 ( .A(n7), .ZN(n1) );
  INV_X1 U6 ( .A(EN), .ZN(n7) );
endmodule


module Synchronizer_12 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI21_X1 U2 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  OAI22_X1 U3 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module Synchronizer_11 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI21_X1 U2 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  OAI22_X1 U3 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module Synchronizer_10 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI21_X1 U2 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  OAI22_X1 U3 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module Synchronizer_9 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI21_X1 U2 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  OAI22_X1 U3 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module DataSync_BusWidth8_0 ( UnsyncBus, DestCLK, DestRST, EN, SyncBus );
  input [7:0] UnsyncBus;
  output [7:0] SyncBus;
  input DestCLK, DestRST, EN;


  Synchronizer_16 SyncBit0 ( .UnsyncBit(UnsyncBus[0]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[0]) );
  Synchronizer_15 SyncBit1 ( .UnsyncBit(UnsyncBus[1]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[1]) );
  Synchronizer_14 SyncBit2 ( .UnsyncBit(UnsyncBus[2]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[2]) );
  Synchronizer_13 SyncBit3 ( .UnsyncBit(UnsyncBus[3]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[3]) );
  Synchronizer_12 SyncBit4 ( .UnsyncBit(UnsyncBus[4]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[4]) );
  Synchronizer_11 SyncBit5 ( .UnsyncBit(UnsyncBus[5]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[5]) );
  Synchronizer_10 SyncBit6 ( .UnsyncBit(UnsyncBus[6]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[6]) );
  Synchronizer_9 SyncBit7 ( .UnsyncBit(UnsyncBus[7]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[7]) );
endmodule


module Synchronizer_8 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11, n12;

  DFFR_X1 int_sig_reg ( .D(n8), .CK(CLK), .RN(RST), .QN(n10) );
  DFFR_X1 SyncBit_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n11) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(n1), .ZN(n12) );
  OAI22_X1 U2 ( .A1(n10), .A2(n7), .B1(n11), .B2(n1), .ZN(n9) );
  OAI21_X1 U3 ( .B1(n10), .B2(n1), .A(n12), .ZN(n8) );
  INV_X1 U4 ( .A(n7), .ZN(n1) );
  INV_X1 U6 ( .A(EN), .ZN(n7) );
endmodule


module Synchronizer_7 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11, n12;

  DFFR_X1 int_sig_reg ( .D(n8), .CK(CLK), .RN(RST), .QN(n10) );
  DFFR_X1 SyncBit_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n11) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(n1), .ZN(n12) );
  OAI22_X1 U2 ( .A1(n10), .A2(n7), .B1(n11), .B2(n1), .ZN(n9) );
  OAI21_X1 U3 ( .B1(n10), .B2(n1), .A(n12), .ZN(n8) );
  INV_X1 U4 ( .A(n7), .ZN(n1) );
  INV_X1 U6 ( .A(EN), .ZN(n7) );
endmodule


module Synchronizer_6 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11, n12;

  DFFR_X1 int_sig_reg ( .D(n8), .CK(CLK), .RN(RST), .QN(n10) );
  DFFR_X1 SyncBit_reg ( .D(n9), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n11) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(n1), .ZN(n12) );
  OAI22_X1 U2 ( .A1(n10), .A2(n7), .B1(n11), .B2(n1), .ZN(n9) );
  OAI21_X1 U3 ( .B1(n10), .B2(n1), .A(n12), .ZN(n8) );
  INV_X1 U4 ( .A(n7), .ZN(n1) );
  INV_X1 U6 ( .A(EN), .ZN(n7) );
endmodule


module Synchronizer_5 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI22_X1 U2 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  OAI21_X1 U3 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module Synchronizer_4 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI22_X1 U2 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  OAI21_X1 U3 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module Synchronizer_3 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI22_X1 U2 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  OAI21_X1 U3 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module Synchronizer_2 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI22_X1 U2 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  OAI21_X1 U3 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module Synchronizer_1 ( UnsyncBit, CLK, RST, EN, SyncBit );
  input UnsyncBit, CLK, RST, EN;
  output SyncBit;
  wire   n1, n7, n8, n9, n10, n11;

  DFFR_X1 int_sig_reg ( .D(n7), .CK(CLK), .RN(RST), .QN(n9) );
  DFFR_X1 SyncBit_reg ( .D(n8), .CK(CLK), .RN(RST), .Q(SyncBit), .QN(n10) );
  NAND2_X1 U5 ( .A1(UnsyncBit), .A2(EN), .ZN(n11) );
  OAI22_X1 U2 ( .A1(n9), .A2(n1), .B1(n10), .B2(EN), .ZN(n8) );
  OAI21_X1 U3 ( .B1(n9), .B2(EN), .A(n11), .ZN(n7) );
  INV_X1 U4 ( .A(EN), .ZN(n1) );
endmodule


module DataSync_BusWidth8_1 ( UnsyncBus, DestCLK, DestRST, EN, SyncBus );
  input [7:0] UnsyncBus;
  output [7:0] SyncBus;
  input DestCLK, DestRST, EN;


  Synchronizer_8 SyncBit0 ( .UnsyncBit(UnsyncBus[0]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[0]) );
  Synchronizer_7 SyncBit1 ( .UnsyncBit(UnsyncBus[1]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[1]) );
  Synchronizer_6 SyncBit2 ( .UnsyncBit(UnsyncBus[2]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[2]) );
  Synchronizer_5 SyncBit3 ( .UnsyncBit(UnsyncBus[3]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[3]) );
  Synchronizer_4 SyncBit4 ( .UnsyncBit(UnsyncBus[4]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[4]) );
  Synchronizer_3 SyncBit5 ( .UnsyncBit(UnsyncBus[5]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[5]) );
  Synchronizer_2 SyncBit6 ( .UnsyncBit(UnsyncBus[6]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[6]) );
  Synchronizer_1 SyncBit7 ( .UnsyncBit(UnsyncBus[7]), .CLK(DestCLK), .RST(
        DestRST), .EN(EN), .SyncBit(SyncBus[7]) );
endmodule


module SystemTop ( REF_CLK, RX_IN, RST, UART_CLK, SCAN_CLK, SCAN_RST, SCAN_EN, 
        TEST_MODE, SI, SO, TX_OUT );
  input [2:0] SI;
  output [2:0] SO;
  input REF_CLK, RX_IN, RST, UART_CLK, SCAN_CLK, SCAN_RST, SCAN_EN, TEST_MODE;
  output TX_OUT;
  wire   REF_CLK_MUX, UART_CLK_MUX, UART_RST, TX_CLK, TX_CLK_MUX, MUX_RST,
         Sync_UART_RST, Sync_REF_RST, REF_RST, RX_D_VLD_UNSYNC, RX_D_VLD_SYNC,
         RdData_Valid, ALU_Valid, TX_Busy, ALU_EN, RdEn, WrEn, TX_D_VLD_UNSYNC,
         TX_D_VLD_SYNC, n1;
  wire   [15:0] ALU_OUT;
  wire   [7:0] Sync_RX_P_Data;
  wire   [7:0] RdData;
  wire   [3:0] ALU_FUN;
  wire   [3:0] Address;
  wire   [7:0] WrData;
  wire   [7:0] TX_P_Data;
  wire   [7:0] Operand_A_Top;
  wire   [7:0] Operand_B_Top;
  wire   [7:0] UART_CONFIG;
  wire   [7:0] Sync_TX_P_Data;
  wire   [7:0] RX_P_Data;
  wire   SYNOPSYS_UNCONNECTED__0, SYNOPSYS_UNCONNECTED__1, 
        SYNOPSYS_UNCONNECTED__2, SYNOPSYS_UNCONNECTED__3, 
        SYNOPSYS_UNCONNECTED__4, SYNOPSYS_UNCONNECTED__5;

  MUX2X1_2 REF_SCAN_MUX ( .SEL(TEST_MODE), .IN0(REF_CLK), .IN1(SCAN_CLK), 
        .OUT(REF_CLK_MUX) );
  MUX2X1_4 UART_SCAN_MUX ( .SEL(TEST_MODE), .IN0(UART_CLK), .IN1(SCAN_CLK), 
        .OUT(UART_CLK_MUX) );
  ClockDivider8 ClockDividerTopSys8 ( .i_ref_clk(UART_CLK_MUX), .i_rst_n(
        UART_RST), .o_div_clk(TX_CLK) );
  MUX2X1_3 TX_SCAN_MUX ( .SEL(TEST_MODE), .IN0(TX_CLK), .IN1(SCAN_CLK), .OUT(
        TX_CLK_MUX) );
  ResetSync_0 ResetSyncUART ( .RST(MUX_RST), .CLK(UART_CLK_MUX), .SYNC_RST(
        Sync_UART_RST) );
  ResetSync_1 ResetSyncREF ( .RST(MUX_RST), .CLK(REF_CLK_MUX), .SYNC_RST(
        Sync_REF_RST) );
  MUX2X1_0 RST_MUX ( .SEL(TEST_MODE), .IN0(RST), .IN1(SCAN_RST), .OUT(MUX_RST)
         );
  MUX2X1_1 UART_RST_SCAN_MUX ( .SEL(TEST_MODE), .IN0(Sync_UART_RST), .IN1(
        SCAN_RST), .OUT(UART_RST) );
  MUX2X1_5 REF_RST_SCAN_MUX ( .SEL(TEST_MODE), .IN0(Sync_REF_RST), .IN1(
        SCAN_RST), .OUT(REF_RST) );
  Synchronizer_0 RX_VLD_SYNC ( .UnsyncBit(RX_D_VLD_UNSYNC), .CLK(REF_CLK_MUX), 
        .RST(n1), .EN(1'b1), .SyncBit(RX_D_VLD_SYNC) );
  SystemControl_BusWidth8_FuncWidth4_AddWidth4 SystemControlTop ( .CLK(
        REF_CLK_MUX), .RST(n1), .RdData_Valid(RdData_Valid), .RX_D_VLD(
        RX_D_VLD_SYNC), .ALU_Valid(ALU_Valid), .ALU_OUT(ALU_OUT), .RX_P_Data(
        Sync_RX_P_Data), .RdData(RdData), .TX_Busy(TX_Busy), .ALU_EN(ALU_EN), 
        .ALU_FUN(ALU_FUN), .Address(Address), .RdEn(RdEn), .WrEn(WrEn), 
        .WrData(WrData), .TX_P_Data(TX_P_Data), .TX_D_VLD(TX_D_VLD_UNSYNC) );
  Synchronizer_17 TX_VLD_SYNC ( .UnsyncBit(TX_D_VLD_UNSYNC), .CLK(TX_CLK_MUX), 
        .RST(UART_RST), .EN(1'b1), .SyncBit(TX_D_VLD_SYNC) );
  ALU_OpWidth8_FuncWidth4 ALUTop ( .CLK(REF_CLK_MUX), .RST(n1), .Enable(ALU_EN), .A(Operand_A_Top), .B(Operand_B_Top), .ALU_FUN(ALU_FUN), .ALU_OUT(ALU_OUT), 
        .OUT_VALID(ALU_Valid) );
  RegisterFile_AddWidth4_BusWidth8_RegDepth16 RegisterFileTop ( .CLK(
        REF_CLK_MUX), .RST(n1), .Address(Address), .RdEn(RdEn), .WrEn(WrEn), 
        .WrData(WrData), .RdData_Valid(RdData_Valid), .RdData(RdData), .REG0(
        Operand_A_Top), .REG1(Operand_B_Top), .REG2({SYNOPSYS_UNCONNECTED__0, 
        SYNOPSYS_UNCONNECTED__1, SYNOPSYS_UNCONNECTED__2, 
        SYNOPSYS_UNCONNECTED__3, SYNOPSYS_UNCONNECTED__4, 
        SYNOPSYS_UNCONNECTED__5, UART_CONFIG[1:0]}) );
  UART UART_TOP ( .RX_IN(RX_IN), .RX_CLK(UART_CLK_MUX), .TX_CLK(TX_CLK_MUX), 
        .RX_RST(UART_RST), .TX_RST(Sync_UART_RST), .ParityEn(UART_CONFIG[0]), 
        .ParityType(UART_CONFIG[1]), .TX_D_VLD(TX_D_VLD_SYNC), .TX_P_Data(
        Sync_TX_P_Data), .TX_Busy(TX_Busy), .RX_P_Data(RX_P_Data), .RX_D_VLD(
        RX_D_VLD_UNSYNC), .TX_S_Data(TX_OUT) );
  DataSync_BusWidth8_0 DataSyncToTX ( .UnsyncBus(TX_P_Data), .DestCLK(
        TX_CLK_MUX), .DestRST(UART_RST), .EN(TX_D_VLD_SYNC), .SyncBus(
        Sync_TX_P_Data) );
  DataSync_BusWidth8_1 DataSyncToSysCtrl ( .UnsyncBus(RX_P_Data), .DestCLK(
        REF_CLK_MUX), .DestRST(n1), .EN(RX_D_VLD_SYNC), .SyncBus(
        Sync_RX_P_Data) );
  BUF_X2 U2 ( .A(REF_RST), .Z(n1) );
endmodule

