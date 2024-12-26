# reset
set_fp_rail_constraints -remove_all_layers
remove_fp_virtual_pad -all              
set_fp_rail_strategy -reset             
set_fp_block_ring_constraints -remove_all
set_fp_rail_region_constraints  -remove 
# global constraints
set_fp_rail_constraints -set_global 

# layer constraints
set_fp_rail_constraints -add_layer  -layer metal10 -direction vertical -max_strap 20 -min_strap 5 -min_width 2.500000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal9 -direction horizontal -max_strap 20 -min_strap 5 -min_width 2.500000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal8 -direction vertical -max_strap 20 -min_strap 5 -min_width 2.500000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal7 -direction horizontal -max_strap 20 -min_strap 5 -min_width 2.500000 -spacing minimum 
set_fp_rail_constraints -add_layer  -layer metal6 -direction vertical -max_strap 20 -min_strap 5 -min_width 2.500000 -spacing minimum 

# ring and strap constraints
set_fp_rail_constraints  -set_ring -nets { VDD VSS } -horizontal_ring_layer { metal9,metal7 } -vertical_ring_layer { metal10,metal8 } -ring_width 5.000000 -ring_spacing 2.000000 -extend_strap core_ring 

# strategies
set_fp_rail_strategy  -use_tluplus true 

# block ring constraints

# regions

# virtual pads

# synthesize_fp_rail 
synthesize_fp_rail -nets { VDD VSS } -voltage_supply 1.100000 -power_budget 1000.000000  -target_voltage_drop 22.000000 -use_strap_ends_as_pads  
