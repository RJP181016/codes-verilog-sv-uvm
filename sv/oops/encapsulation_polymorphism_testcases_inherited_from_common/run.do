#compilation
vlog top.sv

#elobaration
vsim top -solvefailtestcase -solvefaildebug=2 -sv_seed 1312000 +testcase=test_random_pkts

#simulation
run -all
