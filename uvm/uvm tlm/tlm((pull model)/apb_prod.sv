class apb_prod extends uvm_component;
uvm_blocking_get_imp#(apb_tx,apb_prod) get_imp;
`uvm_component_utils(apb_prod)

function new(string name="",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	get_imp=new("get_imp",this);
endfunction

task get(output apb_tx tx);
	tx=apb_tx::type_id::create("tx",this);
	assert(tx.randomize());
endtask
endclass
