`include "../../../rtl/uart/uart_receiver/uart_receiver_fsm.v"
`include "../../../rtl/uart/uart_receiver/deserializer.v"
`include "../../../rtl/uart/uart_receiver/data_sampler.v"
`include "../../../rtl/uart/uart_receiver/edge_counter.v"
`include "../../../rtl/uart/uart_receiver/start_bit_checker.v"
`include "../../../rtl/uart/uart_receiver/stop_bit_checker.v"
`include "../../../rtl/uart/uart_receiver/parity_bit_checker.v"

module uart_receiver #(parameter DATA_WIDTH=8)(
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input par_type,
	input par_en,
	input [5:0] prescale,
	input ser_data_in,

	output data_valid,
	output [DATA_WIDTH-1:0] parallel_data,
	output par_error,
	output frame_error
);
	wire start_bit_error,stop_bit_error;
	wire [4:0] edge_count;
	wire start_bit_check_en,stop_bit_check_en,par_bit_check_en;
	wire edge_counter_data_sampler_en, deserializer_en;
	wire [$clog2(DATA_WIDTH)-1:0] data_index;
	wire sampled_bit;
	
	assign frame_error = stop_bit_error | start_bit_error;

    uart_receiver_fsm #(
        .DATA_WIDTH(DATA_WIDTH)
    )
    uart_receiver_fsm_inst (
        .clk(clk),
        .reset_n(reset_n),
        .par_en(par_en),
        .ser_data_in(ser_data_in),
        .prescale(prescale),
        .start_bit_error(start_bit_error),
        .par_bit_error(par_error),
        .stop_bit_error(stop_bit_error),
        .edge_count(edge_count),
        .edge_count_done(edge_count_done),

        .start_bit_check_en(start_bit_check_en),
        .par_bit_check_en(par_bit_check_en),
        .stop_bit_check_en(stop_bit_check_en),
        .edge_counter_data_sampler_en(edge_counter_data_sampler_en),
        .deserializer_en(deserializer_en),
        .data_index(data_index),
        .data_valid(data_valid)
    );

	deserializer #(.DATA_WIDTH(DATA_WIDTH)) deserializer_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.enable(deserializer_en),
		.data_index(data_index),
		.sampled_bit(sampled_bit),
		.parallel_data(parallel_data)
	);
	edge_counter edge_counter_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.enable(edge_counter_data_sampler_en),
		.prescale(prescale),
		.edge_count     (edge_count),
		.edge_count_done(edge_count_done)
	);

	data_sampler data_sampler_inst 
	(
		.clk(clk),
		.reset_n(reset_n),
		.ser_data_in(ser_data_in),
		.prescale(prescale[5:1]),
		.enable(edge_counter_data_sampler_en),
		.edge_count(edge_count),
		.sampled_bit(sampled_bit)
	);

	parity_bit_checker #(.DATA_WIDTH(DATA_WIDTH)) parity_bit_checker_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.enable(par_bit_check_en),
		.par_type(par_type),
		.sampled_bit(sampled_bit),
		.parallel_data(parallel_data),
		.par_bit_error(par_error)
	);

	start_bit_checker start_bit_checker_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.enable(start_bit_check_en),
		.sampled_bit(sampled_bit),
		.start_bit_error(start_bit_error)
	);
	stop_bit_checker stop_bit_checker_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.enable(stop_bit_check_en),
		.sampled_bit(sampled_bit),
		.stop_bit_error(stop_bit_error)
	);

endmodule