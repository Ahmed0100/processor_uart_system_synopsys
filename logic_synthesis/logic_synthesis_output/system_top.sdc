###################################################################

# Created by write_sdc on Wed Apr 26 17:16:13 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_max_area 0
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports ser_data_in]
set_load -pin_load 0.5 [get_ports ser_data_out]
set_load -pin_load 0.5 [get_ports frame_error]
set_load -pin_load 0.5 [get_ports par_error]
create_clock [get_ports ref_clk]  -name REF_CLK  -period 25  -waveform {0 12}
set_clock_latency 0  [get_clocks REF_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks REF_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks REF_CLK]
set_clock_transition -max -rise 0.1 [get_clocks REF_CLK]
set_clock_transition -min -rise 0.1 [get_clocks REF_CLK]
set_clock_transition -max -fall 0.1 [get_clocks REF_CLK]
set_clock_transition -min -fall 0.1 [get_clocks REF_CLK]
create_generated_clock [get_pins clock_gating_cell_inst/gated_clk]  -name ALU_CLK  -source [get_ports ref_clk]  -master_clock REF_CLK  -divide_by 1  -add
set_clock_latency 0  [get_clocks ALU_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks ALU_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks ALU_CLK]
set_clock_transition -max -rise 0.1 [get_clocks ALU_CLK]
set_clock_transition -min -rise 0.1 [get_clocks ALU_CLK]
set_clock_transition -max -fall 0.1 [get_clocks ALU_CLK]
set_clock_transition -min -fall 0.1 [get_clocks ALU_CLK]
create_clock [get_ports uart_clk]  -name UART_CLK  -period 271  -waveform {0 135}
set_clock_latency 0  [get_clocks UART_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLK]
set_clock_transition -max -rise 0.1 [get_clocks UART_CLK]
set_clock_transition -min -rise 0.1 [get_clocks UART_CLK]
set_clock_transition -max -fall 0.1 [get_clocks UART_CLK]
set_clock_transition -min -fall 0.1 [get_clocks UART_CLK]
create_generated_clock [get_pins clock_divider_inst/output_clk]  -name UART_TX_CLK  -source [get_ports uart_clk]  -master_clock UART_CLK  -divide_by 8  -add
set_clock_latency 0  [get_clocks UART_TX_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_TX_CLK]
set_clock_transition -max -rise 0.1 [get_clocks UART_TX_CLK]
set_clock_transition -min -rise 0.1 [get_clocks UART_TX_CLK]
set_clock_transition -max -fall 0.1 [get_clocks UART_TX_CLK]
set_clock_transition -min -fall 0.1 [get_clocks UART_TX_CLK]
set_input_delay -clock UART_CLK  54.2  [get_ports ser_data_in]
set_output_delay -clock UART_TX_CLK  54.2  [get_ports ser_data_out]
set_output_delay -clock UART_CLK  54.2  [get_ports par_error]
set_output_delay -clock UART_CLK  54.2  [get_ports frame_error]
set_clock_groups -asynchronous -name REF_CLK_1 -group [list [get_clocks REF_CLK] [get_clocks ALU_CLK]] -group [list [get_clocks UART_CLK] [get_clocks UART_TX_CLK]]
