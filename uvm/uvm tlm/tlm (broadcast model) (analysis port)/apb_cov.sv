class apb_cov extends uvm_component;
apb_tx tx;
  uvm_analysis_imp#(apb_tx,apb_cov) ap_imp;
`uvm_component_utils(apb_cov)

covergroup apb_cg;
	ADDR_CP: coverpoint tx.addr {
		option.auto_bin_max=8;
	}
	WR_RD_CP: coverpoint tx.wt_rd {
		bins WRITE = {1'b1};
		bins READ = {1'b0};
	}
	ADDR_CP_X_WR_RD_CP: cross ADDR_CP,WR_RD_CP;
endgroup

function new(string name="",uvm_component parent=null);
super.new(name,parent);
  apb_cg=new();
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  ap_imp=new("ap_imp",this);
endfunction

function void write(apb_tx tx_t);
	$cast(tx,tx_t);
  `uvm_info("COV-analysis","mon > cov",UVM_NONE)
	tx.print();
	apb_cg.sample();
endfunction
endclass

