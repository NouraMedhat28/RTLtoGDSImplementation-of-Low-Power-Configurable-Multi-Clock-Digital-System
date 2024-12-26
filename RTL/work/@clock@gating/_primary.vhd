library verilog;
use verilog.vl_types.all;
entity ClockGating is
    port(
        CLK             : in     vl_logic;
        CLK_EN          : in     vl_logic;
        GATED_CLK       : out    vl_logic
    );
end ClockGating;
