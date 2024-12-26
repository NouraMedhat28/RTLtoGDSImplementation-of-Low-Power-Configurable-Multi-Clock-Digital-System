module RegisterFile #(
    parameter AddWidth = 4,
    parameter BusWidth = 8,
    parameter RegDepth = 16
) (
    input  wire                CLK,
    input  wire                RST,
    input  wire [AddWidth-1:0] Address,
    input  wire                RdEn,
    input  wire                WrEn,
    input  wire [BusWidth-1:0] WrData,
    output reg                 RdData_Valid,
    output reg  [BusWidth-1:0] RdData,
    output reg  [BusWidth-1:0] REG0, //ALU
    output reg  [BusWidth-1:0] REG1, //ALU
    output reg  [BusWidth-1:0] REG2 //UART
    //output reg  [BusWidth-1:0] REG3  // Clock Divider
);
    reg [BusWidth-1:0] RegFile [0:RegDepth];
    integer i;
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
           RdData_Valid     <= 1'b0;
           REG0             <= 'b0;
           REG1             <= 'b0;
           REG2             <= 'b0;
           //REG3             <= 8'b00000010; //Div_ratio = 2
           for (i = 3; i < RegDepth; i = i + 1) begin
            RegFile[i]      <= 'b0;
           end
        end
        else if (WrEn && !RdEn) begin
           RegFile[Address] <= WrData;
           RdData_Valid     <= 1'b0;
           REG0             <= RegFile[0];
           REG1             <= RegFile[1];
           REG2             <= RegFile[2];
           //REG3             <= RegFile[3];
           RdData           <= RdData;
        end
        else if (RdEn && !WrEn) begin
            RdData           <= RegFile[Address];
            RdData_Valid     <= 1'b1;
            REG0             <= RegFile[0];
            REG1             <= RegFile[1];
            REG2             <= RegFile[2];
           // REG3             <= RegFile[3];
        end
    end
endmodule