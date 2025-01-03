##7. Routing
###7.1 Pre-routing checks
check_physical_design -stage pre_route_opt
all_ideal_nets
all_high_fanout -nets -threshold 501
check_routeability > ./reports/routeability.rpt

###7.2 Setting the delay calculation model
set_delay_calculation_options -arnoldi_effort low

###7.3 Routing options
set_route_options -groute_timing_driven true \
		  -groute_incremental true \
		  -track_assign_timing_driven true  
##### Notes: groute stands for global routing, and making it timing driven will help in taking timing into consideration in this stage. same_net_notch
#####	     is a DRC

###7.4 Signal Integrity (SI) options
set_si_options  -route_xtalk_prevention true \
		-delta_delay true \
		-min_delta_delay true \
		-static_noise true \
		-timing_window true

###7.5 Consider hold fixing 
set_fix_hold [all_clocks]

###7.6 Propagated Clocks
set_propagated_clock [all_clocks]

###7.7 Routing and optimization
route_opt
psynopt -only_hold_time -congestion
 	

save_mw_cel -as ${design_name}_7_routing