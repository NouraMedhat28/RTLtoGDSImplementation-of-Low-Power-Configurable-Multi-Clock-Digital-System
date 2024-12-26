library verilog;
use verilog.vl_types.all;
entity CTRL_TX is
    generic(
        BusWidth        : integer := 8
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        ALU_Valid       : in     vl_logic;
        ALU_OUT         : in     vl_logic_vector;
        RdData_Valid    : in     vl_logic;
        RdData          : in     vl_logic_vector;
        TX_Busy         : in     vl_logic;
        TX_D_VLD        : out    vl_logic;
        TX_P_Data       : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
end CTRL_TX;
