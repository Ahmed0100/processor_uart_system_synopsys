add wave -position insertpoint  \
sim:/reset_synchronizer/clk \
sim:/reset_synchronizer/reset_n \
sim:/reset_synchronizer/reset_synchronized

force -freeze sim:/reset_synchronizer/clk 0 0, 1 {10 ns} -r 20 ns
force -freeze sim:/reset_synchronizer/reset_n 0 0
run {25 ns}

force -freeze sim:/reset_synchronizer/reset_n 1 0
run {49 ns}

force -freeze sim:/reset_synchronizer/reset_n 0 0
run {24 ns}

force -freeze sim:/reset_synchronizer/reset_n 1 0
run {39 ns}

force -freeze sim:/reset_synchronizer/reset_n 0 0
run {86 ns}

force -freeze sim:/reset_synchronizer/reset_n 1 0
run {28 ns}

force -freeze sim:/reset_synchronizer/reset_n 0 0
run {43 ns}

force -freeze sim:/reset_synchronizer/reset_n 1 0
run {29 ns}

force -freeze sim:/reset_synchronizer/reset_n 0 0
run {86 ns}

force -freeze sim:/reset_synchronizer/reset_n 1 0
run {39 ns}

force -freeze sim:/reset_synchronizer/reset_n 0 0
run {86 ns}