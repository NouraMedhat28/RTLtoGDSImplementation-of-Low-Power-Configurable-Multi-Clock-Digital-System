library verilog;
use verilog.vl_types.all;
entity UART is
    port(
        RX_IN           : in     vl_logic;
        RX_CLK          : in     vl_logic;
        TX_CLK          : in     vl_logic;
        RX_RST          : in     vl_logic;
        TX_RST          : in     vl_logic;
        ParityEn        : in     vl_logic;
        ParityType      : in     vl_logic;
        TX_D_VLD        : in     vl_logic;
        TX_P_Data       : in     vl_logic_vector(7 downto 0);
        TX_Busy         : out    vl_logic;
        RX_P_Data       : out    vl_logic_vector(7 downto 0);
        RX_D_VLD        : out    vl_logic;
        TX_S_Data       : out    vl_logic
    );
end UART;
