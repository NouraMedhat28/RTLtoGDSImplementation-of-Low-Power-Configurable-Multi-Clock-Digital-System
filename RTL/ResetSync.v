module ResetSync (
    input  wire RST,
    input  wire CLK,
    output reg  SYNC_RST
);
    
    reg int_sig;
    always @(posedge CLK or negedge RST) begin
        if(!RST) begin
            int_sig  <= 1'b0;
            SYNC_RST <= 1'b0;
        end
        else begin
            int_sig  <= 1'b1;
            SYNC_RST <= int_sig;
        end
    end
endmodule