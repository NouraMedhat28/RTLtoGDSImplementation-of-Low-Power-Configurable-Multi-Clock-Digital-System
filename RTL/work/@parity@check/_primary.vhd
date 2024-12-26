library verilog;
use verilog.vl_types.all;
entity ParityCheck is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        Enable          : in     vl_logic;
        ParityEn        : in     vl_logic;
        Data            : in     vl_logic_vector(7 downto 0);
        ParityType      : in     vl_logic;
        SampledParity   : in     vl_logic;
        ParityError     : out    vl_logic
    );
end ParityCheck;
