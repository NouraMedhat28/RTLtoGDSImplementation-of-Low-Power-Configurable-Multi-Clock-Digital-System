library verilog;
use verilog.vl_types.all;
entity OverSampling is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        EdgeCounter     : in     vl_logic_vector(2 downto 0);
        SData           : in     vl_logic;
        SampledBit      : out    vl_logic
    );
end OverSampling;
