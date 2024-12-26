##4. Placement 
###4.1 Pre-placement checks
set_ignored_layers -max_routing_layer metal6
report_ignored_layer > ./reports/ignored_layers.rpt
check_physical_design -stage pre_place_opt
check_physical_constraints

###4.2 Placement Mega Command
place_opt
##place_opt is a mega command equivalent to the following atomic commands combined together
#### 4.2.1 create_placement                            ---> for coarse placement
#### 4.2.2 legalize_placement                          ---> for legalization
#### 4.2.3 add_tie_cell $net $tie1_cell $tie0_cell     ---> Tie Insertion
#### 4.2.4 split_fanout                                ---> for high fan-out synthesis HFS

###4.3 Post-placement checks
check_legality    > ./reports/legality.rpt
report_timing     > ./reports/post_placement_timing.rpt
report_congestion > ./reports/post_placement_congestion.rpt

save_mw_cel -as ${design_name}_4_placement