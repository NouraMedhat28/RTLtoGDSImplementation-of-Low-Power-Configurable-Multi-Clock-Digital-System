module ClockDivider8 (
    input  wire  i_ref_clk,
    input  wire  i_rst_n,
    output wire  o_div_clk
);

   wire i_ref_clk_2, i_ref_clk_4;

   ClockDivider2         ClockDivider2Top
   (.i_ref_clk           (i_ref_clk),
    .i_rst_n             (i_rst_n),
    .o_div_clk           (i_ref_clk_2)
   ); 

   ClockDivider2         ClockDivider4Top
    (.i_ref_clk           (i_ref_clk_2),
     .i_rst_n             (i_rst_n),
     .o_div_clk           (i_ref_clk_4)
    ); 

    ClockDivider2         ClockDivider8Top
    (.i_ref_clk           (i_ref_clk_4),
     .i_rst_n             (i_rst_n),
     .o_div_clk           (o_div_clk)
    ); 
endmodule