library verilog;
use verilog.vl_types.all;
entity StopCheck is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        Enable          : in     vl_logic;
        SampledStop     : in     vl_logic;
        StopError       : out    vl_logic
    );
end StopCheck;
