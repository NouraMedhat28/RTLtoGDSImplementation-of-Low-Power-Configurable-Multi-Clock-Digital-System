library verilog;
use verilog.vl_types.all;
entity DataSync is
    generic(
        BusWidth        : integer := 8
    );
    port(
        UnsyncBus       : in     vl_logic_vector;
        DestCLK         : in     vl_logic;
        DestRST         : in     vl_logic;
        SyncBus         : out    vl_logic_vector
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of BusWidth : constant is 1;
end DataSync;
