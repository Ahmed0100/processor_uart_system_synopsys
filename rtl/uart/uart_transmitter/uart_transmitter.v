`include "uart_transmitter_fsm.v"
`include "serializer.v"
`include "parity_calculator.v"
`include "output_mux.v"

module uart_transmitter #(parameter DATA_WIDTH = 8) (
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input par_type,
	input par_en,
	input data_valid,
	input [DATA_WIDTH-1:0] parallel_data,

	output ser_data_out,
	output busy
);

	localparam START_BIT_SELECT = 2'b00;
	localparam STOP_BIT_SELECT = 2'b01;
	localparam SER_DATA_SELECT = 2'b10;
	localparam PAR_BIT_SELECT = 2'b11;

	wire ser_en;
	wire [$clog2(DATA_WIDTH)-1:0] ser_data_index;
	wire [1:0] bit_sel;
	wire par_bit;
	wire serial_data;

	uart_transmitter_fsm #(.DATA_WIDTH(DATA_WIDTH),
		.START_BIT_SELECT(START_BIT_SELECT),
		.STOP_BIT_SELECT(STOP_BIT_SELECT),
		.SER_DATA_SELECT(SER_DATA_SELECT),
		.PAR_BIT_SELECT(PAR_BIT_SELECT) ) uart_transmitter_fsm_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.data_valid(data_valid),
		.par_en(par_en),

		.ser_en(ser_en),
		.bit_sel(bit_sel),
		.ser_data_index(ser_data_index),
		.busy(busy)
	);

	serializer #(.DATA_WIDTH(DATA_WIDTH)) serializer_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.parallel_data(parallel_data),
		.ser_en(ser_en),
		.ser_data(serial_data),
		.ser_data_index(ser_data_index)
	);
	parity_calculator #(.DATA_WIDTH(DATA_WIDTH)) parity_calculator_inst
	(
		.clk(clk),
		.reset_n(reset_n),
		.par_type(par_type),
		.par_en(par_en),
		.data_valid   (data_valid),
		.parallel_data(parallel_data),
		.par_bit(par_bit)
	);

	output_mux #(
		.START_BIT_SELECT(START_BIT_SELECT),
		.STOP_BIT_SELECT(STOP_BIT_SELECT),
		.SER_DATA_SELECT(SER_DATA_SELECT),
		.PAR_BIT_SELECT(PAR_BIT_SELECT)) output_mux_inst
	(
		.bit_sel(bit_sel),
		.ser_data(serial_data),
		.par_bit(par_bit),
		.mux_out(ser_data_out)
	);

endmodule

