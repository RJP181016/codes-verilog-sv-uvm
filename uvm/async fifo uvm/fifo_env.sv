class fifo_env extends uvm_env;
`uvm_component_utils(fifo_env)
`NEW_COMP
  
write_agent wagent;
read_agent ragent;
fifo_sbd sbd;
  
function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	wagent=write_agent::type_id::create("wagent",this);
	ragent=read_agent::type_id::create("ragent",this);
    sbd=fifo_sbd::type_id::create("sbd",this);
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
  wagent.mon.mon_ap.connect(sbd.mon_in);
  ragent.mon.mon_ap.connect(sbd.mon_out);
endfunction
endclass
