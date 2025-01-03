module UART (
    input  wire         RX_IN,
    input  wire         RX_CLK,
    input  wire         TX_CLK,
    input  wire         RX_RST,
    input  wire         TX_RST,
    input  wire         ParityEn,
    input  wire         ParityType,
    input  wire         TX_D_VLD,
    input  wire [7:0]   TX_P_Data,
    output wire         TX_Busy,
    output wire [7:0]   RX_P_Data,
    output wire         RX_D_VLD,
    output wire         TX_S_Data
);

   UART_RX             UART_RX_TOP
   (.RX_IN             (RX_IN),
    .CLK               (RX_CLK),
    .RST               (RX_RST),
    .ParityEn          (ParityEn),
    .ParityType        (ParityType),
    .PData             (RX_P_Data),
    .DataValid         (RX_D_VLD)
   ); 

   UART_TX            UART_TX_Top
   (.CLK              (TX_CLK),
    .RST              (TX_RST),
    .ParallelData     (TX_P_Data),
    .ParityType       (ParityType),
    .ParityEn         (ParityEn),
    .DataValid        (TX_D_VLD),
    .Busy             (TX_Busy),
    .TXOut            (TX_S_Data)
   );
endmodule
