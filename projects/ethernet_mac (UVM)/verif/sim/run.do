#compile
vlog -cover fcbest\
+incdir+../../rtl/verilog \
+incdir+../mii \
+incdir+../phy \
+incdir+../sbd \
+incdir+../top \
+incdir+../wb \
+incdir+C:/questasim64_10.7c/uvm-1.1d/src \
../top/top_tb.sv

#sim
vsim -cover -novopt -suppress 12110 -sv_lib C:/questasim64_10.7c/uvm-1.1d/win64/uvm_dpi top_tb +UVM_TESTNAME=mac_fd_tx_pause_frame_test +UVM_VERBOSITY=UVM_LOW 
#coverage save -onexit mac_mii_wr_ctrl_data_test.ucdb

#wave
do wave.do

#log
add log -r sim:/top_tb/*

#time for rxframe test
#run 11400

force -freeze sim:/top_tb/dut/macstatus1/LatchedCrcError 1'h0 0

run -all
