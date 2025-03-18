vlog tb_intr_ctrl.v

vsim -novopt -suppress 12110 +seed=131200 +testname=test_random_unique_priority top

add wave -position insertpoint sim:/top/dut/*

run -all
