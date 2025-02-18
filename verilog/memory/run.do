vlog tb_memory1.v

vsim -novopt -suppress 12110 +seed=13102000 +testname=test_write_fd_read_fd top

add wave -position insertpoint sim:/top/dut/*

run -all
