library verilog;
use verilog.vl_types.all;
entity SystemControl is
    generic(
        BusWidth        : integer := 8;
        FuncWidth       : integer := 4;
        AddWidth        : integer := 4
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        RdData_Valid    : in     vl_logic;
        RX_D_VLD        : in     vl_logic;
        ALU_Valid       : in     vl_logic;
        ALU_OUT         : in     vl_logic_vector;
        RX_P_Data       : in     vl_logic_vector;
        RdData          : in     vl_logic_vector;
        TX_Busy         : in     vl_logic;
        ALU_EN          : out    vl_logic;
        ALU_FUN         : out    vl_logic_vector;
        Address         : out    vl_logic_vector;
        RdEn            : out    vl_logic;
        WrEn            : out    vl_logic;
        WrData          : out    vl_logic_vector;
        TX_P_Data       : out    vl_logic_vector;
        TX_D_VLD        : out    vl_logic;
        CLKG_EN         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
    attribute mti_svvh_generic_type of FuncWidth : constant is 1;
    attribute mti_svvh_generic_type of AddWidth : constant is 1;
end SystemControl;
