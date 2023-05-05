module stop_bit_checker (
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input enable,
	input sampled_bit,
	output reg stop_bit_error
);

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			stop_bit_error <= 0;
		end 
		else if(enable) 
		begin
			stop_bit_error <= ~sampled_bit;
		end
		else 
			stop_bit_error <= 0;
	end
endmodule