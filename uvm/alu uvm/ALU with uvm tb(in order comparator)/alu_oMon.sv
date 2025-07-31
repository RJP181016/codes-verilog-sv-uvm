class alu_oMon extends uvm_monitor;
  `uvm_component_utils(alu_oMon)
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
      @(vif.cb_mon_out.outp);
      if(vif.cb_mon_out.outp === 'z || vif.cb_mon_out.outp === 'x) continue;
      if(vif.reset==1) continue;
      tx.alu_out=vif.cb_mon_out.outp;
      mon_ap.write(tx);
    end
  endtask
  
endclass