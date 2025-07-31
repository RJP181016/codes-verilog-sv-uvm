class alu_drv extends uvm_driver#(alu_tx);
  `uvm_component_utils(alu_drv)
  `NEW_COMP
  
  virtual alu_intf vif;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db#(virtual alu_intf)::get(this,"*","vif",vif)))begin
      `uvm_fatal(get_type_name(),"failed to get vif");
    end
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      seq_item_port.get_next_item(req);
      drive(req);
      seq_item_port.item_done();
    end
  endtask
  
  task drive(input alu_tx tx);
    @(posedge vif.cb);
    vif.reset<=tx.reset;
    vif.cb.inp1<=tx.inp1;
    vif.cb.inp2<=tx.inp2;
    vif.cb.op_code<=tx.op_code;
  endtask
endclass
  