vlib work
vlog uart_transmitter_controller_tb.v
vmap -c

    vsim -voptargs="+acc"  work.uart_transmitter_controller_tb -do "run -all;"


    # vsim -voptargs="+acc" work.uart_transmitter_controller -do "do uart_transmitter_controller.do"



del output.txt > nul 2>&1
del transcript > nul 2>&1
del modelsim.ini > nul 2>&1
del vsim.wlf > nul 2>&1
del vsim_stacktrace.vstf > nul 2>&1
del wlft3ghn8c > nul 2>&1
del *.vstf > nul 2>&1
rmdir /s /q work > nul 2>&1