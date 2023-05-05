/*
* ----------------------------- Ports' Definition -----------------------------
* ----------------------------- Inputs -----------------------------
* clk:           Generated clock produced from the clock divider whose source clock is
*                UART clock.
* reset_n:         Global active low asynchronous reset_n after synchronization.
* par_type:   A signal to indicate the parity type (1 for odd, 0 for even).
* par_en: A signal to enable the transmission of the parity bit in the frame.
* parallel_data: The data to be transmitted by the UART transmitter.
* 
* ----------------------------- Outputs -----------------------------
* par_bit:    The parity bit of the parallel data to be transmitted.
*/

module parity_calculator # (
    parameter DATA_WIDTH = 8
)
(
    input clk,
    input reset_n,
    input par_type,
    input par_en,
    input data_valid,
    input [DATA_WIDTH - 1:0] parallel_data,
    
    output reg par_bit
);


    always @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            par_bit <= 1'b0;
        end
        else if (par_en && data_valid) begin
            if (par_type) begin
                // Odd parity
                par_bit <= ~^parallel_data;
            end
            else begin
                // Even parity
                par_bit <= ^parallel_data;
            end
        end
    end

endmodule