#compilation
vlog fifo_cov.sv

#elobaration
vsim top 

#wave
#add wave sim:/top/pif/*

#simulation
run -all
