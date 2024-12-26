#!bin/bash

mkdir logs
dc_shell -f ./scripts/syn_dft.tcl | tee ./logs/dft.log