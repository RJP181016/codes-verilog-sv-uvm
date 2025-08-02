class alu_base_test extends uvm_test;
  `uvm_component_utils(alu_base_test)
  `NEW_COMP
  alu_env env;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    env=alu_env::type_id::create("env",this);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"env.magent*","agent_type",UVM_ACTIVE);
    uvm_config_db#(uvm_active_passive_enum)::set(this,"env.sagent*","agent_type",UVM_PASSIVE);
    uvm_resource_db#(int)::set("ALL","tx_count",1000,this);
    //uvm_config_db#(uvm_object_wrapper)::set(this,"env.magent.sqr.main_phase","default_sequence",alu_seq::get_type());
  endfunction
  
  function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
  endfunction
  
  task run_phase(uvm_phase phase);
    alu_seq seq;
    seq=alu_seq::type_id::create("seq",this);
    phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,100);
    seq.start(env.magent.sqr);
    phase.drop_objection(this);
  endtask
  
endclass