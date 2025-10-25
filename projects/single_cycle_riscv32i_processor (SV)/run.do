vlog top_tb.sv
vsim -novopt -suppress 12110 top_tb
add log -r sim:/top_tb/*
do wave.do
run -all
