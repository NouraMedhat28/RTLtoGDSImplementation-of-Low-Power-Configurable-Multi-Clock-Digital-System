library verilog;
use verilog.vl_types.all;
entity StartCheck is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        Enable          : in     vl_logic;
        SampledStart    : in     vl_logic;
        StartError      : out    vl_logic
    );
end StartCheck;
