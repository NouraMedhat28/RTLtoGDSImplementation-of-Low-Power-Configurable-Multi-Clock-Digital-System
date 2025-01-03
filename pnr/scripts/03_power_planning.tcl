###3.1 Defining the power nets and pins to be logically connected to each other and then connected to the standard cells 
derive_pg_connection -power_net VDD \
		     -ground_net VSS \
		     -power_pin VDD \
		     -ground_pin VSS

set_fp_rail_constraints -set_ring -nets {VDD VSS} \
			-vertical_ring_layer {metal10 metal8} \
			-horizontal_ring_layer {metal9 metal7} \
			-ring_spacing 2 \
			-ring_width 5 \
			-extend_strap core_ring

set_fp_rail_constraints -add_layer -layer metal10 -direction vertical \
			-max_strap 20 -min_strap 5 -min_width 2.5 -spacing minimum

set_fp_rail_constraints -add_layer -layer metal9 -direction horizontal \
			-max_strap 20 -min_strap 5 -min_width 2.5 -spacing minimum

set_fp_rail_constraints -add_layer -layer metal8 -direction vertical \
			-max_strap 20 -min_strap 5 -min_width 2.5 -spacing minimum

set_fp_rail_constraints -add_layer -layer metal7 -direction horizontal \
			-max_strap 20 -min_strap 5 -min_width 2.5 -spacing minimum

#tap layer
set_fp_rail_constraints -add_layer -layer metal6 -direction vertical \
			-max_strap 20 -min_strap 5 -min_width 2.5 -spacing minimum
set_fp_rail_constraints -set_global

###power straps
set die_llx [lindex [lindex [get_attribute [get_die_area] bbox] 0] 0]; #llx lower left x
set die_lly [lindex [lindex [get_attribute [get_die_area] bbox] 0] 1]
set die_urx [lindex [lindex [get_attribute [get_die_area] bbox] 1] 0]; #urx upper right x
set die_ury [lindex [lindex [get_attribute [get_die_area] bbox] 1] 1]

set i [expr $die_llx + 10]

while {$i < [expr $die_urx - 10]} {
	create_fp_virtual_pad -net VSS -point "[$i $die_lly]"
	create_fp_virtual_pad -net VDD -point "[[expr $i + 10] $die_lly]"
	create_fp_virtual_pad -net VSS -point "[$die_urx $i]"
	create_fp_virtual_pad -net VDD -point "[$die_urx [expr $i + 10]]"
	set i [expr $i + 10]
}


for {set i "[expr $die_lly +10]"} {$i < "[expr $die_ury - 10]"} {set i [expr $i + 10]} {
	create_fp_virtual_pad -net VSS -point "[$die_llx $i]"
	create_fp_virtual_pad -net VDD -point "[$die_llx [expr $i + 10]]"
	create_fp_virtual_pad -net VSS -point "[$die_urx $i]"
	create_fp_virtual_pad -net VDD -point "[$die_urx [expr $i + 10]]"
}
synthesize_fp_rail -nets {VDD VSS} -synthesize_power_plan -target_voltage_drop 22 -voltage_supply 1.1 \
		   -use_strap_ends_as_pads
commit_fp_rail

save_mw_cel -as ${design_name}_3_power