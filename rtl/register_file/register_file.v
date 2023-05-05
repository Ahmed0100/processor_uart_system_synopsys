module register_file #(parameter DATA_WIDTH = 8, REGISTER_FILE_DEPTH = 16)
(
	input clk,
	input reset_n,
	input [$clog2(REGISTER_FILE_DEPTH)-1:0] address,
	input write_en,
	input [DATA_WIDTH-1:0] write_data,
	input read_en,
	
	output reg read_data_valid,
	output reg [DATA_WIDTH-1:0] read_data,
    output [DATA_WIDTH - 1:0] register0,
    output [DATA_WIDTH - 1:0] register1,
    output [DATA_WIDTH - 1:0] register2,
    output [DATA_WIDTH - 1:0] register3
);

	reg [DATA_WIDTH-1:0] memory [0:REGISTER_FILE_DEPTH-1];
	integer i;


	always @(posedge clk or negedge reset_n) 
	begin
		if(~reset_n) 
		begin
			read_data <= 0;
			read_data_valid <= 0;
			for(i = 0; i< REGISTER_FILE_DEPTH;i = i + 1)
			begin
				if(i == 2)
					memory[i] <= 'b000000_0_1;
				else if(i == 3)
					memory[i] <= 'b00_001000;
				else
					memory[i] <= 0; 		
			end
		end 
		else if(write_en && !read_en)
		begin
			memory[address] <= write_data;
			read_data_valid <= 0;
		end
		else if(read_en && ~write_en)
		begin
			read_data_valid <= 1;
			read_data <= memory[address];
		end
		else
			read_data_valid <= 0;
	end

	assign register0 = memory[0];
	assign register1 = memory[1];
	assign register2 = memory[2];
	assign register3 = memory[3];

endmodule