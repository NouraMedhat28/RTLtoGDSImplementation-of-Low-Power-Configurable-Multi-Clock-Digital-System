create_floorplan -core_utilization 0.6 \
                 -start_first_row \
                 -flip_first_row \
                 -left_io2core 10 -right_io2core 10 \
                 -top_io2core 10 -bottom_io2core 10

##To set the area manually (floorplan area = core area)
estimate_fp_area -min_width 200 -min_height 200 

save_mw_cel -as ${design_name}_2_fp

