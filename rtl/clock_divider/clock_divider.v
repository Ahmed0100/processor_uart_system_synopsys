`timescale 1ns/1ns

module clock_divider
(
	input ref_clk,
	input reset_n,
	input clk_divider_en,
	input [5:0] division_ratio,
	output output_clk
);

reg [4:0] counter;
wire [4:0] ratio_divided_by_two;
wire enable;
reg odd_toggle;
reg divided_clk;

assign enable = clk_divider_en && (division_ratio != 5'h1) && (division_ratio != 5'h0);
assign ratio_divided_by_two = (division_ratio >> 1);
assign output_clk = (enable)? divided_clk : ref_clk;

always @(posedge ref_clk or negedge reset_n) begin
	if(~reset_n) begin
		odd_toggle <= 1;
		divided_clk <= 1'h0;
		counter <= 5'h0;
	end 
	else if(enable) begin
		 if(!division_ratio[0] && counter == ratio_divided_by_two - 1)
		 begin
		 	counter <= 0;
		 	divided_clk <= ~divided_clk;
		 end
		 else if(division_ratio[0] && ((odd_toggle && counter == ratio_divided_by_two -1) | (~odd_toggle && counter == ratio_divided_by_two)))
		 begin
		 	counter <= 0;
		 	divided_clk <= ~divided_clk;
		 	odd_toggle <= ~odd_toggle;
		 end
		 else
		 	counter <= counter + 1;
	end
end
endmodule
