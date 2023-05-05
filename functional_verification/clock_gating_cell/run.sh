vlib work
vlog ../../rtl/clock_gating_cell/clock_gating_cell.v
vmap -c
vsim work.clock_gating_cell -voptargs="+acc"  -do "do clock_gating_cell.do"
del transcript > nul 2>&1
del modelsim.ini > nul 2>&1
del vsim.wlf > nul 2>&1
del vsim_stacktrace.vstf > nul 2>&1
del wlft3ghn8c > nul 2>&1
rmdir /s /q work > nul 2>&1