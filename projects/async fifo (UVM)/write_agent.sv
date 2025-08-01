class write_agent extends uvm_agent;
`uvm_component_utils(write_agent)
`NEW_COMP

write_drv drv;
write_sqr sqr;
write_mon mon;
write_cov cov;

uvm_active_passive_enum agent_type;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv=write_drv::type_id::create("drv",this);
	sqr=write_sqr::type_id::create("sqr",this);
	mon=write_mon::type_id::create("mon",this);
	cov=write_cov::type_id::create("cov",this);
	uvm_config_db#(uvm_active_passive_enum)::get(this,"","agent_type",agent_type);
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	if(agent_type==UVM_ACTIVE) begin
		drv.seq_item_port.connect(sqr.seq_item_export);
	end
	mon.mon_ap.connect(cov.analysis_export);
endfunction
endclass
