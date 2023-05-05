module uart_transmitter_fsm #(
	parameter DATA_WIDTH = 8,
	parameter START_BIT_SELECT = 2'b00,
	parameter STOP_BIT_SELECT = 2'b01,
	parameter SER_DATA_SELECT = 2'b10,
	parameter PAR_BIT_SELECT = 2'b11)
(
	input clk,    // Clock
	input reset_n,  // Asynchronous reset active low
	
	input par_en,
	input data_valid,

	output reg ser_en,
	output reg [1:0] bit_sel,
	output wire [$clog2(DATA_WIDTH) -1 :0] ser_data_index,
	output reg busy	
);

	reg [$clog2(DATA_WIDTH):0] serial_data_transmission_state;
	reg [1:0] current_state,next_state;

	localparam [2:0] IDLE= 3'b000;
	localparam [2:0] START_BIT_STATE= 3'b001;
	localparam [2:0] SER_DATA_STATE= 3'b010;
	localparam [2:0] PAR_BIT_STATE= 3'b011;
	localparam [2:0] STOP_BIT_STATE= 3'b100;

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			serial_data_transmission_state <= 0;
		end 
		else if( (current_state == START_BIT_STATE || current_state == SER_DATA_STATE) && ~serial_data_transmission_state[$clog2(DATA_WIDTH)] ) 
		begin
			serial_data_transmission_state <= serial_data_transmission_state + 1;
		end
		else
			serial_data_transmission_state <= 0;
	end

	assign ser_data_index = serial_data_transmission_state[$clog2(DATA_WIDTH)-1:0];

	always @(posedge clk or negedge reset_n) begin
		if(~reset_n) begin
			current_state <= IDLE;
		end else begin
			current_state <= next_state;
		end
	end
	always @(*)
	begin
		next_state = current_state;
		case(current_state)
			IDLE: 
			begin
				if(data_valid)
				begin
					next_state = START_BIT_STATE;
				end
			end
			START_BIT_STATE:
			begin
				next_state = SER_DATA_STATE;
			end
			SER_DATA_STATE: 
			begin
				if(serial_data_transmission_state[$clog2(DATA_WIDTH)])
				begin
					if(par_en)
						next_state = PAR_BIT_STATE;
					else
						next_state = STOP_BIT_STATE;
				end
			end
			PAR_BIT_STATE: 
			begin
				next_state = STOP_BIT_STATE;
			end
			STOP_BIT_STATE: 
			begin
				next_state = IDLE;
			end
		endcase
	end

	always @(*) begin
		busy = 0;
		bit_sel = STOP_BIT_SELECT;
		ser_en = 0;
		case(current_state)
			IDLE: 
			begin
				busy = 0;
				ser_en = 0;
				bit_sel = STOP_BIT_SELECT;
			end
			START_BIT_STATE: 
			begin
				ser_en = 1;
				busy = 1;
				bit_sel = START_BIT_SELECT;
			end
			SER_DATA_STATE: 
			begin
				busy = 1;
				if(serial_data_transmission_state[$clog2(DATA_WIDTH)])
					ser_en = 0;
				else
					ser_en = 1;
				bit_sel = SER_DATA_SELECT;
			end
			PAR_BIT_STATE: 
			begin
				busy = 1;
				ser_en  = 0;
				bit_sel = PAR_BIT_SELECT;
			end
			STOP_BIT_STATE:
			begin
				busy = 0;
				ser_en = 0;
				bit_sel = STOP_BIT_SELECT;
			end
		endcase
	end
endmodule