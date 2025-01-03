module ALU #(
    parameter OpWidth   = 8,
    parameter FuncWidth = 4
) (
    input  wire                   CLK,
    input  wire                   RST,
    input  wire                   Enable,
    input  wire [OpWidth-1:0]     A,
    input  wire [OpWidth-1:0]     B,
    input  wire [FuncWidth-1:0]   ALU_FUN,
    output reg  [2*OpWidth-1:0]   ALU_OUT,
    output reg                    OUT_VALID

);

always @(posedge CLK or negedge RST) begin
    if (!RST) begin
        ALU_OUT   <= 'b0;
        OUT_VALID <= 1'b0;
    end
    else if (Enable) begin
        case (ALU_FUN)
         'b0000 : begin
            ALU_OUT   <= A + B;
            OUT_VALID <= 1'b1;
         end 
         'b0001 : begin
            ALU_OUT   <= A - B;
            OUT_VALID <= 1'b1;
         end
         'b0010 : begin
            ALU_OUT   <= A * B;
            OUT_VALID <= 1'b1;
         end
         'b0011 : begin
            ALU_OUT   <= A / B;
            OUT_VALID <= 1'b1;
         end
         'b0100 : begin
            ALU_OUT   <= A & B;
            OUT_VALID <= 1'b1;
         end
         'b0101 : begin
            ALU_OUT   <= A | B;
            OUT_VALID <= 1'b1;
         end
         'b0110 : begin
            ALU_OUT   <= ~(A & B);
            OUT_VALID <= 1'b1;
         end
         'b0111 : begin
            ALU_OUT   <= ~(A | B);
            OUT_VALID <= 1'b1;
         end
         'b1000 : begin
            ALU_OUT   <= A ^ B;
            OUT_VALID <= 1'b1;
         end
         'b1001 : begin
            ALU_OUT   <= A ~^ B;
            OUT_VALID <= 1'b1;
         end
         'b1010 : begin
            ALU_OUT   <= (A==B)? 'b1 : 'b0;
            OUT_VALID <= 1'b1;
         end
         'b1011 : begin
            ALU_OUT   <= (A>B)? 'b1 : 'b0;
            OUT_VALID <= 1'b1;
         end
         'b1100 : begin
            ALU_OUT   <= A >> 1;
            OUT_VALID <= 1'b1;
         end
         'b1101 : begin
            ALU_OUT   <= A << 1;
            OUT_VALID <= 1'b1;
         end
            default: begin
                ALU_OUT   <= 'b0;
                OUT_VALID <= 1'b0;
            end
        endcase
    end
    else begin
        ALU_OUT   <= 'b0;
        OUT_VALID <= 1'b0;
    end
end
    
endmodule
