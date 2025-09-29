class axi_agent extends uvm_agent;
`uvm_component_utils(axi_agent);
`NEW_COMP

axi_slave slave;
axi_mon mon;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	slave=axi_slave::type_id::create("slave",this);
	mon=axi_mon::type_id::create("mon",this);
endfunction
endclass
