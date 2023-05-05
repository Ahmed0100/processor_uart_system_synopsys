module uart_transmitter_controller #(parameter DATA_WIDTH=8) (
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	
	input alu_result_valid,
	input [2*DATA_WIDTH-1:0] alu_result,

	input read_data_valid,
	input [DATA_WIDTH-1:0] read_data,

	input transmitter_busy_sync,
	input transmitter_q_pulse_generator,

	output reg transmitter_parallel_data_valid,
	output reg [DATA_WIDTH-1:0] transmitter_parallel_data,

	output reg uart_receiver_controller_en
);

	reg [2:0] current_state,next_state;

	reg d_uart_receiver_controller_en;

	reg [2*DATA_WIDTH-1:0] message;
	localparam [2:0] IDLE = 3'b000,
	TRANSMIT_REGISTER_FILE_DATA=3'b001,
	TRANSMIT_LOWER_ALU_RESULT = 3'b010,
	WAIT_FOR_UBBER_ALU_RESULT= 3'b011,
	TRANSMIT_UBBER_ALU_RESULT= 3'b100;

	localparam [1:0] NO_TRANSMISSION = 2'b00,
	TRANSMISSION_BEGAN= 2'b01,
	TRANSMISSION_ENDED = 2'b10;

	reg [1:0] transmission_current_state,transmission_next_state;


	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			current_state <= IDLE;
		end else begin
			current_state <= next_state;
		end
	end

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            message <= 'b0;
        end
        else if (read_data_valid) begin
            message <= read_data;
        end
        else if (alu_result_valid) begin
            message <= alu_result;
        end
    end
    

	always @(*) begin
		next_state = current_state;
		case(current_state)
			IDLE:
			begin
				if(~transmitter_busy_sync)
				begin
					if(read_data_valid)
						next_state = TRANSMIT_REGISTER_FILE_DATA;
					else if(alu_result_valid)
						next_state = TRANSMIT_LOWER_ALU_RESULT;
					else
						next_state = IDLE;
				end
			end

			TRANSMIT_REGISTER_FILE_DATA: 
			begin
				if(transmission_current_state != TRANSMISSION_ENDED)
					next_state= TRANSMIT_REGISTER_FILE_DATA;
				else
					next_state = IDLE;
			end

			TRANSMIT_LOWER_ALU_RESULT:
			begin
				if(transmission_current_state != TRANSMISSION_ENDED)
					next_state = TRANSMIT_LOWER_ALU_RESULT;
				else
					next_state = WAIT_FOR_UBBER_ALU_RESULT;
			end

			WAIT_FOR_UBBER_ALU_RESULT: 
			begin
				if(~transmitter_q_pulse_generator)
				begin
					next_state = TRANSMIT_UBBER_ALU_RESULT;
				end
				else
					next_state = WAIT_FOR_UBBER_ALU_RESULT;
			end

			TRANSMIT_UBBER_ALU_RESULT:
			begin
				if(transmission_current_state != TRANSMISSION_ENDED)
					next_state = TRANSMIT_UBBER_ALU_RESULT;
				else
					next_state = IDLE;
			end
		endcase // current_statedcase
	end

	always @(*) begin
		case(current_state)
			IDLE: 
			begin
				transmitter_parallel_data = 'b0;
				transmitter_parallel_data_valid = 0;
				d_uart_receiver_controller_en = 1;
			end

			TRANSMIT_REGISTER_FILE_DATA: 
			begin
				transmitter_parallel_data = message[DATA_WIDTH-1:0];
				transmitter_parallel_data_valid = 1;
				d_uart_receiver_controller_en = 0;
			end

			TRANSMIT_LOWER_ALU_RESULT: 
			begin
				transmitter_parallel_data = message[DATA_WIDTH-1:0];
				transmitter_parallel_data_valid = 1; 
				d_uart_receiver_controller_en = 0;
			end

			WAIT_FOR_UBBER_ALU_RESULT: 
			begin
				transmitter_parallel_data = 'b0;
				transmitter_parallel_data_valid = 'b0;
				d_uart_receiver_controller_en = 0;
			end

			TRANSMIT_UBBER_ALU_RESULT: 
			begin
				transmitter_parallel_data = message[2*DATA_WIDTH-1:DATA_WIDTH];
				transmitter_parallel_data_valid = 1; 
				d_uart_receiver_controller_en = 0;
			end
			default: 
			begin
				transmitter_parallel_data = 'b0;
				transmitter_parallel_data_valid = 0;
				d_uart_receiver_controller_en = 1;
			end
		endcase
	end

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			uart_receiver_controller_en <= 1;
		end else begin
			uart_receiver_controller_en <= d_uart_receiver_controller_en;
		end
	end

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			transmission_current_state <= NO_TRANSMISSION;
		end else begin
			transmission_current_state <= transmission_next_state;
		end
	end

	always @(*) begin
		transmission_next_state = transmission_current_state;
		case(transmission_current_state)
			NO_TRANSMISSION: 
			begin
				if(transmitter_busy_sync)
					transmission_next_state = TRANSMISSION_BEGAN;
			end
			TRANSMISSION_BEGAN: 
			begin
				if(~transmitter_busy_sync)
					transmission_next_state = TRANSMISSION_ENDED;
			end
			TRANSMISSION_ENDED:
				transmission_next_state = NO_TRANSMISSION;
		endcase
	end
endmodule