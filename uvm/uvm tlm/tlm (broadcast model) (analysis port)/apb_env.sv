class apb_env extends uvm_env;
apb_mon mon;
apb_cov cov;
apb_sbd sbd;
apb_ckr ckr;
  `uvm_component_utils(apb_env)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	mon=apb_mon::type_id::create("mon",this);
	cov=apb_cov::type_id::create("cov",this);
	sbd=apb_sbd::type_id::create("sbd",this);
	ckr=apb_ckr::type_id::create("ckr",this);
endfunction

function void connect_phase(uvm_phase phase);
  mon.ap_port.connect(cov.ap_imp);	//master.connect(slave)
  mon.ap_port.connect(sbd.ap_imp);	//master.connect(slave)
  mon.ap_port.connect(ckr.ap_imp);	//master.connect(slave)
endfunction

endclass

