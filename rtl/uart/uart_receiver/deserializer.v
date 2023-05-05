module deserializer #(parameter DATA_WIDTH = 8) (
	input clk,    // Clock
	input enable,
	input reset_n,  // Asynchronous reset active low
	input [$clog2(DATA_WIDTH)-1:0] data_index,
	input sampled_bit,

	output reg [DATA_WIDTH-1:0] parallel_data
);

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			parallel_data <= 0;
		end else if(enable) begin
			parallel_data[data_index] <= sampled_bit;
		end
	end

endmodule