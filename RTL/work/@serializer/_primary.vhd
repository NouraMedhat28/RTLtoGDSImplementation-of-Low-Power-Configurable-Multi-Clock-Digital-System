library verilog;
use verilog.vl_types.all;
entity Serializer is
    generic(
        size            : integer := 8
    );
    port(
        ParallelData    : in     vl_logic_vector;
        DataValid       : in     vl_logic;
        SerEn           : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        SerDone         : out    vl_logic;
        SerData         : out    vl_logic
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of size : constant is 1;
end Serializer;
