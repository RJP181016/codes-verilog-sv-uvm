class apb_cons extends uvm_component;
apb_tx tx;
uvm_blocking_get_port#(apb_tx) get_port;
`uvm_component_utils(apb_cons)

function new(string name="",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	get_port=new("get_port",this);
endfunction

task run_phase(uvm_phase phase);
  phase.raise_objection(this);
	repeat(5) begin
		get_port.get(tx);
		tx.print();
      #25;
	end
  phase.drop_objection(this);
endtask
endclass
