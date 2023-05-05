module output_mux #(parameter START_BIT_SELECT = 2'b00,
	parameter STOP_BIT_SELECT = 2'b01,
	parameter SER_DATA_SELECT = 2'b10,
	parameter PAR_BIT_SELECT = 2'b11 ) (
	input [1:0] bit_sel,
	input ser_data,
	input par_bit,

	output reg mux_out
);

	always @(*) begin
		case(bit_sel)
			START_BIT_SELECT:
				mux_out = 1'b0;
			STOP_BIT_SELECT:
				mux_out = 1'b1;
			SER_DATA_SELECT: 
				mux_out = ser_data;
			PAR_BIT_SELECT: 
				mux_out = par_bit;
		endcase
	end
endmodule