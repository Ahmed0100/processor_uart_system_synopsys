module edge_counter (
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input [5:0] prescale,
	input enable,

	output reg [4:0] edge_count,
	output reg edge_count_done
);

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			edge_count <= 0;
		end else if(enable & ~edge_count_done) begin
			edge_count <= edge_count + 1;
		end
		else 
			edge_count <= 0;
	end

	always @(*) begin
		case(prescale)
			6'b10_0000: begin
				if(edge_count == 5'b1_1111)
					edge_count_done = 1;
				else
					edge_count_done = 0;
			end
			6'b01_0000:
			begin
				if(edge_count[3:0] == 4'b1111)
					edge_count_done = 1;
				else
					edge_count_done = 0;
			end

			6'b00_1000: 
			begin
				if(edge_count[2:0]==3'b111)
					edge_count_done = 1;
				else
					edge_count_done = 0;
			end
			default:
				edge_count_done = 0;
		endcase // prescale
	end
endmodule