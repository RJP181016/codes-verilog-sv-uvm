class axi_cov extends uvm_subscriber#(axi_tx);
`uvm_component_utils(axi_cov)
`NEW_COMP
virtual axi_intf vif;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_resource_db#(virtual axi_intf)::set("GLOBAL","axi_pif",vif,this);
endfunction

function void write(axi_tx tx);
endfunction

endclass
