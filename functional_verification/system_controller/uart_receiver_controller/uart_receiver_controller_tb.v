`include "../../../rtl/system_controller/uart_receiver_controller.v"
`timescale 1ns/1ps

module uart_receiver_controller_tb ();

	parameter DATA_WIDTH =8;
	parameter REGISTER_FILE_DEPTH = 16;
	localparam REF_CLK_PER = 25;
	localparam RECEIVER_CLK_PER = 271;

    localparam [DATA_WIDTH - 1:0] REGISTER_FILE_WRITE_COMMAND = 'hAA;
    localparam [DATA_WIDTH - 1:0] REGISTER_FILE_READ_COMMAND = 'hBB;
    localparam [DATA_WIDTH - 1:0] ALU_OPERATION_WITH_OPERANDS_COMMAND = 'hCC;
    localparam [DATA_WIDTH - 1:0] ALU_OPERATION_WITHOUT_OPERANDS_COMMAND = 'hDD;

    reg ref_clk_tb;
    reg reset_n_tb;
    reg enable_tb;
    reg parallel_data_valid_sync_tb;
    reg [DATA_WIDTH-1:0] parallel_data_sync_tb;

    wire [3:0] alu_function_tb;
    wire alu_en_tb;
    wire alu_clk_en_tb;
    wire [$clog2(REGISTER_FILE_DEPTH)-1:0] address_tb;
    wire write_en_tb;
    wire [DATA_WIDTH-1:0] write_data_tb;
    wire read_en_tb;

    integer i;
    integer file;
    integer passed_tc;
    integer total_tc;


    initial
    begin
    	$timeformat(-9,2," ns", 20);
    	file = $fopen("output.txt","w");
    	passed_tc = 0;
    	total_tc = 0;
    	initialize();
    	reset();
    	enable_tb = 1;
    	//tc 1
    	@(posedge  ref_clk_tb);
    	parallel_data_valid_sync_tb = 1;
    	parallel_data_sync_tb = REGISTER_FILE_WRITE_COMMAND;

    	#(REF_CLK_PER);
    	parallel_data_valid_sync_tb = 0;
    	#(12 * RECEIVER_CLK_PER);
    	parallel_data_valid_sync_tb = 1;
    	parallel_data_sync_tb = 'b0000_1101;
    	#(REF_CLK_PER);
    	parallel_data_valid_sync_tb = 0;
    	#(12 * RECEIVER_CLK_PER);
    	parallel_data_valid_sync_tb = 1;
    	parallel_data_sync_tb = 'b1100_1111;
    	#(REF_CLK_PER/2);

    	if(address_tb == 'b1101 && write_data_tb == 'b1100_1111)
    	begin
    		$fdisplay(file, "testcase 1 passed.");
    		passed_tc = passed_tc + 1;
    	end
    	else
    		$fdisplay(file,"testcase 1 failed");
	    
    	#(12 * RECEIVER_CLK_PER);
    	parallel_data_valid_sync_tb = 0;
    	#(RECEIVER_CLK_PER);
    	total_tc = total_tc + 1;

    	//testcase 2
    	parallel_data_valid_sync_tb = 1;
    	parallel_data_sync_tb = REGISTER_FILE_READ_COMMAND;
    	#(REF_CLK_PER);
    	parallel_data_valid_sync_tb = 0;
    	#(12 * RECEIVER_CLK_PER);
    	parallel_data_valid_sync_tb = 1;
    	parallel_data_sync_tb = 'b0000_1000;
    	#(REF_CLK_PER/2);

        if (address_tb == 'b1000 && read_en_tb == 1'b1) begin
            $fdisplay(file, "Test case (%0d) passed.", 2);
            passed_tc = passed_tc + 1;
        end
        else begin
            $fdisplay(file, "Test case (%0d) failed.", 2);
        end
        // data valid cycle
        #(RECEIVER_CLK_PER);
        parallel_data_valid_sync_tb = 1'b0;
        #(RECEIVER_CLK_PER)
        total_tc = total_tc + 1;

        //tc3
        parallel_data_valid_sync_tb = 1;
        parallel_data_sync_tb = ALU_OPERATION_WITH_OPERANDS_COMMAND;
        #(REF_CLK_PER);
        parallel_data_valid_sync_tb = 0;
        #(12*RECEIVER_CLK_PER);
        parallel_data_valid_sync_tb = 1;
        parallel_data_sync_tb = 'b0000_1001;

        #(REF_CLK_PER);
        parallel_data_valid_sync_tb = 0;
        #(12*RECEIVER_CLK_PER);
        parallel_data_sync_tb = 'b0000_1010;
        parallel_data_valid_sync_tb = 1;
        #(REF_CLK_PER);
        parallel_data_valid_sync_tb = 0;

        #(12*RECEIVER_CLK_PER);
        parallel_data_valid_sync_tb = 1;
        parallel_data_sync_tb = 'b0000_0100;

        #(REF_CLK_PER * 1.5);
        if (alu_function_tb == 'b0100 && alu_en_tb == 1'b1 && alu_clk_en_tb == 1'b1) begin
            $fdisplay(file, "Test case (%0d) passed.", 3);
            passed_tc = passed_tc + 1;
        end
        else begin
            $fdisplay(file, "Test case (%0d) failed.", 3);
        end

        // data valid cycle
        #(RECEIVER_CLK_PER);
        parallel_data_valid_sync_tb = 1'b0;
        

        #(RECEIVER_CLK_PER)
        total_tc = total_tc + 1;
    
    end
    // Initialize all the input signals
    task initialize();
    begin
        ref_clk_tb = 1'b0;
        reset_n_tb = 1'b1;
        enable_tb = 1'b0;
        parallel_data_valid_sync_tb = 1'b0;
        parallel_data_sync_tb = 'b0;
    end
    endtask

    // Reset the system in one clock cycle
    task reset();
    begin
        #REF_CLK_PER
        reset_n_tb = 1'b0;
        #REF_CLK_PER
        reset_n_tb = 1'b1;
    end
    endtask

    // reference clock generator
    always #(REF_CLK_PER / 2.0) ref_clk_tb = ~ref_clk_tb;


    // DUT instantiation
    uart_receiver_controller #(
        .DATA_WIDTH(DATA_WIDTH),
        .REGISTER_FILE_DEPTH(REGISTER_FILE_DEPTH)
    ) uart_receiver_controller_inst(
        .clk(ref_clk_tb),
        .reset_n(reset_n_tb),
        .enable(enable_tb),
        .parallel_data_valid_sync(parallel_data_valid_sync_tb),
        .parallel_data_sync(parallel_data_sync_tb),

        .alu_function(alu_function_tb),
        .alu_en(alu_en_tb),
        .alu_clk_en(alu_clk_en_tb),
        .address(address_tb),
        .write_en(write_en_tb),
        .write_data(write_data_tb),
        .read_en(read_en_tb)
    );
endmodule