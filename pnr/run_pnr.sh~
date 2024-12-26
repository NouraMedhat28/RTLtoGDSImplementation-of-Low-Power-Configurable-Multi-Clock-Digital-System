#!bin/bash

rm -rf logs outputs reports System_lib
rm -f command.log filenames.log icc_output.txt
mkdir logs

icc_shell -64 -f ./scripts/pnr.tcl | tee ./logs/pnr.log
