class alu_sbd extends uvm_scoreboard;
  `uvm_component_utils(alu_sbd)
  `NEW_COMP
  
  uvm_analysis_port #(alu_tx) mon_in;
  uvm_analysis_port #(alu_tx) mon_out;
  uvm_in_order_class_comparator #(alu_tx) m_comp;
  alu_ref_model alu_ref;
  int tx_drop_count;
  
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    alu_ref=alu_ref_model::type_id::create("alu_ref",this);
    m_comp=uvm_in_order_class_comparator#(alu_tx)::type_id::create("m_comp",this);
	mon_in=new("mon_in",this);
	mon_out=new("mon_out",this);
  endfunction

  function void connect_phase(uvm_phase phase);
	super.connect_phase(phase);
    mon_in.connect(alu_ref.analysis_export);
    alu_ref.ref_out_port.connect(m_comp.before_export);
	mon_out.connect(m_comp.after_export);
  endfunction

  function void report_phase(uvm_phase phase);
    uvm_config_db#(int)::get(this,"","tx_drop_count",tx_drop_count);
    `uvm_info(get_type_name(),$sformatf("Scoreboard completed with matches=%0d mismatches=%0d ",m_comp.m_matches,m_comp.m_mismatches),UVM_NONE);
    
    if(m_comp.m_mismatches) begin
      `uvm_info(get_type_name(),"********************************************",UVM_NONE);
	  `uvm_error(get_type_name(),"Test FAILED ");
      `uvm_info(get_type_name(),$sformatf("pkts_mactched=%0d pkts_mismatched=%0d tx_drop_count=%0d",m_comp.m_matches,m_comp.m_mismatches,tx_drop_count),UVM_NONE);
      `uvm_info(get_type_name(),"*****************************************",UVM_NONE);
    end 
    else begin 
      `uvm_info(get_type_name(),"**************************************",UVM_NONE);
      `uvm_info("PASSED","Test PASSED",UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("pkts_mactched=%0d pkts_mismatched=%0d tx_drop_count=%0d",m_comp.m_matches,m_comp.m_mismatches,tx_drop_count),UVM_NONE);
      `uvm_info(get_type_name(),"*************************************",UVM_NONE);
    end
  endfunction 
    
endclass