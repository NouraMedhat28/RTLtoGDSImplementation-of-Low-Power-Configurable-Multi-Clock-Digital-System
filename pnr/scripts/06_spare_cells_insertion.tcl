##6. Spare cells insertion
insert_spare_cells      -lib_cell {NOR2_X4 NAND2_X4} \
			-num_instances 10 \
			-cell_name SPARE_PREFIX_NAME \
			-tie

save_mw_cel -as ${design_name}_6_spare_insertion