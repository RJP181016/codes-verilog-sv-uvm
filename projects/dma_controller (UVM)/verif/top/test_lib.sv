class dma_base_test extends uvm_test;
`uvm_component_utils(dma_base_test)
`NEW_COMP
dma_env env;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	env=dma_env::type_id::create("env",this);
endfunction

function void end_of_elaboration_phase(uvm_phase phase);
  super.end_of_elaboration_phase(phase);
  uvm_top.print_topology();
endfunction
endclass


//reg read test
class dma_reg_rd_test extends dma_base_test;
`uvm_component_utils(dma_reg_rd_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	dma_reg_rd_seq reg_rd_seq = dma_reg_rd_seq::type_id::create("reg_rd_seq");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,100);
	reg_rd_seq.start(env.apb_agent_i.sqr);
	phase.drop_objection(this);
endtask
endclass


//reg write read test
class dma_reg_wr_rd_test extends dma_base_test;
`uvm_component_utils(dma_reg_wr_rd_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	dma_reg_wr_rd_seq reg_wr_rd_seq = dma_reg_wr_rd_seq::type_id::create("reg_wr_rd_seq");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,100);
	reg_wr_rd_seq.start(env.apb_agent_i.sqr);
	phase.drop_objection(this);
endtask
endclass


//command test
class dma_command_test extends dma_base_test;
`uvm_component_utils(dma_command_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	dma_config_start_ch_cmd_seq config_start_ch_cmd_seq = dma_config_start_ch_cmd_seq::type_id::create("config_start_ch_cmd_seq");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,1000);//TODO
	config_start_ch_cmd_seq.start(env.apb_agent_i.sqr);
	phase.drop_objection(this);
endtask
endclass


//command all channel test
class dma_command_all_ch_test extends dma_base_test;
`uvm_component_utils(dma_command_all_ch_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_reg::include_coverage("*",UVM_CVR_ALL,this);
endfunction

task run_phase(uvm_phase phase);
	dma_config_start_all_ch_cmd_seq config_start_all_ch_cmd_seq = dma_config_start_all_ch_cmd_seq::type_id::create("config_start_all_ch_cmd_seq");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,10000);//TODO
	config_start_all_ch_cmd_seq.start(env.apb_agent_i.sqr);
	phase.drop_objection(this);
endtask
endclass


//command list test
class dma_command_list_test extends dma_base_test;
`uvm_component_utils(dma_command_list_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
endfunction

task run_phase(uvm_phase phase);
	dma_config_start_ch_cmd_list_seq config_start_ch_cmd_list_seq = dma_config_start_ch_cmd_list_seq::type_id::create("config_start_ch_cmd_list_seq");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,2500);//TODO
	config_start_ch_cmd_list_seq.start(env.apb_agent_i.sqr);
	phase.drop_objection(this);
endtask
endclass


//scatter gather test
class dma_scatter_gather_test extends dma_base_test;
`uvm_component_utils(dma_scatter_gather_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_resource_db#(bit)::set("GLOBAL","scatter",1,this);
endfunction

task run_phase(uvm_phase phase);
	dma_config_start_ch_cmd_list_seq config_start_ch_cmd_list_seq = dma_config_start_ch_cmd_list_seq::type_id::create("config_start_ch_cmd_list_seq");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,2500);//TODO
	config_start_ch_cmd_list_seq.start(env.apb_agent_i.sqr);
	phase.drop_objection(this);
endtask
endclass


//peripheral transfer test
class dma_periph_transfer_test extends dma_base_test;
`uvm_component_utils(dma_periph_transfer_test)
`NEW_COMP

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_reg::include_coverage("*",UVM_CVR_ALL,this);
endfunction

task run_phase(uvm_phase phase);
	dma_periph_transfer_seq periph_transfer_seq = dma_periph_transfer_seq::type_id::create("periph_transfer_seq");
	phase.raise_objection(this);
	phase.phase_done.set_drain_time(this,10000);//TODO
	periph_transfer_seq.start(env.apb_agent_i.sqr);
	phase.drop_objection(this);
endtask
endclass
