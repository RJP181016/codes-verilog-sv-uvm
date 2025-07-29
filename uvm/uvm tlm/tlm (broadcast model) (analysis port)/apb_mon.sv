class apb_mon extends uvm_component;
apb_tx tx;
uvm_analysis_port#(apb_tx) ap_port;
`uvm_component_utils(apb_mon)

function new(string name="",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	ap_port=new("ap_port",this);
endfunction

task run_phase(uvm_phase phase);
  repeat(3) begin
	tx=apb_tx::type_id::create("tx");
	tx.randomize();
	ap_port.write(tx);	//generating tx, putting into ap_port
end
endtask
endclass

