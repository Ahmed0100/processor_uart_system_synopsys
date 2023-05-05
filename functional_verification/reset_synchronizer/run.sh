vlib work
vlog ../../rtl/reset_synchronizer/reset_synchronizer.v
vmap -c
vsim -voptargs="+acc" work.reset_synchronizer -do "do reset_synchronizer.do"

del transcript > nul 2>&1
del modelsim.ini > nul 2>&1
del vsim.wlf > nul 2>&1
del vsim_stacktrace.vstf > nul 2>&1
del wlft3ghn8c > nul 2>&1
rmdir /s /q work > nul 2>&1