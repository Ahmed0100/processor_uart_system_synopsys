`include "../uart_receiver/uart_receiver.v"
`include "../uart_transmitter/uart_transmitter.v"

module uart #(parameter DATA_WIDTH=8)(

	input transmitter_clk,
	input receiver_clk,
	input reset_n,
	input par_en,
	input par_type,
	input [5:0] prescale,
	input transmitter_parallel_data_valid,
	input [DATA_WIDTH-1:0] transmitter_parallel_data,
	input receiver_ser_data,

	output transmitter_ser_data,
	output transmitter_busy,
	output receiver_parallel_data_valid,
	output [DATA_WIDTH-1:0] receiver_parallel_data,
	output receiver_par_error,
	output receiver_frame_error
);

    uart_transmitter #(
        .DATA_WIDTH(DATA_WIDTH)
    )
    uart_transmitter_inst(
        .clk(transmitter_clk),
        .reset_n(reset_n),
        .par_type(par_type),
        .par_en(par_en),
        .data_valid(transmitter_parallel_data_valid),
        .parallel_data(transmitter_parallel_data),

        .ser_data_out(transmitter_ser_data),
        .busy(transmitter_busy)

    );

    uart_receiver #(
        .DATA_WIDTH(DATA_WIDTH)
    )
    uart_receiver_inst(
        .clk(receiver_clk),
        .reset_n(reset_n),
        .par_type(par_type),
        .par_en(par_en),
        .prescale(prescale),
        .ser_data_in(receiver_ser_data),

        .data_valid(receiver_parallel_data_valid),
        .parallel_data(receiver_parallel_data),
        .par_error(receiver_par_error),
        .frame_error(receiver_frame_error)
    );

endmodule