#!/usr/bin/perl
open FH, "<testlist.txt";
@tests = <FH>;

$PRJ_HOME =  "C:/Windows/Resources/vlsiguru/Ethernet_MAC_Functional_Verific/ethernet_mac_uvc";

#Compile
&compile;

#elaboration
foreach $testname (@tests) {
    chomp ($testname);
    $testname =~ s/\r//g;
    &elaborate($testname);
}

#merge UCDB
&merge();

#report
&report();

#move .log files in to LOGS directory
system ("mkdir LOGS");
system ("mv *.log LOGS");

#move .ucdb files in to UCDB directory
system ("mkdir UCDB");
system ("mv *.ucdb UCDB");

system ("rm -rf work");
close(FH);
####################################################################################################################

#compile
sub compile() {
    system ("vlog -cover fcbest \\
    +incdir+${PRJ_HOME}/rtl/verilog \\
    +incdir+${PRJ_HOME}/verif/top \\
    +incdir+${PRJ_HOME}/verif/wb \\
    +incdir+${PRJ_HOME}/verif/phy \\
    +incdir+${PRJ_HOME}/verif/mii \\
    +incdir+${PRJ_HOME}/verif/sbd \\
    +incdir+C:/questasim64_10.7c/uvm-1.1d/src \\
	../top/top_tb.sv");
}

#Elaborate #Coverage #Simulation
sub elaborate() {
    my $testname = shift;
    $testname_log = $testname."\.log";
    $testname_ucdb = $testname."\.ucdb";
    system ("vsim -c -cover -novopt -suppress 12110 -sv_lib C:/questasim64_10.7c/uvm-1.1d/win64/uvm_dpi top_tb +UVM_TESTNAME=$testname +UVM_VERBOSITY=UVM_LOW +UVM_TIMEOUT=1000000 -l $testname_log -do \"coverage save -onexit $testname_ucdb\" -do \"force -freeze sim:/top_tb/dut/macstatus1/LatchedCrcError 1'h0 0\" -do \"run -all\" -do \"vcov merge final_regr.ucdb $testname_ucdb\"");
}

#Merge all UCDB, 
sub merge() {
    my $testname = shift;
    $merge_cmd = "vcov merge final_regr.ucdb ";
    foreach $testname (@tests) {
        chomp ($testname);
        $testname =~ s/\r//g;
        $testname_ucdb = $testname."\.ucdb ";
        $merge_cmd = $merge_cmd."$testname_ucdb";  
	}
    system ("vsim -c -do \"$merge_cmd\" -do \"exit\"");
}

#Generate the report
sub report() {
    system("vsim -c -do \"coverage open final_regr.ucdb final_regr\" -do \"coverage report -html -htmldir covhtmlreport_regr -source -details -verbose -threshL 50 -threshH 90\" -do \"exit\"");
}
