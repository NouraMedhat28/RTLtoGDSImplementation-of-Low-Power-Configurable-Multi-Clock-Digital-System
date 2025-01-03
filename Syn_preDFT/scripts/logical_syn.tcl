#Search path, TargetLibrary, LinkLibrary
set_app_var search_path "../RTL ../std_cells/NanGate/dbs"
set_app_var target_library "NangateOpenCellLibrary_fast.db NangateOpenCellLibrary_slow.db NangateOpenCellLibrary_typical.db"
set_app_var link_library "* $target_library"

file mkdir outputs
file mkdir reports
file mkdir work

set design_name SystemTop
define_design_lib work -path work
set_svf SystemTop.svf
#Reading RTL Files
set rtl_files [glob -nocomplain -directory ../RTL *.v]

foreach rtl_file $rtl_files {
    analyze -format verilog $rtl_file
}  
elaborate $design_name

#Checking the design
check_design

#Reading the constraints file
puts "cwd [pwd]"
source ./Cons/cons.tcl

##Performing Synthesis
link
compile 

#Saving the verilog netlist
write_file -format verilog -hierarchy -output outputs/${design_name}.v

#Saving DDC netlist
write -f ddc -output outputs/${design_name}.ddc

#Saving SDF file
write_sdf outputs/${design_name}.sdf

#Saving SDC file
write_sdc outputs/${design_name}.sdc

set_svf -off

##Reports
report_timing > ./reports/${design_name}_timing.rpt
report_qor    > ./reports/${design_name}_qor.rpt
