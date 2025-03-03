vlog tb_async_fifo.v

vsim -novopt -suppress 12110 +seed=1312000 +testname=test_underflow top

add wave -position insertpoint sim:/top/dut/*

run -all
