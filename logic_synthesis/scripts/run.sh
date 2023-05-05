#!/bin/bash
dc_shell -f logic_synthesis_script.tcl | tee "../logic_synthesis_output/logic_synthesis.log"

rm -f command.log
rm -f filenames.log
rm -f default.svf 
rm -f -r alib-52 
rm -f filenames*
rm -f *~