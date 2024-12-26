set_write_stream_options -map_layer ../std_cells/NanGate/tech/macro.map -child_depth 20 -flatten_via
write_stream -format gds -lib_name System_lib -cells {SystemTop_7_routing} ./outputs/System.gds
