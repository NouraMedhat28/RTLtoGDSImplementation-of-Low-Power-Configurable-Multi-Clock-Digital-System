module ClockDivider2
(
    input  wire                i_ref_clk,
    input  wire                i_rst_n,
    output reg                 o_div_clk
);

    always @(posedge i_ref_clk or negedge i_rst_n) begin
        if (!i_rst_n) begin
            o_div_clk <= 1'b0;
        end
        else begin
            o_div_clk <=~ o_div_clk;
        end
    end
endmodule