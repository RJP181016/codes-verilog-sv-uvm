class read_agent extends uvm_agent;
`uvm_component_utils(read_agent)
`NEW_COMP

read_drv drv;
read_sqr sqr;
read_mon mon;
read_cov cov;

uvm_active_passive_enum agent_type;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	drv=read_drv::type_id::create("drv",this);
	sqr=read_sqr::type_id::create("sqr",this);
	mon=read_mon::type_id::create("mon",this);
	cov=read_cov::type_id::create("cov",this);
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

