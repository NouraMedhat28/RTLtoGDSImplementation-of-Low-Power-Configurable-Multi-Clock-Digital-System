library verilog;
use verilog.vl_types.all;
entity Synchronizer is
    port(
        UnsyncBit       : in     vl_logic;
        CLK             : in     vl_logic;
        RST             : in     vl_logic;
        SyncBit         : out    vl_logic
    );
end Synchronizer;
