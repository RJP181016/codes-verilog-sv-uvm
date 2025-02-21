vlog tb_sync_fifo.v

vsim -novopt -suppress 12110 +seed=13102000 +testname=test_concurrent_wt_rd top

add wave -position insertpoint sim:/top/dut/*

run -all
