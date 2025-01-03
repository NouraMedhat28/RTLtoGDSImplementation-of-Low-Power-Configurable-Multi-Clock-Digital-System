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

## DFT Configuration
set_scan_configuration -clock_mixing no_mix -style multiplexed_flip_flop -replace true -max_length 100

compile -scan

set test_default_period 100
set test_default_delay 0
set test_default_bidir_delay 0
set test_default_strobe 20
set test_default_strobe_width 0

## DFT ports
set_dft_signal -port [get_ports TEST_MODE] -type Constant -view existing_dft -active_state 1
set_dft_signal -port [get_ports TEST_MODE] -type TestMode -view spec -active_state 1
set_dft_signal -port [get_ports SI] -type ScanDataIn -view spec
set_dft_signal -port [get_ports SO] -type ScanDataOut -view spec
set_dft_signal -port [get_ports SCAN_EN] -type ScanEnable -view spec -active_state 1 -usage scan
set_dft_signal -port [get_ports SCAN_CLK] -type ScanClock -view existing_dft -timing {30 60}
set_dft_signal -port [get_ports SCAN_RST] -type Reset -view existing_dft -active_state 0

## Test protocol
create_test_protocol

dft_drc -verbose
preview_dft -show scan_summary

insert_dft

compile -scan -incremental

dft_drc -verbose -coverage_estimate


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
