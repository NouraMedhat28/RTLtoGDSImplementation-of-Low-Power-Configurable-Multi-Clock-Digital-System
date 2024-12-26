library verilog;
use verilog.vl_types.all;
entity ClockDivider8 is
    port(
        i_ref_clk       : in     vl_logic;
        i_rst_n         : in     vl_logic;
        o_div_clk       : out    vl_logic
    );
end ClockDivider8;
