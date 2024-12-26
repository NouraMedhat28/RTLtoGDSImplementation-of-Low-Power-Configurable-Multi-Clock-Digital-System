#!bin/bash
mkdir logs
fm_shell -f ./scripts/fm_postDFT.tcl | tee ./logs/fm_postDFT.log