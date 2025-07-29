class apb_test extends uvm_test;
  apb_env env;
`uvm_component_utils(apb_test)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  env=apb_env::type_id::create("env",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	uvm_top.print_topology();
endfunction

task run_phase(uvm_phase phase);
endtask
endclass



