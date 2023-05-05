`include "uart_receiver_controller.v"
`include "uart_transmitter_controller.v"

module system_controller #(
    parameter DATA_WIDTH = 8,
    parameter REGISTER_FILE_DEPTH = 16
)
(
    input clk,
    input reset_n,

    // ALU output signals
    input alu_result_valid,
    input [2 * DATA_WIDTH - 1:0] alu_result,

    // Register file output signals
    input register_file_read_data_valid,
    input [DATA_WIDTH - 1:0] register_file_read_data,
    
    // UART tranmsitter busy signal after synchronization
    input transmitter_busy_sync,
    input transmitter_q_pulse_generator,

    // UART receiver message after synchronization
    input receiver_parallel_data_valid_sync,
    input [DATA_WIDTH - 1:0] receiver_parallel_data_sync,

    // ALU control signals
    output [3:0] alu_function,
    output alu_en,
    output alu_clk_en,

    // UART transmitter data (the data that it will transmit)
    output transmitter_parallel_data_valid,
    output [DATA_WIDTH - 1:0] transmitter_parallel_data,

    // Register file control signals
    output [$clog2(REGISTER_FILE_DEPTH) - 1:0] register_file_address,
    output register_file_write_en,
    output [DATA_WIDTH - 1:0] register_file_write_data,
    output register_file_read_en
);

    wire receiver_controller_en;

    // UART transmitter controller instantiation
    uart_transmitter_controller #(
        .DATA_WIDTH(DATA_WIDTH)
    ) uart_transmitter_controller_inst(
        .clk(clk),
        .reset_n(reset_n),
        .alu_result_valid(alu_result_valid),
        .alu_result(alu_result),
        .read_data_valid(register_file_read_data_valid),
        .read_data(register_file_read_data),
        .transmitter_busy_sync(transmitter_busy_sync),

        .transmitter_q_pulse_generator(transmitter_q_pulse_generator),
        .transmitter_parallel_data_valid(transmitter_parallel_data_valid),
        .transmitter_parallel_data(transmitter_parallel_data),
        .uart_receiver_controller_en(receiver_controller_en)
    );

    // UART receiver controller instantiation
    uart_receiver_controller #(
        .DATA_WIDTH(DATA_WIDTH),
        .REGISTER_FILE_DEPTH(REGISTER_FILE_DEPTH)
    ) uart_receiver_controller_inst(
        .clk(clk),
        .reset_n(reset_n),
        .enable(receiver_controller_en),
        .parallel_data_valid_sync(receiver_parallel_data_valid_sync),
        .parallel_data_sync(receiver_parallel_data_sync),

        .alu_function(alu_function),
        .alu_en(alu_en),
        .alu_clk_en(alu_clk_en),
        .address(register_file_address),
        .write_en(register_file_write_en),
        .write_data(register_file_write_data),
        .read_en(register_file_read_en)
    );

endmodule