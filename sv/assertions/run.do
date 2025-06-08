#compilation
vlog fa_2_stage_delay.sv

#elobaration
vsim -vopt top -suppress 12110 -voptargs=+acc

#wave
add wave sim:/top/*
#add wave -r /*

#simulation
run -all
