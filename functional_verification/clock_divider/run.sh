vlib work
vlog ../../rtl/clock_divider/clock_divider.v
vmap -c


# Open the waveform
vsim work.clock_divider -voptargs="+acc"  -do "do clock_divider.do"


del output.txt > nul 2>&1
del transcript > nul 2>&1
del modelsim.ini > nul 2>&1
del vsim.wlf > nul 2>&1
del vsim_stacktrace.vstf > nul 2>&1
del wlft3ghn8c > nul 2>&1
del *.vstf > nul 2>&1
rmdir /s /q work > nul 2>&1