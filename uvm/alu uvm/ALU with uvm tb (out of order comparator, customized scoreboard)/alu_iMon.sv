class alu_iMon extends uvm_monitor;
  `uvm_component_utils(alu_iMon)
  `NEW_COMP
  
  virtual alu_intf vif;
  uvm_analysis_port#(alu_tx) mon_ap;
  alu_tx tx;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_ap=new("mon_ap",this);
    if(!(uvm_config_db#(virtual alu_intf)::get(this,"*","vif",vif))) begin
      `uvm_fatal(get_type_name(),"failed to get vif");
    end
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    forever begin
      tx=alu_tx::type_id::create("tx",this);
      wait(!vif.reset);
      @(vif.cb_mon_in.inp1 or vif.cb_mon_in.inp2 or vif.cb_mon_in.op_code);
      tx.reset=vif.reset;
      tx.inp1=vif.cb_mon_in.inp1;
      tx.inp2=vif.cb_mon_in.inp2;
      tx.op_code=vif.cb_mon_in.op_code;
      mon_ap.write(tx);
    end
  endtask
  
endclass