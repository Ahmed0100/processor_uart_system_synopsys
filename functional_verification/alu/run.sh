vlib work
vlog alu_tb.v
vmap -c

# Run the testbench
vsim -c work.alu_tb -do "run -all; quit -f"

del output.txt > nul 2>&1"
del transcript > nul 2>&1"
del modelsim.ini > nul 2>&1"
del vsim.wlf > nul 2>&1"
del vsim_stacktrace.vstf > nul 2>&1"
del wlft3ghn8c > nul 2>&1"
del *.vstf > nul 2>&1"
rmdir /s /q work > nul 2>&1"