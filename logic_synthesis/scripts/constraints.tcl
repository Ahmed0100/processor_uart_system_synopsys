# ------------------------ Clock Domain '1' (REFERENCE_CLK) --------------------
set ALU_CLK_NAME ALU_CLK

set REF_CLK_NAME REF_CLK
set REF_CLK_PER 25
set REF_CLK_SETUP_SKEW 0.2
set REF_CLK_HOLD_SKEW 0.1
set REF_CLK_RISE 0.1
set REF_CLK_FALL 0.1
set REF_CLK_LATENCY 0

create_clock -name $REF_CLK_NAME -period $REF_CLK_PER \
-waveform "0 [expr $REF_CLK_PER/2]" [get_ports ref_clk]

set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_clocks $REF_CLK_NAME]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW [get_clocks $REF_CLK_NAME]
set_clock_transition -rise $REF_CLK_RISE [get_clocks $REF_CLK_NAME]
set_clock_transition -fall $REF_CLK_FALL [get_clocks $REF_CLK_NAME]
set_clock_latency $REF_CLK_LATENCY [get_clocks $REF_CLK_NAME]

create_generated_clock -master_clock $REF_CLK_NAME \
-source [get_ports ref_clk] -name $ALU_CLK_NAME -divide_by 1 [get_ports clock_gating_cell_inst/gated_clk]

set_clock_uncertainty -setup $REF_CLK_SETUP_SKEW [get_clocks $ALU_CLK_NAME]
set_clock_uncertainty -hold $REF_CLK_HOLD_SKEW [get_clocks $ALU_CLK_NAME]
set_clock_transition -rise $REF_CLK_RISE [get_clocks $ALU_CLK_NAME]
set_clock_transition -fall $REF_CLK_FALL [get_clocks $ALU_CLK_NAME]
set_clock_latency $REF_CLK_LATENCY [get_clocks $ALU_CLK_NAME]

# ------------------------ Clock Domain '2' (UART_CLK) --------------------
set UART_TX_CLK_NAME UART_TX_CLK
set UART_CLK_PRESCALE 8
set UART_CLK_NAME UART_CLK
set UART_CLK_PER 271
set UART_CLK_SETUP_SKEW 0.2
set UART_CLK_HOLD_SKEW 0.1
set UART_CLK_RISE 0.1
set UART_CLK_FALL 0.1
set UART_CLK_LATENCY 0

create_clock -name $UART_CLK_NAME -period $UART_CLK_PER \
-waveform "0 [expr $UART_CLK_PER/2]" [get_ports uart_clk]

set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks $UART_CLK_NAME]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW [get_clocks $UART_CLK_NAME]
set_clock_transition -rise $UART_CLK_RISE [get_clocks $UART_CLK_NAME]
set_clock_transition -fall $UART_CLK_FALL [get_clocks $UART_CLK_NAME]
set_clock_latency $UART_CLK_LATENCY [get_clocks $UART_CLK_NAME]

create_generated_clock -master_clock $UART_CLK_NAME \
-source [get_ports uart_clk] -name $UART_TX_CLK_NAME \
-divide_by $UART_CLK_PRESCALE [get_ports clock_divider_inst/output_clk]

set_clock_uncertainty -setup $UART_CLK_SETUP_SKEW [get_clocks $UART_TX_CLK_NAME]
set_clock_uncertainty -hold $UART_CLK_HOLD_SKEW [get_clocks $UART_TX_CLK_NAME]
set_clock_transition -rise $UART_CLK_RISE [get_clocks $UART_TX_CLK_NAME]
set_clock_transition -fall $UART_CLK_FALL [get_clocks $UART_TX_CLK_NAME]
set_clock_latency $UART_CLK_LATENCY [get_clocks $UART_TX_CLK_NAME]

set uart_clk_input_delay [expr 0.2 * $UART_CLK_PER]

set_input_delay $uart_clk_input_delay -clock $UART_CLK_NAME [get_ports ser_data_in]

set uart_tx_clk_output_delay [expr 0.2 * $UART_CLK_PER]
set_output_delay $uart_tx_clk_output_delay -clock $UART_TX_CLK_NAME [get_ports ser_data_out]

set uart_clk_output_delay [expr 0.2 * $UART_CLK_PER]
set_output_delay $uart_clk_output_delay -clock $UART_CLK_NAME [get_port par_error]
set_output_delay $uart_clk_output_delay -clock $UART_CLK_NAME [get_port frame_error]

# define asynchronous groups
set_clock_groups -asynchronous \
-group [get_clocks "$REF_CLK_NAME $ALU_CLK_NAME"] \
-group [get_clocks "$UART_CLK_NAME $UART_TX_CLK_NAME"]


set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port ser_data_in]

set_load 0.5 [get_ports ser_data_out]
set_load 0.5 [get_ports par_error]
set_load 0.5 [get_ports frame_error]

set_dont_touch_network {ref_clk clock_gating_cell_inst/gated_clk uart_clk clock_divider_inst/output_clk}

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c" -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c" -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

set_wire_load_model -name tsmc13_wl30 -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c

set_max_area 0

set_fix_multiple_port_nets -all -buffer_constants -feedthroughs