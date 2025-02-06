vlog dff.v dff_tb.v +acc
vsim work.top 
add wave sim:/top/*
run -all
