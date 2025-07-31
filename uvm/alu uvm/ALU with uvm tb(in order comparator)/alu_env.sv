class alu_env extends uvm_env;
  `uvm_component_utils(alu_env);
  `NEW_COMP
  alu_magent magent;
  alu_sagent sagent;
  alu_sbd sbd;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    magent=alu_magent::type_id::create("magent",this);
    sagent=alu_sagent::type_id::create("sagent",this);
    sbd=alu_sbd::type_id::create("sbd",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    magent.ap.connect(sbd.mon_in);
    sagent.ap.connect(sbd.mon_out);
  endfunction
  
endclass