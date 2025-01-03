module SystemControl #(
    parameter BusWidth  = 8,
    parameter FuncWidth = 4,
    parameter AddWidth  = 4
)(
    input  wire                   CLK,
    input  wire                   RST,
    input  wire                   RdData_Valid,
    input  wire                   RX_D_VLD,
    input  wire                   ALU_Valid,
    input  wire [2*BusWidth-1:0]  ALU_OUT,
    input  wire [BusWidth-1:0]    RX_P_Data,
    input  wire [BusWidth-1:0]    RdData,
    input  wire                   TX_Busy,
    output wire                   ALU_EN,
    output wire [FuncWidth-1:0]   ALU_FUN,
    output wire [AddWidth-1:0]    Address,
    output wire                   RdEn,
    output wire                   WrEn,
    output wire [BusWidth-1:0]    WrData,
    output wire [BusWidth-1:0]    TX_P_Data,
    output wire                   TX_D_VLD            
);


CTRL_RX                         #(.BusWidth(BusWidth), .FuncWidth(FuncWidth), .AddWidth(AddWidth)) CTRL_RX_TOP
(.RX_P_Data                     (RX_P_Data),
 .RX_D_VLD                      (RX_D_VLD),
 .RST                           (RST),
 .CLK                           (CLK),
 .Reg_Addr                      (Address),
 .Reg_Wr_Data                   (WrData),
 .ALU_FUN                       (ALU_FUN),
 .RdEn                          (RdEn),
 .WrEn                          (WrEn),
 .ALU_EN                        (ALU_EN)
);

CTRL_TX                         #(.BusWidth(BusWidth)) CTRL_TX_TOP
(.CLK                           (CLK),
 .RST                           (RST),
 .ALU_Valid                     (ALU_Valid),
 .ALU_OUT                       (ALU_OUT),
 .RdData_Valid                  (RdData_Valid),
 .RdData                        (RdData),
 .TX_Busy                       (TX_Busy),
 .TX_D_VLD                      (TX_D_VLD),
 .TX_P_Data                     (TX_P_Data)
);
endmodule
