`include "../../../rtl/system_controller/uart_transmitter_controller.v"

`timescale 1ns/1ps

module uart_transmitter_controller_tb();

	parameter DATA_WIDTH = 8;

	localparam REF_CLK_PER = 25;
	localparam TRANSMITTER_CLK_PER = 8672;

	reg ref_clk_tb;
	reg reset_n_tb;
	reg [2*DATA_WIDTH-1:0] alu_result_tb;
	reg alu_result_valid_tb;
	reg [DATA_WIDTH-1:0] read_data_tb;
	reg read_data_valid_tb;
	reg transmitter_busy_sync_tb;
	reg transmitter_q_pulse_generator_tb;

	wire [DATA_WIDTH-1:0] transmitter_parallel_data_tb;
	wire transmitter_parallel_data_valid_tb;
	wire uart_receiver_controller_en_tb;

	integer i;
	integer passed_tc,total_tc;
	reg result;
	integer file;

	initial
	begin
		$timeformat(-9,2," ns",20);
		file = $fopen("output.txt","w");
		passed_tc = 0;
		total_tc = 0;
		initialize();
		reset();
		//testcase 1
		alu_result_valid_tb = 1;
		alu_result_tb = 'b1110_0111_1010_0110;
		#(3* TRANSMITTER_CLK_PER);
		transmitter_busy_sync_tb = 1;
		transmitter_q_pulse_generator_tb = 1;

		#(12 * TRANSMITTER_CLK_PER);
		if(transmitter_parallel_data_tb == alu_result_tb[7:0])
			result = 1;
		else
		begin
			$fdisplay(file, "%8b", transmitter_parallel_data_tb);
			result = 0;
		end
		
		transmitter_busy_sync_tb = 0;
		alu_result_valid_tb = 0;
		transmitter_q_pulse_generator_tb = 0;

		#(2 * TRANSMITTER_CLK_PER);
		alu_result_valid_tb = 1;
		transmitter_q_pulse_generator_tb = 1;
		#TRANSMITTER_CLK_PER;
		transmitter_busy_sync_tb = 1;
		#(12 * TRANSMITTER_CLK_PER);
		if(transmitter_parallel_data_tb != alu_result_tb[15:8])
		begin
			result = 0;
			$fdisplay(file,"%8b", transmitter_parallel_data_tb);
		end
		transmitter_busy_sync_tb = 0;

		if(result)
		begin
			passed_tc = passed_tc + 1;
			$fdisplay(file, "testcase %0d passed.", 1);
		end
		else 
			$fdisplay(file, "testcase %0d failed.", 1);
		total_tc = total_tc + 1;

		//testcase 2
		alu_result_valid_tb = 0;
		read_data_valid_tb = 1;
		read_data_tb = 8'b0111_1001;
		#(3 * TRANSMITTER_CLK_PER);
		transmitter_busy_sync_tb = 1;
		#(12 * TRANSMITTER_CLK_PER);
		if(transmitter_parallel_data_tb == read_data_tb)
		begin
			$fdisplay(file,"testcase %0d passed.",2);
			passed_tc = passed_tc + 1;
		end
		else 
		begin
			$fdisplay(file,"testcase %0d failed.",2);
			$fdisplay(file," %8b", transmitter_parallel_data_tb);			
		end
		total_tc = total_tc + 1;
		$fdisplay(file,"total:  %0d/%0d",passed_tc, total_tc);
		// $stop;
	end

	task initialize();
	begin
        ref_clk_tb = 1'b0;
        reset_n_tb = 1'b1;
        alu_result_tb = 'b0;
        alu_result_valid_tb = 1'b0;
        read_data_tb = 'b0;
        read_data_valid_tb = 1'b0;
        transmitter_busy_sync_tb = 1'b0;
        transmitter_q_pulse_generator_tb = 1'b0;		
	end
	endtask
	task reset();
	begin
		#REF_CLK_PER;
		reset_n_tb = 0;
		#REF_CLK_PER; 
		reset_n_tb = 1;	
	end
	endtask
	always #(REF_CLK_PER/2) ref_clk_tb = ~ref_clk_tb;

    // DUT instantiation
    uart_transmitter_controller #(
        .DATA_WIDTH(DATA_WIDTH)
    ) uart_transmitter_controller_inst(
        .clk(ref_clk_tb),
        .reset_n(reset_n_tb),
        .alu_result_valid(alu_result_valid_tb),
        .alu_result(alu_result_tb),
        .read_data_valid(read_data_valid_tb),
        .read_data(read_data_tb),
        .transmitter_busy_sync(transmitter_busy_sync_tb),
        .transmitter_q_pulse_generator(transmitter_q_pulse_generator_tb),

        .transmitter_parallel_data_valid(transmitter_parallel_data_valid_tb),
        .transmitter_parallel_data(transmitter_parallel_data_tb),
        .uart_receiver_controller_en(uart_receiver_controller_en_tb)
    );
endmodule