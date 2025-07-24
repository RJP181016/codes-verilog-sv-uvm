vlog testbench.sv

vsim -novopt -sv_lib C:\questasim64_10.7c\uvm-1.2\linux_x86_64\uvm_dpi top +UVM_TESTNAME=new_test -l run.log +UVM_TIMEOUT=1000 +UVM_VERBOSITY=UVM_HIGH

#add wave sim:/top/dut/*

run -all
