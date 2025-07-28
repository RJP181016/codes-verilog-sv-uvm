class apb_env extends uvm_env;
apb_prod prod;
apb_cons cons;
  `uvm_component_utils(apb_env)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	prod=apb_prod::type_id::create("prod",this);
	cons=apb_cons::type_id::create("cons",this);
endfunction

function void connect_phase(uvm_phase phase);
  prod.put_port.connect(cons.put_imp);	//master.connect(slave)
endfunction

endclass
