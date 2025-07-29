class apb_prod extends uvm_component;
  apb_tx tx;
  uvm_blocking_put_port#(apb_tx) put_port;
`uvm_component_utils(apb_prod)

function new(string name="",uvm_component parent=null);
super.new(name,parent);
endfunction

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  put_port=new("put_port",this);
endfunction

  task run_phase(uvm_phase phase);
    phase.raise_objection(this);
    repeat(5) begin
      tx=apb_tx::type_id::create("tx",this);
      assert(tx.randomize());
      put_port.put(tx);
      #10;
    end
    phase.drop_objection(this);
  endtask
endclass
