vlib work
vlog uart_receiver_controller_tb.v
vmap -c

# if {$argc == 0} {
#     # Run the testbench
    vsim -voptargs="+acc" work.uart_receiver_controller_tb

#     # Read the output file to report the test cases
#     set output_file_handle [open "output.txt" r]
#     set file_contents [read $output_file_handle]
#     close $output_file_handle
#     puts $file_contents

# } elseif {$argc == 1 && [lindex $argv 0] == "-w"} {
#     # Open the waveform
#     vsim work.UART_receiver_controller -do "do UART_receiver_controller.do"

# } else {
#     puts "Invalid program arguments..."
# }


del output.txt > nul 2>&1
del transcript > nul 2>&1
del modelsim.ini > nul 2>&1
del vsim.wlf > nul 2>&1
del vsim_stacktrace.vstf > nul 2>&1
del wlft3ghn8c > nul 2>&1
del *.vstf > nul 2>&1
rmdir /s /q work > nul 2>&1