#compilation
vlog list1.svh
vlog -cover fcbest memory.v

#vopt work.top +cover=fcbest -o test_n_wt_n_rd

#elobaration
vsim -cover -novopt -voptargs="+cover=bcstf" top -suppress 12110 -suppress 3369 +testname=test_n_wt_n_rd -l test_n_wt_n_rd.log

#coverage save -onexit test_n_wt_n_rd.ucdb 
#-coverage 

#wave
add wave sim:/top/pif/*

#simulation
run -all
