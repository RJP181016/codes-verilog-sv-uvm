#compilation
vlog top.sv

#elobaration
vsim top +target_slave=6'b00_1111

#wave
#add wave sim:/top/pif/*

#simulation
run -all
