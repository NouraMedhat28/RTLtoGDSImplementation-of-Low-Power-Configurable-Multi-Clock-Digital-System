library verilog;
use verilog.vl_types.all;
entity UART_RX is
    port(
        RX_IN           : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        ParityEn        : in     vl_logic;
        ParityType      : in     vl_logic;
        PData           : out    vl_logic_vector(7 downto 0);
        DataValid       : out    vl_logic
    );
end UART_RX;
