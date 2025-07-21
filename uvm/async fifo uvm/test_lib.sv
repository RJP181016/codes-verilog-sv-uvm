class fifo_base_test extends uvm_test;
`uvm_component_utils(fifo_base_test)
`NEW_COMP
fifo_env env;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env=fifo_env::type_id::create("env",this);
	uvm_config_db#(uvm_active_passive_enum)::set(this,"env.wagent*","agent_type",UVM_ACTIVE);
	uvm_config_db#(uvm_active_passive_enum)::set(this,"env.ragent*","agent_type",UVM_ACTIVE);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
	super.end_of_elaboration_phase(phase);
	uvm_top.print_topology();
endfunction
endclass

//write_n_test
class write_n_test extends fifo_base_test;
  `uvm_component_utils(write_n_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::set(this,"env.wagent.cov","wt_cov_en",1);
  uvm_config_db#(bit)::set(this,"env.ragent.cov","rd_cov_en",0);
endfunction

task run_phase(uvm_phase phase);
	write_n_seq seq;
	seq=write_n_seq::type_id::create("seq",this);
  
	phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,20);
    seq.start(env.wagent.sqr);
	phase.drop_objection(this);
endtask
endclass

//read_n_test
class read_n_test extends fifo_base_test;
  `uvm_component_utils(read_n_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::set(this,"env.wagent.cov","wt_cov_en",0);
  uvm_config_db#(bit)::set(this,"env.ragent.cov","rd_cov_en",1);
endfunction

task run_phase(uvm_phase phase);
	write_n_seq wt_seq;
    read_n_seq rd_seq;
    wt_seq=write_n_seq::type_id::create("wt_seq",this);
    rd_seq=read_n_seq::type_id::create("rd_seq",this);
  
	phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,100);
    wt_seq.start(env.wagent.sqr);
    rd_seq.start(env.ragent.sqr);
	phase.drop_objection(this);
endtask
endclass

//full_test
class full_test extends fifo_base_test;
  `uvm_component_utils(full_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::set(this,"env.wagent.cov","wt_cov_en",1);
  uvm_config_db#(bit)::set(this,"env.ragent.cov","rd_cov_en",0);
endfunction

task run_phase(uvm_phase phase);
    write_all_seq wt_all_seq;
    wt_all_seq=write_all_seq::type_id::create("wt_all_seq",this);

	phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,100);
    wt_all_seq.start(env.wagent.sqr);
	phase.drop_objection(this);
endtask
endclass

//empty_test
class empty_test extends fifo_base_test;
  `uvm_component_utils(empty_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::set(this,"env.wagent.cov","wt_cov_en",1);
  uvm_config_db#(bit)::set(this,"env.ragent.cov","rd_cov_en",1);
endfunction

task run_phase(uvm_phase phase);
    write_all_seq wt_all_seq;
    read_all_seq rd_all_seq;
    wt_all_seq=write_all_seq::type_id::create("wt_all_seq",this);
    rd_all_seq=read_all_seq::type_id::create("rd_all_seq",this);
  
	phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,100);
    wt_all_seq.start(env.wagent.sqr);
    rd_all_seq.start(env.ragent.sqr);
	phase.drop_objection(this);
endtask
endclass

//overflow_test
class overflow_test extends fifo_base_test;
  `uvm_component_utils(overflow_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::set(this,"env.wagent.cov","wt_cov_en",1);
  uvm_config_db#(bit)::set(this,"env.ragent.cov","rd_cov_en",0);
endfunction

task run_phase(uvm_phase phase);
    write_all_seq wt_all_seq;
    write_seq seq;
    wt_all_seq=write_all_seq::type_id::create("wt_all_seq",this);
	seq=write_seq::type_id::create("seq",this);
  
	phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,100);
    wt_all_seq.start(env.wagent.sqr);
    seq.start(env.wagent.sqr);
	phase.drop_objection(this);
endtask
endclass

//underflow_test
class underflow_test extends fifo_base_test;
  `uvm_component_utils(underflow_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::set(this,"env.wagent.cov","wt_cov_en",1);
  uvm_config_db#(bit)::set(this,"env.ragent.cov","rd_cov_en",1);
endfunction

task run_phase(uvm_phase phase);
    write_all_seq wt_all_seq;
    read_all_seq rd_all_seq;
    read_seq seq;
    wt_all_seq=write_all_seq::type_id::create("wt_all_seq",this);
    rd_all_seq=read_all_seq::type_id::create("rd_all_seq",this);
	seq=read_seq::type_id::create("seq",this);
  
	phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,100);
    wt_all_seq.start(env.wagent.sqr);
    rd_all_seq.start(env.ragent.sqr);
    seq.start(env.ragent.sqr);
	phase.drop_objection(this);
endtask
endclass

//coverage_test
class coverage_test extends fifo_base_test;
  `uvm_component_utils(coverage_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::set(this,"env.wagent.cov","wt_cov_en",1);
  uvm_config_db#(bit)::set(this,"env.ragent.cov","rd_cov_en",1);
endfunction

task run_phase(uvm_phase phase);
    write_n_seq wt_seq;
    read_n_seq rd_seq;
    wt_seq=write_n_seq::type_id::create("wt_seq",this);
    rd_seq=read_n_seq::type_id::create("rd_seq",this);
  
	phase.raise_objection(this);
    phase.phase_done.set_drain_time(this,100);
    wt_seq.start(env.wagent.sqr);
    rd_seq.start(env.ragent.sqr);
	phase.drop_objection(this);
endtask
endclass

