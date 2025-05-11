#compilation
vlog top.sv

#elobaration
vsim top -solvefailtestcase -solvefaildebug=2

#simulation
run -all
