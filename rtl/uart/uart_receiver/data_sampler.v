module data_sampler (
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	
	input ser_data_in,
	input [4:0] prescale,
	input enable,
	input [4:0] edge_count,

	output reg sampled_bit
);
	wire [4:0] sampling_edge_number;
	reg [2:0] samples;
	reg sample_enable;

	assign sampling_edge_number = prescale - 2;

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			samples <= 0;
			sample_enable <= 0;
		end else if(enable) begin
			case(edge_count)
				sampling_edge_number:
				begin
					samples[0] <= ser_data_in;
					sample_enable <= 0;
				end
				sampling_edge_number+1:
				begin
					samples[1] <= ser_data_in;
					sample_enable <= 0;
				end
				sampling_edge_number+2:
				begin
					samples[2] <= ser_data_in;
					sample_enable <= 0;
				end
				sampling_edge_number+3:
				begin
					sample_enable <= 1;
				end
				default: 
					sample_enable <= 0;
			endcase
		end
	end

	always @(*) begin 
		if(sample_enable)
		begin
			case(samples)
				3'b000:
					sampled_bit = 0;
				3'b001: 
					sampled_bit = 0;
				3'b010: 
					sampled_bit = 0;
				3'b011: 
					sampled_bit = 1;
				3'b100: 
					sampled_bit = 0;
				3'b101: 
					sampled_bit = 1;
				3'b110: 
					sampled_bit = 1;
				3'b111: 
					sampled_bit = 1;
			endcase // samplesse
		end
		else
			sampled_bit = 0;
	end
endmodule