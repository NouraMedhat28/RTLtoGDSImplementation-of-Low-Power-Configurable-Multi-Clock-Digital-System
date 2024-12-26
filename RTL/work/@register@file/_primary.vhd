library verilog;
use verilog.vl_types.all;
entity RegisterFile is
    generic(
        AddWidth        : integer := 4;
        BusWidth        : integer := 8;
        RegDepth        : integer := 16
    );
    port(
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        Address         : in     vl_logic_vector;
        RdEn            : in     vl_logic;
        WrEn            : in     vl_logic;
        WrData          : in     vl_logic_vector;
        RdData_Valid    : out    vl_logic;
        RdData          : out    vl_logic_vector;
        REG0            : out    vl_logic_vector;
        REG1            : out    vl_logic_vector;
        REG2            : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of AddWidth : constant is 1;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
    attribute mti_svvh_generic_type of RegDepth : constant is 1;
end RegisterFile;
