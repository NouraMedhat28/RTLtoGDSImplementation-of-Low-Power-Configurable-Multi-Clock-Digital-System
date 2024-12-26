#Search path, TargetLibrary, LinkLibrary
set_app_var search_path "../RTL ../std_cells/NanGate/dbs"
set_app_var target_library "NangateOpenCellLibrary_slow.db NangateOpenCellLibrary_fast.db NangateOpenCellLibrary_typical.db"
set_app_var link_library "* $target_library"

file mkdir outputs
file mkdir reports


set design_name SystemTop

##Creating mw lib using tf
create_mw_lib System_lib \
              -mw_reference_library ../std_cells/NanGate/NangateOpenCellLibraryMW \
              -technology ../std_cells/NanGate/tech/NangateOpenCellLibrary.tf  \
	      -bus_naming_style {[%d]} \
              -open

##reading min and max tluplus files      
set_tlu_plus_files -max_tluplus ../std_cells/NanGate/TLUPlus/NangateOpenCellLibrary.tluplus \
                   -min_tluplus ../std_cells/NanGate/TLUPlus/NangateOpenCellLibrary.tluplus \
                   -tech2itf_map ../std_cells/NanGate/tech/NangateOpenCellLibrary.map

#Importing the netlist
import_design -format verilog ../DFT/outputs/${design_name}.v -top $design_name -cel $design_name

#Reading the constraints file
puts "cwd [pwd]"
source ./Cons/cons.tcl

##Saving the imported design
save_mw_cel -as ${design_name}_1_imported

