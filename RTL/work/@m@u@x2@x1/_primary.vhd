library verilog;
use verilog.vl_types.all;
entity MUX2X1 is
    port(
        SEL             : in     vl_logic;
        IN0             : in     vl_logic;
        IN1             : in     vl_logic;
        \OUT\           : out    vl_logic
    );
end MUX2X1;
