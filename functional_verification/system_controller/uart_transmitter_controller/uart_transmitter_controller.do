add wave -position insertpoint  \
sim:/uart_transmitter_controller/clk \
sim:/uart_transmitter_controller/reset_n \
sim:/uart_transmitter_controller/alu_result_valid \
sim:/uart_transmitter_controller/alu_result \
sim:/uart_transmitter_controller/read_data_valid \
sim:/uart_transmitter_controller/read_data \
sim:/uart_transmitter_controller/transmitter_busy_sync\
sim:/uart_transmitter_controller/transmitter_parallel_data_valid \
sim:/uart_transmitter_controller/transmitter_parallel_data \
sim:/uart_transmitter_controller/current_state \
sim:/uart_transmitter_controller/transmission_next_state \
sim:/uart_transmitter_controller/transmission_current_state


force -freeze sim:/uart_transmitter_controller/clk 0 0, 1 {10 ns} -r 20 ns
force -freeze sim:/uart_transmitter_controller/reset_n 0 0
run {20 ns}

force -freeze sim:/uart_transmitter_controller/reset_n 1 0
force -freeze sim:/uart_transmitter_controller/alu_result_valid 1 0
force -freeze sim:/uart_transmitter_controller/alu_result 1110_0111_1010_0110 0
force -freeze sim:/uart_transmitter_controller/transmitter_busy_sync 0 0
run {1000 ns}


force -freeze sim:/uart_transmitter_controller/transmitter_busy_sync 1 0
run {1000 ns}

force -freeze sim:/uart_transmitter_controller/transmitter_busy_sync 0 0
run {1000 ns}

force -freeze sim:/uart_transmitter_controller/transmitter_busy_sync 1 0
run {1000 ns}