library verilog;
use verilog.vl_types.all;
entity FSM is
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        SData           : in     vl_logic;
        StartError      : in     vl_logic;
        ParityError     : in     vl_logic;
        ParityEn        : in     vl_logic;
        StopError       : in     vl_logic;
        BitCounter      : in     vl_logic_vector(3 downto 0);
        EdgeCounter     : in     vl_logic_vector(2 downto 0);
        CounterEnable   : out    vl_logic;
        ParityCheckEn   : out    vl_logic;
        StartCheckEn    : out    vl_logic;
        StopCheckEn     : out    vl_logic;
        DeserializerEn  : out    vl_logic;
        DataValid       : out    vl_logic;
        OutData         : out    vl_logic
    );
end FSM;
