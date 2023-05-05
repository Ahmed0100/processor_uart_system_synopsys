module parity_bit_checker #(parameter DATA_WIDTH = 8) (
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input enable,
	input par_type,
	input sampled_bit,
	input [DATA_WIDTH-1:0] parallel_data,

	output reg par_bit_error
);

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			par_bit_error <= 0;
		end 
		else if(enable) 
		begin
			case(par_type)
				1'b0: 
					par_bit_error <= ^parallel_data ^sampled_bit;
				1'b1:
					par_bit_error <= ~(^parallel_data) ^ sampled_bit;
			endcase // par_type
		end
		else
			par_bit_error <= 0;
	end
endmodule