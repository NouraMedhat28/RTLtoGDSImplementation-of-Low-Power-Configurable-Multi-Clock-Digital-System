##5. CTS
###5.1 Adding a diving cell on the clock port
set_driving_cell -lib_cell BUF_X16 -pin Z [get_ports UART_CLK]
set_driving_cell -lib_cell BUF_X16 -pin Z [get_ports REF_CLK]

###5.2 CT options
####5.2.1 Clock Tree Name, global target skew, logical DRCs
set_clock_tree_options  -target_early_delay 0.1 \
		        -target_skew 0.3 \
		        -max_capacitance 50 \
		        -max_fanout 10 \
		        -max_transition 0.1

####5.2.2 Clock tree optimization options to avoid the insertion of any new cells/buffers while optimizing on the global skew
set_clock_tree_options  -buffer_relocation true \
			-buffer_sizing true \
			-gate_relocation true \
			-gate_sizing true					

###5.3 Choosing the types of the cells used in CTS (Buffers or Inverters); the rise time of these cells is equal to their fall time (Symmetric BUF/INV)
set_clock_tree_references -references [get_lib_cells */CLKBUF*]

###5.4 Defining the NDR for CT
define_routing_rule   SystemCTRules \
                        -widths {metal3 0.2 metal4 0.4 metal5 0.4} \
                        -spacings {metal3 0.2 metal4 0.4 metal5 0.4}

###5.5 Applying the NDR on the CT through CT options
set_clock_tree_options  -routing_rule SystemCTRules \
			-layer_list "metal3 metal4 metal5"

###5.6 Avoid applying NDR on the clock sinks
set_clock_tree_options -use_default_routing_for_sinks 1

###5.7 CTS (Clock Tree Synthesis with no optimization or routing)
clock_opt -only_cts -no_clock_route

###5.8 CTO (Clock Tree Optimization)
set_fix_hold [all_clocks]
set_fix_hold_options -prioritize_tns
set_propagated_clock [all_clocks]
clock_opt -only_psyn -no_clock_route

###5.9 CT Routing
route_group -all_clock_nets

###5.10 Connecting the CT clock buffers to VDD and VSS
derive_pg_connection    -power_net VDD \
			-power_pin VDD \
			-ground_net VSS \
			-ground_pin VSS

save_mw_cel -as ${design_name}_5_cts