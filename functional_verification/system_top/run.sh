# set total_test_cases [exec python test_cases_generator.py]

vlib work
vlog system_top_tb.v
vmap -c

# if {$argc == 0} {
    vsim -voptargs="+acc" work.system_top_tb -do "run -all"
    # mem save -o output_files/register_file_verilog.mem -f binary -wordsperline 1 /system_top_tb/system_top_inst/register_file_inst/memory;"

# } elseif {$argc == 1 && [lindex $argv 0] == "-w"} {
#     vsim work.system_top_tb -do "add wave -position insertpoint  \
#         sim:/system_top_tb/UART_clk_tb \
#         sim:/system_top_tb/U_system_top/UART_transmitter_clk \
#         sim:/system_top_tb/reference_clk_tb \
#         sim:/system_top_tb/serial_data_in_tb \
#         sim:/system_top_tb/U_system_top/U_UART/receiver_parallel_data_valid \
#         sim:/system_top_tb/U_system_top/U_UART/receiver_parallel_data \
#         sim:/system_top_tb/U_system_top/U_system_controller/receiver_parallel_data_valid_synchronized \
#         sim:/system_top_tb/U_system_top/U_system_controller/receiver_parallel_data_synchronized \
#         sim:/system_top_tb/U_system_top/U_register_file/write_enable \
#         sim:/system_top_tb/U_system_top/U_register_file/write_data \
#         sim:/system_top_tb/U_system_top/U_register_file/read_enable \
#         sim:/system_top_tb/U_system_top/U_register_file/address \
#         sim:/system_top_tb/U_system_top/U_register_file/read_data_valid \
#         sim:/system_top_tb/U_system_top/U_register_file/read_data \
#         sim:/system_top_tb/U_system_top/U_system_controller/U_UART_receiver_controller/ALU_clk_enable \
#         sim:/system_top_tb/U_system_top/U_ALU/clk \
#         sim:/system_top_tb/U_system_top/U_ALU/enable \
#         sim:/system_top_tb/U_system_top/U_ALU/ALU_result_valid \
#         sim:/system_top_tb/U_system_top/U_ALU/ALU_result \
#         sim:/system_top_tb/U_system_top/U_system_controller/receiver_controller_enable \
#         sim:/system_top_tb/U_system_top/U_system_controller/transmitter_parallel_data_valid \
#         sim:/system_top_tb/U_system_top/U_system_controller/transmitter_parallel_data \
#         sim:/system_top_tb/U_system_top/U_UART/transmitter_parallel_data_valid \
#         sim:/system_top_tb/U_system_top/U_UART/transmitter_parallel_data \
#         sim:/system_top_tb/U_system_top/U_UART/transmitter_busy \
#         sim:/system_top_tb/serial_data_out_tb; \
#         radix signal sim:/system_top_tb/U_system_top/U_UART/receiver_parallel_data Hexadecimal; \
#         radix signal sim:/system_top_tb/U_system_top/U_system_controller/receiver_parallel_data_synchronized Hexadecimal; \
#         radix signal sim:/system_top_tb/U_system_top/U_register_file/write_data Hexadecimal; \
#         radix signal sim:/system_top_tb/U_system_top/U_register_file/address Hexadecimal; \
#         radix signal sim:/system_top_tb/U_system_top/U_register_file/read_data Hexadecimal; \
#         radix signal sim:/system_top_tb/U_system_top/U_ALU/ALU_result Hexadecimal; \
#         radix signal sim:/system_top_tb/U_system_top/U_system_controller/transmitter_parallel_data Hexadecimal; \
#         radix signal sim:/system_top_tb/U_system_top/U_UART/transmitter_parallel_data Hexadecimal; \
#         run -all; mem save -o register_file_verilog.mem -f binary -wordsperline 1 /system_top_tb/U_system_top/U_register_file/memory;"

# } else {
#     puts "Invalid arguments..."
# }

# set output [exec python evaluate.py $total_test_cases]
# puts $output

# # Clean the directory from temporary files
# exec python clean.py

# Change prescale value to the default value (8)
# exec python change_prescale.py