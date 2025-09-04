vlog top.sv
vsim -novopt -suppress 12110 top +testname=SLAVE_ERROR_TEST
do wave.do
run -all
