#compilation
vlog top6.sv

#elobaration
vsim top +testname=test_random_pkts

#simulation
run -all
