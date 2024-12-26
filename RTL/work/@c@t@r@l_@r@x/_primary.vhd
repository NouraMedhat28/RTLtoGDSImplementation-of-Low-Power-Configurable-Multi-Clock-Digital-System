library verilog;
use verilog.vl_types.all;
entity CTRL_RX is
    generic(
        BusWidth        : integer := 8;
        FuncWidth       : integer := 4;
        AddWidth        : integer := 4
    );
    port(
        RX_P_Data       : in     vl_logic_vector;
        RX_D_VLD        : in     vl_logic;
        RST             : in     vl_logic;
        CLK             : in     vl_logic;
        Reg_Addr        : out    vl_logic_vector;
        Reg_Wr_Data     : out    vl_logic_vector;
        ALU_FUN         : out    vl_logic_vector;
        RdEn            : out    vl_logic;
        WrEn            : out    vl_logic;
        ALU_EN          : out    vl_logic;
        CLKG_EN         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
    attribute mti_svvh_generic_type of FuncWidth : constant is 1;
    attribute mti_svvh_generic_type of AddWidth : constant is 1;
end CTRL_RX;
