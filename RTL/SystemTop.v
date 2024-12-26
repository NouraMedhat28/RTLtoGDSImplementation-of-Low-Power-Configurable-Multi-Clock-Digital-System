module SystemTop #(
    parameter BusWidth  = 8,
              AddWidth  = 4,
              RegDepth  = 16,
              FuncWidth = 4
) (
    input  wire               REF_CLK,
    input  wire               RX_IN,
    input  wire               RST,
    input  wire               UART_CLK,
    // SCAN INSERTION PORTS
    input  wire               SCAN_CLK,
    input  wire               SCAN_RST,
    input  wire               SCAN_EN,
    input  wire               TEST_MODE,
    input  wire  [2:0]        SI,
    output wire  [2:0]        SO,
    //////////////////////////
    output wire               TX_OUT
);

wire   REF_CLK_MUX, UART_CLK_MUX, TX_CLK_MUX;
wire   TX_CLK, ALU_CLK;
wire   Sync_UART_RST, Sync_REF_RST, UART_RST, REF_RST, MUX_RST;
wire   RdData_Valid, ALU_Valid, TX_Busy, ALU_EN, RdEn, WrEn, TX_D_VLD_UNSYNC, TX_D_VLD_SYNC, RX_D_VLD_UNSYNC, RX_D_VLD_SYNC;
wire   [BusWidth-1:0] RX_P_Data, RdData, WrData, TX_P_Data, Operand_A_Top, Operand_B_Top, UART_CONFIG, Sync_TX_P_Data, Sync_RX_P_Data;
wire   [2*BusWidth-1:0] ALU_OUT;
wire   [FuncWidth-1:0] ALU_FUN;
wire   [AddWidth-1:0] Address;

//*************************CLOCKS*************************
//SCAN CLOCK Vs REF_CLK
MUX2X1                      REF_SCAN_MUX
(.SEL                       (TEST_MODE),
 .IN0                       (REF_CLK),
 .IN1                       (SCAN_CLK),
 .OUT                       (REF_CLK_MUX)
);

//SCAN CLOCK Vs UART_CLK
MUX2X1                      UART_SCAN_MUX
(.SEL                       (TEST_MODE),
 .IN0                       (UART_CLK),
 .IN1                       (SCAN_CLK),
 .OUT                       (UART_CLK_MUX)
);

ClockDivider8               ClockDividerTopSys8
(.i_ref_clk                 (UART_CLK_MUX),
 .i_rst_n                   (UART_RST),
 .o_div_clk                 (TX_CLK)
);

//SCAN CLOCK Vs TX_CLK
MUX2X1                      TX_SCAN_MUX
(.SEL                       (TEST_MODE),
 .IN0                       (TX_CLK),
 .IN1                       (SCAN_CLK),
 .OUT                       (TX_CLK_MUX)
);
/////////////////////////////////////////////////////

//***********************RESET SYNC**********************
ResetSync                   ResetSyncUART
(.RST                       (MUX_RST),
 .CLK                       (UART_CLK_MUX),
 .SYNC_RST                  (Sync_UART_RST)
);

ResetSync                   ResetSyncREF
(.RST                       (MUX_RST),
 .CLK                       (REF_CLK_MUX),
 .SYNC_RST                  (Sync_REF_RST)
);

MUX2X1                      RST_MUX
(.SEL                       (TEST_MODE),
 .IN0                       (RST),
 .IN1                       (SCAN_RST),
 .OUT                       (MUX_RST)
);

MUX2X1                      UART_RST_SCAN_MUX
(.SEL                       (TEST_MODE),
 .IN0                       (Sync_UART_RST),
 .IN1                       (SCAN_RST),
 .OUT                       (UART_RST)
);

