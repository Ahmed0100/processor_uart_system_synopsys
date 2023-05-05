module start_bit_checker (
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input enable,
	input sampled_bit,
	output reg start_bit_error
);

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			start_bit_error <= 0;
		end 
		else if(enable) 
		begin
			start_bit_error <= sampled_bit;
		end
		else 
			start_bit_error <= 0;
	end
endmodule