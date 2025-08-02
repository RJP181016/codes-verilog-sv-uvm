class alu_env extends uvm_env;
  `uvm_component_utils(alu_env);
  `NEW_COMP
  alu_magent magent;
  alu_sagent sagent;
  alu_sbd sbd;
  alu_cov cov;
  alu_ref_model alu_ref;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    magent=alu_magent::type_id::create("magent",this);
    sagent=alu_sagent::type_id::create("sagent",this);
    sbd=alu_sbd#(alu_tx)::type_id::create("sbd",this);
    cov=alu_cov::type_id::create("cov",this);
    alu_ref=alu_ref_model::type_id::create("alu_ref",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    magent.ap.connect(alu_ref.analysis_export);
    alu_ref.ref_out_port.connect(sbd.mon_in);
    sagent.ap.connect(sbd.mon_out);
    magent.ap.connect(cov.analysis_export);
  endfunction
  
endclass