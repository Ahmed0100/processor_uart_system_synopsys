# Run the testbench
vlib work
vlog bus_synchronizer_tb.v
vmap -c


# Generate the gray codes using the python script
#python gray_code_generator.py

vsim -voptargs="+acc" work.bus_synchronizer_tb -do "add wave -position insertpoint  \
sim:/bus_synchronizer_tb/U_bus_synchronizer/clk \
sim:/bus_synchronizer_tb/U_bus_synchronizer/reset \
sim:/bus_synchronizer_tb/U_bus_synchronizer/asynchronous_data \
sim:/bus_synchronizer_tb/U_bus_synchronizer/synchronous_data; run -all"


del output.txt > nul 2>&1"
del transcript > nul 2>&1"
del modelsim.ini > nul 2>&1"
del vsim.wlf > nul 2>&1"
del vsim_stacktrace.vstf > nul 2>&1"
del wlft3ghn8c > nul 2>&1"
del *.vstf > nul 2>&1"
rmdir /s /q work > nul 2>&1"