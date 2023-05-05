module uart_receiver_controller #(parameter DATA_WIDTH = 8, REGISTER_FILE_DEPTH = 16) (
	input clk,    // Clock
	input enable, // Clock Enable
	input reset_n,  // Asynchronous reset active low
	
	input parallel_data_valid_sync,
	input [DATA_WIDTH-1:0] parallel_data_sync,

	output reg [3:0] alu_function,
	output reg alu_en,
	output reg alu_clk_en,

	output reg [$clog2(REGISTER_FILE_DEPTH)-1:0] address,
	output reg write_en,
	output reg read_en,
	output reg [DATA_WIDTH-1:0] write_data
);

	reg [$clog2(REGISTER_FILE_DEPTH)-1:0] Q_write_address_register;
	reg enable_write_address_register;
	reg [1:0] counter;

	localparam [DATA_WIDTH-1:0] REGISTER_FILE_WRITE_COMMAND = 'hAA;
	localparam [DATA_WIDTH-1:0] REGISTER_FILE_READ_COMMAND = 'hBB;
	localparam [DATA_WIDTH-1:0] ALU_OPERATION_WITH_OP_COMMAND = 'hCC;
	localparam [DATA_WIDTH-1:0] ALU_OPERATION_WITHOUT_OP_COMMAND = 'hDD;

	localparam [$clog2(REGISTER_FILE_DEPTH)-1:0] OPERAND_A_ADDRESS = 'b0;
	localparam [$clog2(REGISTER_FILE_DEPTH)-1:0] OPERAND_B_ADDRESS = 'b1;

	reg [2:0] current_state,next_state;

	localparam [2:0] IDLE =3'b000,
	WAIT_FOR_WRITE_ADDRESS = 3'b001,
	WAIT_FOR_WRITE_DATA = 3'b010,
	WAIT_FOR_READ_ADDRESS = 3'b011,
	WAIT_FOR_OPERAND_A_DATA = 3'b100,
	WAIT_FOR_OPERAND_B_DATA = 3'b101,
	WAIT_FOR_ALU_FUNCTION = 3'b110,
	EVALUATE_RESULTS = 3'b111;

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			current_state <= IDLE;
		end else begin
			current_state <= next_state;
		end
	end

	always @*
	begin
		next_state = current_state;
		case(current_state)
			IDLE: 
			begin
				if(enable && parallel_data_valid_sync)
					case (parallel_data_sync)
						REGISTER_FILE_WRITE_COMMAND: begin
							next_state = WAIT_FOR_WRITE_ADDRESS;
						end
						REGISTER_FILE_READ_COMMAND: begin
							next_state = WAIT_FOR_READ_ADDRESS;
						end
						ALU_OPERATION_WITH_OP_COMMAND: begin
							next_state = WAIT_FOR_OPERAND_A_DATA;
						end
						ALU_OPERATION_WITHOUT_OP_COMMAND: begin
							next_state = WAIT_FOR_ALU_FUNCTION;
						end
						default :
							next_state = IDLE;
					endcase
			end
			WAIT_FOR_WRITE_ADDRESS: 
			begin
				if(parallel_data_valid_sync) begin
					next_state = WAIT_FOR_WRITE_DATA;
				end
			end
			WAIT_FOR_WRITE_DATA: 
			begin
				if(parallel_data_valid_sync) begin
					next_state = IDLE;
				end
			end
			WAIT_FOR_READ_ADDRESS: 
			begin
				if(parallel_data_valid_sync)
					next_state = IDLE;
			end
			WAIT_FOR_OPERAND_A_DATA: 
			begin
				if(parallel_data_valid_sync)
					next_state = WAIT_FOR_OPERAND_B_DATA;
			end
			WAIT_FOR_OPERAND_B_DATA:
			begin
				if(parallel_data_valid_sync)
					next_state = WAIT_FOR_ALU_FUNCTION;
			end
			WAIT_FOR_ALU_FUNCTION: 
			begin
				if(parallel_data_valid_sync)
					next_state = EVALUATE_RESULTS;
			end
			EVALUATE_RESULTS: 
				next_state = IDLE;
		endcase
	end
	always @(posedge clk or negedge reset_n)
	begin
		if(~reset_n)
			Q_write_address_register <= 0;
		else if(enable_write_address_register)
			Q_write_address_register <= parallel_data_sync[$clog2(REGISTER_FILE_DEPTH)-1:0];
	end
	always @(posedge clk or negedge  reset_n)
	begin
		if(~reset_n)
			counter <= 2'b00;
		else if(parallel_data_valid_sync)
			counter <= 2'b01;
		else if(current_state == EVALUATE_RESULTS)
			counter <= 2'b10;
		else 
			counter <= 0;
	end

	always @(*) begin
		alu_function = 'b0;
		alu_en = 0;
		alu_clk_en = 0;
		enable_write_address_register = 0;
		address = 'b0;
		write_en = 0;
		write_data = 'b0;
		read_en = 0;
		
		case(current_state)
			IDLE:
			 begin
			 	if(counter == 2'b10)
			 		alu_clk_en = 1;
			 	else
			 		alu_clk_en = 0;
			 end
			 WAIT_FOR_WRITE_ADDRESS: 
			 begin
			 	if(parallel_data_valid_sync && counter == 0)
			 		enable_write_address_register = 1;
			 	else
			 		enable_write_address_register = 0;
			 end
			 WAIT_FOR_WRITE_DATA: 
			 begin
			 	if(parallel_data_valid_sync && counter == 0)
			 	begin
			 		address = Q_write_address_register;
			 		write_data = parallel_data_sync;
			 		write_en = 1;
			 	end
			 end
			 WAIT_FOR_READ_ADDRESS: 
			 begin
			 	if(parallel_data_valid_sync && counter == 0)
			 	begin
			 		address = parallel_data_sync[$clog2(REGISTER_FILE_DEPTH)-1:0];
			 		read_en = 1;
			 	end

			 end
			 WAIT_FOR_OPERAND_A_DATA: 
			 begin
			 	if(parallel_data_valid_sync && counter == 0)
			 	begin
			 		read_en = 0;
			 		address = OPERAND_A_ADDRESS;
			 		write_en = 1;
			 		write_data = parallel_data_sync;
			 	end
			 end
			 WAIT_FOR_OPERAND_B_DATA: 
			 begin
			 	if(parallel_data_valid_sync && counter == 0)
			 	begin
			 		read_en = 0;
			 		address = OPERAND_B_ADDRESS;
			 		write_en = 1;
			 		write_data = parallel_data_sync;
			 	end
			 end
			 WAIT_FOR_ALU_FUNCTION: 
			 begin
			 	if(parallel_data_valid_sync && counter == 0)
			 	begin
			 		alu_clk_en = 1;
			 	end
			 end
			 EVALUATE_RESULTS: 
			 begin
			 	alu_clk_en = 1;
			 	alu_en = 1;
			 	alu_function = parallel_data_sync[3:0];
			 end
		endcase
	end
endmodule