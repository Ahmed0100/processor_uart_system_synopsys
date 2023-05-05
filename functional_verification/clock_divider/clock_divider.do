add wave -position insertpoint  \
sim:/clock_divider/ref_clk \
sim:/clock_divider/reset_n \
sim:/clock_divider/clk_divider_en \
sim:/clock_divider/division_ratio \
sim:/clock_divider/counter \
sim:/clock_divider/output_clk


force -freeze sim:/clock_divider/ref_clk 0 0, 1 {20 ns} -r 40 ns
force -freeze sim:/clock_divider/clk_divider_en 0 0
force -freeze sim:/clock_divider/reset_n 0 0
run {80 ns}

force -freeze sim:/clock_divider/reset_n 1 0
run {130 ns}



force -freeze sim:/clock_divider/clk_divider_en 1 0
force -freeze sim:/clock_divider/division_ratio 00_0101 0
run {830 ns}


force -freeze sim:/clock_divider/division_ratio 00_0011 0
run {3000 ns}


force -freeze sim:/clock_divider/division_ratio 00_1000 0
run {800 ns}


force -freeze sim:/clock_divider/division_ratio 00_0110 0
run {800 ns}