class alu_sagent extends uvm_agent;
  `uvm_component_utils(alu_sagent);
  `NEW_COMP
  
  alu_oMon oMon;
  uvm_analysis_port#(alu_tx) ap;
  uvm_active_passive_enum agent_type;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    ap=new("ap",this);
    uvm_config_db#(uvm_active_passive_enum)::get(this,"*","agent_type",agent_type);
    if(agent_type==UVM_ACTIVE) begin
    end
    oMon=alu_oMon::type_id::create("oMon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    if(agent_type==UVM_ACTIVE) begin
    end
    oMon.mon_ap.connect(this.ap);
  endfunction
endclass