/*
* ----------------------------- Ports' Definition -----------------------------
* ----------------------------- Inputs -----------------------------
* clk:        The source clock to be gated (reference clock).
* clk_en: Clock gating enable.
* 
* ----------------------------- Outputs -----------------------------
* gated_clk:  The output gated clock (ALU clock).
*/
module clock_gating_cell (
    input clk,
    input clk_en,

    output gated_clk
);
    reg Q;

    // Active low latch
    always @(clk or clk_en) begin
        if (~clk) begin
            Q <= clk_en;
        end
    end

    assign gated_clk = clk & Q;

endmodule
