#!/bin/bash

python change_mode.py 0 0
dc_shell -f dft_script.tcl | tee "../dft_output/logs/dft_function_mode.log"

python change_mode.py 1 1
dc_shell -f dft_script.tcl | tee "../dft_output/logs/dft_test_scan_mode.log"

python change_mode.py 1 0
dc_shell -f dft_script.tcl | tee "../dft_output/logs/dft_test_capture_mode.log"

# Clean the directory from temporary files
rm -f command.log
rm -f filenames.log
rm -f default.svf
rm -f -r alib-52
rm -f filenames*
rm -f *~