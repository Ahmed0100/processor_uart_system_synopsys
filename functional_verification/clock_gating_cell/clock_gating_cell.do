add wave -position insertpoint  \
sim:/clock_gating_cell/clk \
sim:/clock_gating_cell/clk_en \
sim:/clock_gating_cell/gated_clk

force -freeze sim:/clock_gating_cell/clk 0 0, 1 {10 ns} -r 20 ns
force -freeze sim:/clock_gating_cell/clk_en 0 0
run {25 ns}

force -freeze sim:/clock_gating_cell/clk_en 1 0
run {49 ns}

force -freeze sim:/clock_gating_cell/clk_en 0 0
run {24 ns}

force -freeze sim:/clock_gating_cell/clk_en 1 0
run {39 ns}

force -freeze sim:/clock_gating_cell/clk_en 0 0
run {86 ns}

force -freeze sim:/clock_gating_cell/clk_en 1 0
run {28 ns}

force -freeze sim:/clock_gating_cell/clk_en 0 0
run {43 ns}

force -freeze sim:/clock_gating_cell/clk_en 1 0
run {29 ns}

force -freeze sim:/clock_gating_cell/clk_en 0 0
run {86 ns}

force -freeze sim:/clock_gating_cell/clk_en 1 0
run {39 ns}

force -freeze sim:/clock_gating_cell/clk_en 0 0
run {86 ns}