MUX2X1                      REF_RST_SCAN_MUX
(.SEL                       (TEST_MODE),
 .IN0                       (Sync_REF_RST),
 .IN1                       (SCAN_RST),
 .OUT                       (REF_RST)
);
////////////////////////////////////////////////////////
Synchronizer                 RX_VLD_SYNC
(.UnsyncBit                  (RX_D_VLD_UNSYNC),
 .CLK                        (REF_CLK_MUX),
 .RST                        (REF_RST),
 .EN                         (1'b1),
 .SyncBit                    (RX_D_VLD_SYNC)
);

SystemControl               #(.BusWidth(BusWidth), .AddWidth(AddWidth), .FuncWidth(FuncWidth)) SystemControlTop
(.CLK                        (REF_CLK_MUX),
 .RST                        (REF_RST),
 .RdData_Valid               (RdData_Valid),
 .RX_D_VLD                   (RX_D_VLD_SYNC),
 .ALU_Valid                  (ALU_Valid),
 .ALU_OUT                    (ALU_OUT),
 .RX_P_Data                  (Sync_RX_P_Data),
 .RdData                     (RdData),
 .TX_Busy                    (TX_Busy),
 .ALU_EN                     (ALU_EN),
 .ALU_FUN                    (ALU_FUN),
 .Address                    (Address),
 .RdEn                       (RdEn),
 .WrEn                       (WrEn),
 .WrData                     (WrData),
 .TX_P_Data                  (TX_P_Data),
 .TX_D_VLD                   (TX_D_VLD_UNSYNC)
);

Synchronizer                 TX_VLD_SYNC
(.UnsyncBit                  (TX_D_VLD_UNSYNC),
 .CLK                        (TX_CLK_MUX),
 .RST                        (UART_RST),
 .EN                         (1'b1),
 .SyncBit                    (TX_D_VLD_SYNC)
);


ALU                          #(.OpWidth(BusWidth), .FuncWidth(FuncWidth)) ALUTop
(.CLK                        (REF_CLK_MUX),
 .RST                        (REF_RST),
 .Enable                     (ALU_EN),
 .A                          (Operand_A_Top),
 .B                          (Operand_B_Top),
 .ALU_FUN                    (ALU_FUN),
 .ALU_OUT                    (ALU_OUT),
 .OUT_VALID                  (ALU_Valid)
);

RegisterFile                #(.AddWidth(AddWidth), .BusWidth(BusWidth), .RegDepth(RegDepth)) RegisterFileTop
(.CLK                       (REF_CLK_MUX),
 .RST                       (REF_RST),
 .Address                   (Address),
 .RdEn                      (RdEn),
 .WrEn                      (WrEn),
 .WrData                    (WrData),
 .RdData_Valid              (RdData_Valid),
 .RdData                    (RdData),
 .REG0                      (Operand_A_Top), 
 .REG1                      (Operand_B_Top),
 .REG2                      (UART_CONFIG)
);

UART                        UART_TOP
(.RX_IN                     (RX_IN),
 .RX_CLK                    (UART_CLK_MUX),
 .TX_CLK                    (TX_CLK_MUX),
 .RX_RST                    (UART_RST),
 .TX_RST                    (Sync_UART_RST),
 .ParityEn                  (UART_CONFIG[0]),
 .ParityType                (UART_CONFIG[1]),
 .TX_D_VLD                  (TX_D_VLD_SYNC),
 .TX_P_Data                 (Sync_TX_P_Data),
 .TX_Busy                   (TX_Busy),
 .RX_P_Data                 (RX_P_Data),
 .RX_D_VLD                  (RX_D_VLD_UNSYNC),
 .TX_S_Data                 (TX_OUT)
);

DataSync                   #(.BusWidth(BusWidth))  DataSyncToTX
(.UnsyncBus                 (TX_P_Data),
 .DestCLK                   (TX_CLK_MUX),
 .DestRST                   (UART_RST),
 .EN                        (TX_D_VLD_SYNC),
 .SyncBus                   (Sync_TX_P_Data)
);

DataSync                   #(.BusWidth(BusWidth))  DataSyncToSysCtrl
(.UnsyncBus                 (RX_P_Data),
 .DestCLK                   (REF_CLK_MUX),
 .DestRST                   (REF_RST),
 .EN                        (RX_D_VLD_SYNC),
 .SyncBus                   (Sync_RX_P_Data)
);
endmodule
