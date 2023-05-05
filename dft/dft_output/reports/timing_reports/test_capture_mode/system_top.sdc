###################################################################

# Created by write_sdc on Sat Apr 29 18:18:40 2023

###################################################################
set sdc_version 2.1

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c
set_max_area 0
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports ser_data_in]
set_load -pin_load 0.5 [get_ports ser_data_out]
set_load -pin_load 0.5 [get_ports frame_error]
set_case_analysis 1 [get_ports test_mode]
set_case_analysis 0 [get_ports SE]
create_clock [get_ports uart_clk]  -name UART_CLK  -period 271  -waveform {0 135}
set_clock_latency 0  [get_clocks UART_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks UART_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks UART_CLK]
set_clock_transition -min -fall 0.1 [get_clocks UART_CLK]
set_clock_transition -max -fall 0.1 [get_clocks UART_CLK]
set_clock_transition -min -rise 0.1 [get_clocks UART_CLK]
set_clock_transition -max -rise 0.1 [get_clocks UART_CLK]
create_clock [get_ports scan_clk]  -name SCAN_CLK  -period 100  -waveform {50 100}
set_clock_latency 0  [get_clocks SCAN_CLK]
set_clock_uncertainty -setup 0.2  [get_clocks SCAN_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks SCAN_CLK]
set_clock_transition -min -fall 0.1 [get_clocks SCAN_CLK]
set_clock_transition -max -fall 0.1 [get_clocks SCAN_CLK]
set_clock_transition -min -rise 0.1 [get_clocks SCAN_CLK]
set_clock_transition -max -rise 0.1 [get_clocks SCAN_CLK]
set_input_delay -clock UART_CLK  54.2  [get_ports ser_data_in]
set_output_delay -clock UART_CLK  54.2  [get_ports par_error]
set_output_delay -clock UART_CLK  54.2  [get_ports frame_error]
