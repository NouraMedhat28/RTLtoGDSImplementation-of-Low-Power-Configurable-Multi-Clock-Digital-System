module Synchronizer (
    input  wire UnsyncBit,
    input  wire CLK,
    input  wire RST,
    input  wire EN,
    output reg  SyncBit
);

    reg int_sig;
    always @(posedge CLK or negedge RST) begin
        if (!RST) begin
            SyncBit  <= 1'b0;
            int_sig  <= 1'b0;
        end
        else if (EN) begin
            int_sig  <= UnsyncBit;
            SyncBit  <= int_sig;
        end
   end 
endmodule
