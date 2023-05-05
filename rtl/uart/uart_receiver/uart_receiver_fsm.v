module uart_receiver_fsm #(parameter DATA_WIDTH=8)(
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	input par_en,
	input [5:0] prescale,
	input ser_data_in,
	input start_bit_error,
	input stop_bit_error,
	input par_bit_error,
	input [4:0] edge_count,
	input edge_count_done,

	output reg start_bit_check_en,
	output reg stop_bit_check_en,
	output reg par_bit_check_en,
	output reg edge_counter_data_sampler_en,
	output reg deserializer_en,
	output [$clog2(DATA_WIDTH)-1:0] data_index,
	output reg data_valid
);

	wire [5:0] sampling_edge_number;
	wire [5:0] final_edge_number;
	reg [2:0] current_state,next_state;
    localparam [2:0] IDLE = 3'b000;
    localparam [2:0] START_BIT_RECEPTION = 3'b001;
    localparam [2:0] SERIAL_DATA_RECEPTION = 3'b010;
    localparam [2:0] PARITY_BIT_RECEPTION = 3'b011;
    localparam [2:0] STOP_BIT_RECEPTION = 3'b100;
    localparam [2:0] DATA_VALID = 3'b101;

    reg [$clog2(DATA_WIDTH):0] data_receiption_state;
    assign final_edge_number = prescale - 2;

    always @(posedge clk or negedge reset_n) begin
    	if(~reset_n) begin
    		data_receiption_state <= 0;
    	end else if(current_state == SERIAL_DATA_RECEPTION & edge_count == final_edge_number) begin
    		data_receiption_state <= data_receiption_state + 1;
    	end
    	else if(data_receiption_state[$clog2(DATA_WIDTH)])
    		data_receiption_state <= 0;
    end

    assign data_index = data_receiption_state[$clog2(DATA_WIDTH)-1:0];

    always @(posedge clk or negedge reset_n) begin
    	if(~reset_n) begin
    		current_state <= IDLE;
    	end else
    	begin
    		current_state <= next_state;
    	end
    end

    always @(*) begin
    	next_state = current_state;
    	case(current_state)
    		IDLE: 
    		begin
    			if(~ser_data_in)
    				next_state = START_BIT_RECEPTION;

    		end
    		START_BIT_RECEPTION: 
    		begin
    			if(edge_count_done & start_bit_error)
    				next_state = IDLE;
    			else if(edge_count_done)
    				next_state = SERIAL_DATA_RECEPTION;
    		end
    		SERIAL_DATA_RECEPTION: 
    		begin
    			if(edge_count_done)
    			begin
    				if(~data_receiption_state[$clog2(DATA_WIDTH)])
    					next_state = SERIAL_DATA_RECEPTION;
    				else if(par_en)
    					next_state = PARITY_BIT_RECEPTION;
    				else 
    					next_state = STOP_BIT_RECEPTION;
    			end
    		end
    		PARITY_BIT_RECEPTION: 
    		begin
    			if(edge_count_done && par_bit_error) 
    			begin
    				next_state = IDLE;
    			end
    			else if (edge_count_done)
    				next_state = STOP_BIT_RECEPTION;

    		end
    		STOP_BIT_RECEPTION: 
    		begin
    			if(edge_count_done && stop_bit_error) 
    			begin
    				next_state = IDLE;
    			end
    			else if (edge_count_done)
    				next_state = DATA_VALID;
 
    		end

            DATA_VALID: begin
                if (~ser_data_in) begin
                    next_state = START_BIT_RECEPTION;
                end
                else begin
                    next_state = IDLE;
                end
            end
    	endcase // current_state
    end
    assign sampling_edge_number = (prescale >> 1) - 4'd3;

    always @(*) begin
    	case(current_state)
    		IDLE: 
    		begin
    			edge_counter_data_sampler_en = 0;
    			deserializer_en = 0;
    			start_bit_check_en = 0;
    			stop_bit_check_en = 0;
    			par_bit_check_en = 0;
    			data_valid = 0;
    		end
    		START_BIT_RECEPTION: 
    		begin
    			edge_counter_data_sampler_en = 1;
    			deserializer_en = 0;
    			if(edge_count == sampling_edge_number + 5)
    				start_bit_check_en = 1;
    			else
    				start_bit_check_en = 0;

    			stop_bit_check_en = 0;
    			par_bit_check_en = 0;
    			data_valid = 0;
    		end
    		SERIAL_DATA_RECEPTION: 
    		begin
    			edge_counter_data_sampler_en = 1;

				if(edge_count == sampling_edge_number + 5)
					deserializer_en = 1;
				else
					deserializer_en = 0;  

    			start_bit_check_en = 0;
    			stop_bit_check_en = 0;
    			par_bit_check_en = 0;
    			data_valid = 0;
    		end

    		PARITY_BIT_RECEPTION: 
    		begin
    			edge_counter_data_sampler_en = 1;
    			deserializer_en = 0;

    			start_bit_check_en = 0;
    			stop_bit_check_en = 0;
    			
				if(edge_count == sampling_edge_number + 5)
					par_bit_check_en = 1;
				else
					par_bit_check_en = 0;  
    			data_valid = 0;
    		end

            STOP_BIT_RECEPTION: begin
                edge_counter_data_sampler_en = 1'b1;
                deserializer_en = 1'b0;
                start_bit_check_en = 1'b0;
                par_bit_check_en = 1'b0;

                if (edge_count == sampling_edge_number + 4'd5) begin
                    stop_bit_check_en = 1'b1;
                end
                else begin
                    stop_bit_check_en = 1'b0;
                end
                
                data_valid = 1'b0;
            end


    		DATA_VALID: 
    		begin
    			edge_counter_data_sampler_en = 0;
    			deserializer_en = 0;
    			start_bit_check_en = 0;
    			stop_bit_check_en = 0;
				par_bit_check_en = 0;  
    			data_valid = 1;
    		end

    		default: 
    		begin
    			edge_counter_data_sampler_en = 0;
    			deserializer_en = 0;
    			start_bit_check_en = 0;
    			stop_bit_check_en = 0;
				par_bit_check_en = 0;  
    			data_valid = 0;
    		end
    	endcase
    end
endmodule