library verilog;
use verilog.vl_types.all;
entity UART_TX is
    generic(
        size            : integer := 8
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        ParallelData    : in     vl_logic_vector;
        ParityType      : in     vl_logic;
        ParityEn        : in     vl_logic;
        DataValid       : in     vl_logic;
        Busy            : out    vl_logic;
        TXOut           : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end UART_TX;
