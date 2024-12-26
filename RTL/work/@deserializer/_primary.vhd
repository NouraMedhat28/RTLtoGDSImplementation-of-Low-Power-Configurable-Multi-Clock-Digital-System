library verilog;
use verilog.vl_types.all;
entity Deserializer is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        SampledBit      : in     vl_logic;
        Enable          : in     vl_logic;
        OutData         : in     vl_logic;
        PData           : out    vl_logic_vector(7 downto 0)
    );
end Deserializer;
