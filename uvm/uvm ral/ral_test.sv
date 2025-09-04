class ral_test extends base_test;
`uvm_component_utils(ral_test)

reg_model_block regmodel;
reg2bus_adapter adapter;

	function new (string name="ral_test",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	extern virtual function void build_phase(uvm_phase phase);
	extern virtual function void connect_phase(uvm_phase phase);
	extern virtual function void end_of_elaboration_phase(uvm_phase phase);
	extern virtual task shutdown_phase(uvm_phase phase);
endclass	

function void ral_test::build_phase(uvm_phase phase);
	super.build_phase(phase);
        regmodel=reg_model_block::type_id::create("regmodel",this);
	regmodel.build();
	regmodel.lock_model();
	adapter=reg2bus_adapter::type_id::create("adapter",this);
	/*Once locked, no further structural changes, 
	such as adding registers or memories, can be made.
	It is not possible to unlock a model.
	*/
        uvm_config_db#(reg_model_block)::set(this,"env.m_agent.seqr","regmodel",regmodel);
	uvm_config_db#(int)::set(this,"env.m_agent.seqr.*", "item_count", 10);
	uvm_config_db#(uvm_object_wrapper)::set(this,"env.m_agent.seqr.reset_phase","default_sequence",reset_sequence::get_type());
	uvm_config_db#(uvm_object_wrapper)::set(this,"env.m_agent.seqr.configure_phase","default_sequence",ral_sequence::get_type());
	uvm_config_db#(uvm_object_wrapper)::set(this,"env.m_agent.seqr.main_phase","default_sequence",rw_sequence::get_type());
endfunction


task ral_test::shutdown_phase(uvm_phase phase);
    	uvm_reg_data_t rdata;
	uvm_status_e status;
    phase.raise_objection(this,"Raised objection from shutdown phase of ral_test");
    `uvm_info("REG_COUNT","Shutdown phase of ral_test",UVM_MEDIUM)
    regmodel.csr1_wr_count_reg.read(status,rdata);
    `uvm_info("REG_COUNT",$sformatf("Write wr_count=%0d rd_count=%0d from register csr1_wr_count from DUT",rdata[7:0],rdata[15:8]),UVM_MEDIUM)
    phase.drop_objection(this,"Dropped objection from shutdown phase of ral_test");
endtask

function void ral_test::connect_phase(uvm_phase phase);
    regmodel.default_map.set_sequencer(this.env.m_agent.seqr,adapter);
    regmodel.default_map.set_auto_predict(1);
endfunction

function void ral_test::end_of_elaboration_phase(uvm_phase phase);
    regmodel.print();
endfunction

