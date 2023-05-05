vlib work
vlog data_synchronizer_tb.v
vmap -c

# Generate the inputs using the python script
python input_generator.py

# Run the testbench
vsim -voptargs="+acc" work.data_synchronizer_tb -do "add wave -position insertpoint  \
sim:/data_synchronizer_tb/data_synchronizer_inst/clk \
sim:/data_synchronizer_tb/data_synchronizer_inst/reset_n \
sim:/data_synchronizer_tb/data_synchronizer_inst/asynchronous_data \
sim:/data_synchronizer_tb/data_synchronizer_inst/asynchronous_data_valid \
sim:/data_synchronizer_tb/data_synchronizer_inst/synchronous_data_valid \
sim:/data_synchronizer_tb/data_synchronizer_inst/synchronous_data; run -all"


cat output.txt

del output.txt > nul 2>&1"
del transcript > nul 2>&1"
del modelsim.ini > nul 2>&1"
del vsim.wlf > nul 2>&1"
del vsim_stacktrace.vstf > nul 2>&1"
del wlft3ghn8c > nul 2>&1"
del *.vstf > nul 2>&1"
rmdir /s /q work > nul 2>&1"