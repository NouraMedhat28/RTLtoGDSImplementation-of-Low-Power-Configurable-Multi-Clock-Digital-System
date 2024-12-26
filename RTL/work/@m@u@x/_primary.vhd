library verilog;
use verilog.vl_types.all;
entity MUX is
    port(
        MuxSelection    : in     vl_logic_vector(1 downto 0);
        SerData         : in     vl_logic;
        ParityBit       : in     vl_logic;
        TXOut           : out    vl_logic
    );
end MUX;
