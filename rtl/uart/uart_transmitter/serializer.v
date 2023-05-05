module serializer #(parameter DATA_WIDTH = 8)
(
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input [DATA_WIDTH-1:0] parallel_data,
	input ser_en,
	input [$clog2(DATA_WIDTH)-1:0] ser_data_index,
	output reg ser_data
);

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			ser_data <= 0;
		end else if(ser_en) begin
			ser_data <= parallel_data[ser_data_index];
		end
	end
endmodule