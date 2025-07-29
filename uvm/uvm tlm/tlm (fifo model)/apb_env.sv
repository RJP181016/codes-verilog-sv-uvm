class apb_env extends uvm_env;
apb_prod prod;
apb_cons cons;
uvm_tlm_fifo#(apb_tx) fifo;
`uvm_component_utils(apb_env)

function new(string name="",uvm_component parent=null);
	super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	prod=apb_prod::type_id::create("prod",this);
	cons=apb_cons::type_id::create("cons",this);
	fifo=new("fifo",this);
endfunction

function void connect_phase(uvm_phase phase);
  prod.put_port.connect(fifo.put_export);
  cons.get_port.connect(fifo.get_export);
endfunction

endclass

