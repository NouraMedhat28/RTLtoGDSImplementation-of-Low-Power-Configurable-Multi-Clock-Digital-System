module CTRL_RX #(
    parameter BusWidth  = 8,
    parameter FuncWidth = 4,
    parameter AddWidth  = 4
)(
    input  wire [BusWidth-1:0]  RX_P_Data,
    input  wire                 RX_D_VLD,
    input  wire                 RST,
    input  wire                 CLK,
    output reg  [AddWidth-1:0]  Reg_Addr,
    output reg  [BusWidth-1:0]  Reg_Wr_Data,
    output reg  [FuncWidth-1:0] ALU_FUN,
    output reg                  RdEn,
    output reg                  WrEn,
    output reg                  ALU_EN
);

localparam IDLE       = 3'b000,
           RF_Wr_Addr = 3'b001,
           RF_Wr_Data = 3'b010,
           RF_Rd_Addr = 3'b011,
           Operand_A  = 3'b100,
           Operand_B  = 3'b101,
           ALU_FUNC   = 3'b110;

reg [2:0] current_state, next_state;
reg [BusWidth-1:0] int_addr;

//State Transition
always @(posedge CLK or negedge RST) begin
    if(!RST) begin
        current_state <= IDLE;
    end
    else begin
        current_state <= next_state;
    end
end

//Next state Logic
always @(*) begin
    case (current_state)
    IDLE : begin
       if(RX_D_VLD) begin
        case (RX_P_Data)
          'hAA  : begin
            next_state = RF_Wr_Addr;
          end
          'hBB  : begin
            next_state = RF_Rd_Addr;
          end
          'hCC  : begin
            next_state = Operand_A;
          end
          'hDD  :begin
            next_state = ALU_FUNC;
          end
            default: begin
                next_state = IDLE;
            end
        endcase
       end 
       else begin
        next_state = IDLE;
       end
    end

    RF_Wr_Addr : begin
        if (RX_D_VLD) begin
            next_state = RF_Wr_Data;
        end
        else begin
            next_state = RF_Wr_Addr;
        end
    end

    RF_Wr_Data : begin
        if (RX_D_VLD) begin
            next_state = IDLE;
        end
        else begin
            next_state = RF_Wr_Data;
        end
    end

    RF_Rd_Addr : begin
        if (RX_D_VLD) begin
            next_state = IDLE;
        end
        else begin
            next_state = RF_Rd_Addr;
        end
    end

    Operand_A : begin
        if (RX_D_VLD)begin
            next_state = Operand_B;
        end
        else begin
            next_state = Operand_A;
        end
    end

    Operand_B : begin
        if (RX_D_VLD) begin
            next_state = ALU_FUNC;
        end
        else begin
            next_state = IDLE;
        end
    end

    ALU_FUNC : begin
        if (RX_D_VLD) begin
            next_state = IDLE;
        end
        else begin
            next_state = ALU_FUNC;
        end
    end  
        default: begin
            next_state = IDLE;
        end
    endcase
end

//Output Logic
always @(*) begin
        Reg_Addr    = 'b0;
        Reg_Wr_Data = 'b0;
        ALU_FUN     = 'b0;
        RdEn        = 'b0;
        WrEn        = 'b0;
        ALU_EN      = 'b0;
        int_addr    = 'b0;
    case (current_state)
    IDLE : begin
        Reg_Addr    = 'b0;
        Reg_Wr_Data = 'b0;
        ALU_FUN     = 'b0;
        RdEn        = 'b0;
        WrEn        = 'b0;
        ALU_EN      = 'b0;
        int_addr    = 'b0;
    end

    RF_Wr_Addr : begin
        if (RX_D_VLD) begin
            Reg_Addr    = 'b0;
            Reg_Wr_Data = 'b0;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = RX_P_Data;
        end
        else begin
            Reg_Addr    = 'b0;
            Reg_Wr_Data = 'b0;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = 'b0;
        end
    end

    RF_Wr_Data : begin
        if (RX_D_VLD) begin
            Reg_Addr    = int_addr;
            Reg_Wr_Data = RX_P_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b1;
            ALU_EN      = 'b0;
            int_addr    = int_addr;
        end
        else begin
            Reg_Addr    = int_addr;
            Reg_Wr_Data = 'b0;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = int_addr;
        end
    end

    RF_Rd_Addr : begin
        if (RX_D_VLD) begin
            Reg_Addr    = RX_P_Data   ;
            Reg_Wr_Data = Reg_Wr_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b1;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = RX_P_Data;
        end
        else begin
            Reg_Addr    = Reg_Addr;
            Reg_Wr_Data = Reg_Wr_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = int_addr;
        end
    end

    Operand_A : begin
        if (RX_D_VLD) begin
            Reg_Addr    = 'b0;
            Reg_Wr_Data = RX_P_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b1;
            ALU_EN      = 'b0;
            int_addr    = 'b0;
        end
        else begin
            Reg_Addr    = 'b0;
            Reg_Wr_Data = Reg_Wr_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = 'b0;
        end
    end 

    Operand_B : begin
        if (RX_D_VLD) begin
            Reg_Addr    = 'd1;
            Reg_Wr_Data = RX_P_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b1;
            ALU_EN      = 'b0;
            int_addr    = 'd1;
        end
        else begin
            Reg_Addr    = 'd1;
            Reg_Wr_Data = Reg_Wr_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = 'd1;
        end
    end

    ALU_FUNC : begin
        if (RX_D_VLD) begin
            Reg_Addr    = Reg_Addr;
            Reg_Wr_Data = Reg_Wr_Data;
            ALU_FUN     = RX_P_Data;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b1;
            int_addr    = int_addr;
        end
        else begin
            Reg_Addr    = Reg_Addr;
            Reg_Wr_Data = Reg_Wr_Data;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = int_addr;
        end
    end
        default: begin
            Reg_Addr    = 'b0;
            Reg_Wr_Data = 'b0;
            ALU_FUN     = 'b0;
            RdEn        = 'b0;
            WrEn        = 'b0;
            ALU_EN      = 'b0;
            int_addr    = 'b0;
        end

    endcase
end
endmodule
