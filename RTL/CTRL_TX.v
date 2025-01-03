module CTRL_TX #(
    parameter BusWidth = 8
)(
    input  wire                  CLK,
    input  wire                  RST,
    input  wire                  ALU_Valid,
    input  wire [2*BusWidth-1:0] ALU_OUT,
    input  wire                  RdData_Valid,
    input  wire [BusWidth-1:0]   RdData,
    input  wire                  TX_Busy,
    output reg                   TX_D_VLD,
    output reg  [BusWidth-1:0]   TX_P_Data
);
    
    localparam IDLE       = 3'b000,
               RF_RD_Data = 3'b001,
               ALU_0      = 3'b011,
               WAIT       = 3'b111,
               ALU_1      = 3'b101;

    reg [2:0] current_state, next_state;

    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            current_state <= IDLE;
        end
        else begin
            current_state <= next_state;
        end
    end

    always @(*) begin
        case (current_state)
        IDLE  : begin
            if (!TX_Busy) begin
                if (ALU_Valid && !RdData_Valid) begin
                    next_state = ALU_0;
                end
                else if (!ALU_Valid && RdData_Valid) begin
                    next_state = RF_RD_Data;
                end
                else begin
                    next_state = IDLE;
                end
            end
	  else begin
		next_state = IDLE;
	  end
        end

        RF_RD_Data : begin
            if (!TX_Busy) begin
                next_state = RF_RD_Data;
            end
            else begin
                next_state = IDLE;
            end
        end

        ALU_0 : begin
            if (!TX_Busy) begin
                next_state = ALU_1;
            end
            else begin
                next_state = WAIT;
            end
        end

        WAIT : begin
            if (!TX_Busy) begin
                next_state = ALU_1;
            end
            else begin
                next_state = WAIT;
            end
        end

        ALU_1 : begin
            if (!TX_Busy) begin
                next_state = ALU_1;
            end
            else begin
                next_state = IDLE;
            end
        end
            default: begin
                next_state = IDLE;
            end
        endcase
    end

    always @(*) begin
        case (current_state)
        IDLE : begin
            TX_D_VLD  = 1'b0;
            TX_P_Data = 'b0;
        end

        RF_RD_Data : begin
            TX_D_VLD  = 1'b1;
            TX_P_Data = RdData;
        end

        ALU_0 : begin
            TX_D_VLD  = 1'b1;
            TX_P_Data = ALU_OUT[BusWidth-1:0];
        end

        WAIT : begin
            TX_D_VLD  = 1'b0;
            TX_P_Data = 'b0;
        end

        ALU_1 : begin
            TX_D_VLD = 1'b1;
            TX_P_Data = ALU_OUT[2*BusWidth-1:BusWidth];
        end
            default: begin
                TX_D_VLD  = 1'b0;
                TX_P_Data = 'b0;
            end
        endcase
    end
endmodule
