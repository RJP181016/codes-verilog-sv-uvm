class dma_env extends uvm_env;
`uvm_component_utils(dma_env)
`NEW_COMP
apb_agent apb_agent_i;
axi_agent axi_agent_i;
dma_sbd sbd;

dma_ctrl_reg_block reg_block;
dma_ctrl_reg_adapter reg_adapter;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	apb_agent_i=apb_agent::type_id::create("apb_agent_i",this);
	axi_agent_i=axi_agent::type_id::create("axi_agent_i",this);
	sbd=dma_sbd::type_id::create("sbd",this);
	reg_adapter=dma_ctrl_reg_adapter::type_id::create("reg_adapter",this);
	reg_block=dma_ctrl_reg_block::type_id::create("reg_block",this);
	reg_block.build();
	uvm_resource_db#(dma_ctrl_reg_block)::set("GLOBAL", "DMA_RM", reg_block, this);
endfunction

function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
	reg_block.apb_map.set_sequencer(apb_agent_i.sqr, reg_adapter);
	apb_agent_i.mon.ap_port.connect(sbd.imp_apb);
	axi_agent_i.mon.ap_port.connect(sbd.imp_axi);
endfunction
endclass
