`include "../uart/uart/uart.v"
`include "../register_file/register_file.v"
`include "../clock_divider/clock_divider.v"
`include "../reset_synchronizer/reset_synchronizer.v"
`include "../data_synchronizer/data_synchronizer.v"
`include "../alu/alu.v"
`include "../system_controller/system_controller.v"
`include "../clock_gating_cell/clock_gating_cell.v"

module system_top #(parameter DATA_WIDTH = 8,
	parameter REGISTER_FILE_DEPTH = 16,
	SYNCHRONIZER_STAGE_COUNT = 2) (
	input ref_clk,    // Clock
	input uart_clk,
	input reset_n,  // Asynchronous reset active low
	input ser_data_in,

	output ser_data_out,
	output frame_error,
	output par_error
);
    localparam BUS_SYNCHRONIZER_BUS_WIDTH = 1;

	//reset_synchronizer
	wire ref_reset_n_synchronized;
	wire uart_reset_n_synchronized;

	//system_controller
    // alu output signals
    wire alu_result_valid;
    wire [2 * DATA_WIDTH - 1:0] alu_result;
    // Register file output signals
    wire register_file_read_data_valid;
    wire [DATA_WIDTH - 1:0] register_file_read_data;
    // uart tranmsitter busy signal after synchronization
    wire uart_transmitter_busy;
    wire uart_transmitter_q_pulse_generator;
    wire uart_transmitter_busy_sync;
    wire uart_transmitter_q_pulse_generator_sync;

    wire [DATA_WIDTH - 1:0] uart_parity_config;
    wire [DATA_WIDTH - 1:0] uart_prescale_config;

    // uart receiver message after synchronization
    wire receiver_parallel_data_valid;
    wire [DATA_WIDTH - 1:0] receiver_parallel_data;
    wire receiver_parallel_data_valid_sync;
    wire [DATA_WIDTH - 1:0] receiver_parallel_data_sync;
    wire receiver_q_pulse_generator;

    // alu control signals
    wire [3:0] alu_function;
    wire alu_clk;
    wire alu_en;
    wire alu_clk_en;
    wire [DATA_WIDTH - 1:0] alu_operand_a;
    wire [DATA_WIDTH - 1:0] alu_operand_b;

    // uart transmitter data (the data that it will transmit)
    wire transmitter_parallel_data_valid;
    wire [DATA_WIDTH - 1:0] transmitter_parallel_data;
    wire transmitter_parallel_data_valid_sync;
    wire [DATA_WIDTH - 1:0] transmitter_parallel_data_sync;

    // Register file control signals
    wire [$clog2(REGISTER_FILE_DEPTH) - 1:0] register_file_address;
    wire register_file_write_en;
    wire [DATA_WIDTH - 1:0] register_file_write_data;
    wire register_file_read_en;

    //clk divider 
    wire uart_transmitter_clk;
    wire clock_divider_en=1;
    //clk domain 1

	reset_synchronizer #(.STAGE_COUNT(SYNCHRONIZER_STAGE_COUNT)) 
	reset_synchronizer_inst_0
	( 
		.clk(ref_clk),
		.reset_n(reset_n),
		.reset_synchronized(ref_reset_n_synchronized)
	);

	system_controller #( .DATA_WIDTH(DATA_WIDTH), .REGISTER_FILE_DEPTH(REGISTER_FILE_DEPTH) )
	system_controller_inst
	(
		.clk(ref_clk),
		.reset_n(ref_reset_n_synchronized),

		.alu_result_valid(alu_result_valid),
		.alu_result(alu_result),
		.register_file_read_data_valid(register_file_read_data_valid),
		.register_file_read_data(register_file_read_data),
		.transmitter_q_pulse_generator(uart_transmitter_q_pulse_generator_sync),
		.transmitter_busy_sync(uart_transmitter_busy_sync),
		.receiver_parallel_data_valid_sync(receiver_parallel_data_valid_sync),
		.receiver_parallel_data_sync(receiver_parallel_data_sync),

		.alu_function(alu_function),
		.alu_en(alu_en),
		.alu_clk_en(alu_clk_en),
		.transmitter_parallel_data_valid(transmitter_parallel_data_valid),
		.transmitter_parallel_data(transmitter_parallel_data),
		.register_file_write_en(register_file_write_en),
		.register_file_write_data(register_file_write_data),
		.register_file_address(register_file_address),
		.register_file_read_en(register_file_read_en)
	);

	clock_gating_cell clock_gating_cell_inst (
		.clk(ref_clk),
		.clk_en(alu_clk_en),
		.gated_clk(alu_clk)
	);

	alu #(.DATA_WIDTH(DATA_WIDTH))
	alu_inst (
		.clk(alu_clk),
		.reset_n(ref_reset_n_synchronized),
		.A(alu_operand_a),
		.B(alu_operand_b),
		.alu_function(alu_function),
		.enable(alu_en),
		
		.alu_result_valid(alu_result_valid),
		.alu_result(alu_result)
	);

	register_file #(.DATA_WIDTH(DATA_WIDTH), .REGISTER_FILE_DEPTH(REGISTER_FILE_DEPTH)) 
	register_file_inst (
		.clk(ref_clk),
		.reset_n(ref_reset_n_synchronized),
		.address(register_file_address),
		.write_en       (register_file_write_en),
		.write_data     (register_file_write_data),
		.read_en        (register_file_read_en),

		.read_data_valid(register_file_read_data_valid),
		.read_data      (register_file_read_data),
		.register0(alu_operand_a),
		.register1(alu_operand_b),
		.register2(uart_parity_config),
		.register3(uart_prescale_config)
	);

	bus_synchronizer #(.STAGE_COUNT(SYNCHRONIZER_STAGE_COUNT), .BUS_WIDTH(BUS_SYNCHRONIZER_BUS_WIDTH))
	bus_synchronizer_inst_0
	(
		.clk(ref_clk),
		.reset_n(ref_reset_n_synchronized),
		.asynchronous_data(uart_transmitter_busy),
		.synchronous_data(uart_transmitter_busy_sync)
	);

	bus_synchronizer #(.STAGE_COUNT(SYNCHRONIZER_STAGE_COUNT), .BUS_WIDTH(BUS_SYNCHRONIZER_BUS_WIDTH))
	bus_synchronizer_inst_1
	(
		.clk(ref_clk),
		.reset_n(ref_reset_n_synchronized),
		.asynchronous_data(uart_transmitter_q_pulse_generator),
		.synchronous_data(uart_transmitter_q_pulse_generator_sync)
	);

	data_synchronizer #(.STAGE_COUNT(SYNCHRONIZER_STAGE_COUNT),
		.BUS_WIDTH(DATA_WIDTH))
	data_synchronizer_inst_0
	(
		.clk(ref_clk),
		.reset_n(ref_reset_n_synchronized),
		.asynchronous_data_valid(receiver_parallel_data_valid),
		.asynchronous_data(receiver_parallel_data),

		.synchronous_data_valid(receiver_parallel_data_valid_sync),
		.synchronous_data(receiver_parallel_data_sync),
		.Q_pulse_generator(receiver_q_pulse_generator)

	);
	//clk domain 2
	reset_synchronizer #(.STAGE_COUNT(SYNCHRONIZER_STAGE_COUNT)) 
	reset_synchronizer_inst_1
	( 
		.clk(uart_clk),
		.reset_n(reset_n),
		.reset_synchronized(uart_reset_n_synchronized)
	);

	uart #(.DATA_WIDTH(DATA_WIDTH)) 
	uart_inst
	(
		.transmitter_clk(uart_transmitter_clk),
		.receiver_clk(uart_clk),
		.reset_n(uart_reset_n_synchronized),
		.par_en(uart_parity_config[0]),
		.par_type(uart_parity_config[1]),
		.prescale(uart_prescale_config[5:0]),
		.transmitter_parallel_data_valid(transmitter_parallel_data_valid_sync),
		.transmitter_parallel_data(transmitter_parallel_data_sync),
		.receiver_ser_data(ser_data_in),

		.transmitter_ser_data(ser_data_out),
		.transmitter_busy(uart_transmitter_busy),
		.receiver_parallel_data_valid(receiver_parallel_data_valid),
		.receiver_parallel_data(receiver_parallel_data),
		.receiver_par_error(par_error),
		.receiver_frame_error(frame_error)	
	);

	clock_divider clock_divider_inst
	(
		.ref_clk(uart_clk),
		.reset_n(uart_reset_n_synchronized),
		.clk_divider_en(clock_divider_en),
		.division_ratio(uart_prescale_config[DATA_WIDTH-3:0]),
		
		.output_clk(uart_transmitter_clk)
	);

	data_synchronizer #(.STAGE_COUNT(SYNCHRONIZER_STAGE_COUNT),
		.BUS_WIDTH(DATA_WIDTH))
	data_synchronizer_inst_1
	(
		.clk(uart_transmitter_clk),
		.reset_n(uart_reset_n_synchronized),
		.asynchronous_data_valid(transmitter_parallel_data_valid),
		.asynchronous_data(transmitter_parallel_data),

		.synchronous_data_valid(transmitter_parallel_data_valid_sync),
		.synchronous_data(transmitter_parallel_data_sync),
		.Q_pulse_generator(uart_transmitter_q_pulse_generator)

	);
endmodule