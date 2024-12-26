library verilog;
use verilog.vl_types.all;
entity FSM_TX is
    port(
        DataValid       : in     vl_logic;
        ParityEn        : in     vl_logic;
        SerDone         : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        MuxSelection    : out    vl_logic_vector(1 downto 0);
        SerEn           : out    vl_logic;
        Busy            : out    vl_logic
    );
end FSM_TX;
