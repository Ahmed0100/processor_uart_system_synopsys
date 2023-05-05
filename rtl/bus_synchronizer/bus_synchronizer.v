module register #(
    parameter BUS_WIDTH = 1
)
(
    input clk,
    input reset_n,
    input [BUS_WIDTH - 1:0] D,

    output reg [BUS_WIDTH - 1:0] Q
);

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            Q <= 'b0;
        end
        else begin
            Q <= D;
        end
    end

endmodule

module bus_synchronizer #(parameter BUS_WIDTH=1, STAGE_COUNT = 2)
(
	input clk,
	input reset_n,
	input [BUS_WIDTH-1:0] asynchronous_data,
	output [BUS_WIDTH-1:0] synchronous_data
);

	genvar i;
	wire [BUS_WIDTH-1:0] output_ports [0: STAGE_COUNT];

	register #( .BUS_WIDTH(BUS_WIDTH)) reg_inst_0
	(
			.clk(clk),
			.reset_n(reset_n),
			.D(asynchronous_data),
			.Q(output_ports[0])
	);
	for(i=1;i<STAGE_COUNT;i=i+1)
	begin
		register #( .BUS_WIDTH(BUS_WIDTH)) reg_inst
		(
				.clk(clk),
				.reset_n(reset_n),
				.D(output_ports[0]),
				.Q(output_ports[1])
		);
	end
	assign synchronous_data = output_ports[STAGE_COUNT-1];
endmodule
