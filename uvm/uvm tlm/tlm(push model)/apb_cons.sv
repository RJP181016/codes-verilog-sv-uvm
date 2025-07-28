class apb_cons extends uvm_component;
  uvm_blocking_put_imp#(apb_tx,apb_cons) put_imp; //
`uvm_component_utils(apb_cons)

function new(string name="",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  put_imp=new("put_imp",this);	//
endfunction

  task put(apb_tx tx);	//
	tx.print();
endtask
endclass
