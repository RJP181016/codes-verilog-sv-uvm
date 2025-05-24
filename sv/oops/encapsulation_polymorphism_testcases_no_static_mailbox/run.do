#compilation
vlog top.sv

#elobaration
vsim top -sv_seed 1312000 +testcase=test_random_pkts +count=10

#simulation
run -all
