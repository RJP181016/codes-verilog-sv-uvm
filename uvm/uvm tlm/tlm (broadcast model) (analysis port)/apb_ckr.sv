class apb_ckr extends uvm_component;
apb_tx tx;
  uvm_analysis_imp#(apb_tx,apb_ckr) ap_imp;
`uvm_component_utils(apb_ckr)

function new(string name="",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  ap_imp=new("ap_imp",this);
endfunction

function void write(apb_tx tx);
  `uvm_info("CKR-analysis","mon > ckr",UVM_NONE)
	tx.print();
endfunction
endclass



