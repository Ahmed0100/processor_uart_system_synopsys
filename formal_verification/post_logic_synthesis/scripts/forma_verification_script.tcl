lappend search_path "../../lib/std_cells"
lappend search_path "../../rtl/system_top" "../../rtl/uart/uart_transmitter" \
                    "../../rtl/uart/uart_receiver" "../../rtl/uart/uart" \
                    "../../rtl/ALU" "../../rtl/bus_synchronizer" \
                    "../../rtl/clock_divider" "../../rtl/clock_gating_cell" \
                    "../../rtl/data_synchronizer" "../../rtl/register_file" \
                    "../../rtl/reset_synchronizer" "../../rtl/system_controller"

lappend search_path "../../../logic_synthesis/logic_synthesis_output"
lappend search_path "../../../logic_synthesis/netlist"

cd "../../../rtl/clock_gating_cell"
exec tclsh place_ICG_cell.tcl -p
cd "../../formal_verification/post_logic_synthesis/scripts"

set SSLIB "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"
set TTLIB "scmetro_tsmc_cl013g_rvt_tt_1p2v_25c"
set FFLIB "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c"

set synopsys_auto_setup true

#formal verification setup file
set_svf "system_top.svf"


# ref design
read_db -container reference [list $SSLIB]

# read ref design files
read_verilog -container reference "system_top.v"

#set ref design
set_reference_design "system_top"

#set top module for ref design
set_top "system_top"

# impl design
read_db -container implementation [list $SSLIB]
#read impl design file
read_verilog -container implementation "system_top_netlist.v"
#set impl design
read_implementation_design "system_top"

set_top "system_top"

#match compare points
match

set successful [verify]

if {!successful} {
    diagnose
    analyze_points -failing
}

report_passing_points > "../formal_verification_output/reports/passing_points.rpt"
report_failing_points > "../formal_verification_output/reports/failing_points.rpt"
report_aborted_points > "../formal_verification_output/reports/aborted_points.rpt"

report_unverified_points > "../formal_verification_output/reports/unverified_points.rpt"

cd "../../../rtl/clock_gating_cell"
exec tclsh place_ICG_cell.tcl -r
cd "../../formal_verification/post_logic_synthesis/scripts"

start_gui
exit
