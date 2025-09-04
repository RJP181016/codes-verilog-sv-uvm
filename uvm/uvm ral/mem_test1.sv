class mem_test1 extends base_test;
`uvm_component_utils(mem_test1)

	function new (string name="mem_test1",uvm_component parent=null);
		super.new(name,parent);
	endfunction

	extern virtual function void build_phase(uvm_phase phase);
endclass	

function void mem_test1::build_phase(uvm_phase phase);
	super.build_phase(phase);

	uvm_config_db#(int)::set(this,"env.m_agent.seqr.*", "item_count", 30);
	uvm_config_db#(uvm_object_wrapper)::set(this,"env.m_agent.seqr.reset_phase","default_sequence",reset_sequence::get_type());
	uvm_config_db#(uvm_object_wrapper)::set(this,"env.m_agent.seqr.configure_phase","default_sequence",config_sequence::get_type());
	uvm_config_db#(uvm_object_wrapper)::set(this,"env.m_agent.seqr.main_phase","default_sequence",rw_sequence::get_type());
endfunction
