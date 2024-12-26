library verilog;
use verilog.vl_types.all;
entity EdgeBitCounter is
    port(
        Enable          : in     vl_logic;
        ParityEn        : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        BitCounter      : out    vl_logic_vector(3 downto 0);
        EdgeCounter     : out    vl_logic_vector(4 downto 0)
    );
end EdgeBitCounter;
