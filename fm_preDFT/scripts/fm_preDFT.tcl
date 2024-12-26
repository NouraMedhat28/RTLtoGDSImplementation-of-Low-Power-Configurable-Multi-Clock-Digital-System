set DWC_STD_DB "../std_cells/NanGate/dbs/NangateOpenCellLibrary_fast.db ../std_cells/NanGate/dbs/NangateOpenCellLibrary_slow.db ../std_cells/NanGate/dbs/NangateOpenCellLibrary_typical.db"
set design_name SystemTop
file mkdir reports

set synopsys_auto_setup true
set_svf "../Syn_preDFT/SystemTop.svf"

## Reading Reference Container Standarad Cells, RTL
read_db -container Ref $DWC_STD_DB
foreach rtlfile [glob -nocomplain -directory ../RTL *.v] {
	read_verilog -container Ref $rtlfile
}
set_reference_design $design_name
set_top $design_name

## Reading Implementation Container
read_db -container Imp $DWC_STD_DB
read_verilog -container Imp "../Syn_preDFT/outputs/${design_name}.v"
set_implementation_design $design_name
set_top $design_name

## Match
match

## Verify
verify

## Reports
report_passing_points    > reports/${design_name}_passing_points.rpt
report_failing_points    > reports/${design_name}_failing_points.rpt
report_aborted_points    > reports/${design_name}_aborted_points.rpt
report_unverified_points > reports/${design_name}_unverified_points.rpt




