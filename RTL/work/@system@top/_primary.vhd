library verilog;
use verilog.vl_types.all;
entity SystemTop is
    generic(
        BusWidth        : integer := 8;
        AddWidth        : integer := 4;
        RegDepth        : integer := 16;
        FuncWidth       : integer := 4
    );
    port(
        REF_CLK         : in     vl_logic;
        RX_IN           : in     vl_logic;
        RST             : in     vl_logic;
        UART_CLK        : in     vl_logic;
        SCAN_CLK        : in     vl_logic;
        SCAN_RST        : in     vl_logic;
        SCAN_EN         : in     vl_logic;
        SI              : in     vl_logic;
        SO              : out    vl_logic;
        TX_OUT          : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
    attribute mti_svvh_generic_type of AddWidth : constant is 1;
    attribute mti_svvh_generic_type of RegDepth : constant is 1;
    attribute mti_svvh_generic_type of FuncWidth : constant is 1;
end SystemTop;
