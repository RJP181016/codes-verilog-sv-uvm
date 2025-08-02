class alu_magent extends uvm_agent;
  `uvm_component_utils(alu_magent);
  `NEW_COMP
  
  alu_sqr sqr;
  alu_drv drv;
  alu_iMon iMon;
  uvm_analysis_port#(alu_tx) ap;
  uvm_active_passive_enum agent_type;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap=new("ap",this);
    uvm_config_db#(uvm_active_passive_enum)::get(this,"*","agent_type",agent_type);
    if(agent_type==UVM_ACTIVE) begin
      sqr=alu_sqr::type_id::create("sqr",this);
      drv=alu_drv::type_id::create("drv",this);
    end
    iMon=alu_iMon::type_id::create("iMon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(agent_type==UVM_ACTIVE) begin
      drv.seq_item_port.connect(sqr.seq_item_export);
    end
    iMon.mon_ap.connect(this.ap);
  endfunction
endclass