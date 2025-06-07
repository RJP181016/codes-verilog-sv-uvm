#compilation
vlog axi_tx.sv

#elobaration
vsim top 

#wave
#add wave sim:/top/pif/*

#simulation
run -all
