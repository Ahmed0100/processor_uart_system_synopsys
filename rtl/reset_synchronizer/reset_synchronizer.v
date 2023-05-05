module reset_synchronizer #( parameter STAGE_COUNT = 2)
(
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low

	output reset_synchronized
);
	reg [STAGE_COUNT-1:0] Q;
	integer i;
	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			Q <= 0;
		end else begin
			Q[0] <= 1;
			for(i = 1; i< STAGE_COUNT; i = i+1)
				Q[i] <= Q[i-1];

		end
	end
	assign reset_synchronized = Q[STAGE_COUNT-1];

endmodule