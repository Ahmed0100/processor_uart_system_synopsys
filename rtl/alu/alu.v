module alu #(
    parameter DATA_WIDTH = 8
)
(
    input clk,
    input reset_n,
    input [DATA_WIDTH - 1:0] A,
    input [DATA_WIDTH - 1:0] B,
    input [3:0] alu_function,
    input enable,
    
    output reg alu_result_valid,
    output reg [2 * DATA_WIDTH - 1:0] alu_result
);

    always @(posedge clk or negedge reset_n) begin
        if (~reset_n) begin
            alu_result <= 'b0;
            alu_result_valid <= 1'b0;
        end
        else begin
            if (enable) begin
                case (alu_function)
                    4'b0000: begin
                        alu_result <= A + B;
                        alu_result_valid <= 1'b1;
                    end
                    4'b0001: begin
                        alu_result <= A - B;
                        alu_result_valid <= 1'b1;
                    end
                    4'b0010: begin
                        alu_result <= A * B;
                        alu_result_valid <= 1'b1;
                    end
                    4'b0011: begin
                        alu_result <= A / B;
                        alu_result_valid <= 1'b1;
                    end
                    4'b0100: begin
                        alu_result <= A & B;
                        alu_result_valid <= 1'b1;
                    end
                    4'b0101: begin
                        alu_result <= A | B;
                        alu_result_valid <= 1'b1;
                    end
                    4'b0110: begin
                        alu_result <= ~(A & B);
                        alu_result_valid <= 1'b1;
                    end
                    4'b0111: begin
                        alu_result <= ~(A | B);
                        alu_result_valid <= 1'b1;
                    end
                    4'b1000: begin
                        alu_result <= A ^ B;
                        alu_result_valid <= 1'b1;
                    end
                    4'b1001: begin
                        alu_result <= ~(A ^ B);
                        alu_result_valid <= 1'b1;
                    end
                    4'b1010: begin
                        if (A == B) begin
                            alu_result <= 'b1;
                        end
                        else begin
                            alu_result <= 'b0;
                        end
                        alu_result_valid <= 1'b1;
                    end
                    4'b1011: begin
                        if (A > B) begin
                            alu_result <= 'b1;
                        end
                        else begin
                            alu_result <= 'b0;
                        end
                        alu_result_valid <= 1'b1;
                    end
                    4'b1100: begin
                        if (A < B) begin
                            alu_result <= 'b1;
                        end
                        else begin
                            alu_result <= 'b0;
                        end
                        alu_result_valid <= 1'b1;
                    end
                    4'b1101: begin
                        alu_result <= A >> 1;
                        alu_result_valid <= 1'b1;
                    end
                    4'b1110: begin
                        alu_result <= A << 1;
                        alu_result_valid <= 1'b1;
                    end
                    default: begin
                        alu_result <= 'b0;
                        alu_result_valid <= 1'b0;
                    end

                endcase
            end
            else begin
                alu_result <= 'b0;
                alu_result_valid <= 1'b0;
            end
            
        end
    end

endmodule