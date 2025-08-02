class alu_sbd#(type T=alu_tx) extends uvm_scoreboard;
  `uvm_component_param_utils(alu_sbd#(T))
  `NEW_COMP
  
  const static string type_name = $sformatf("custom_scoreboard#(%0s)",$typename(T));
  
  virtual function string get_type_name();
  return type_name;
  endfunction
  
  `uvm_analysis_imp_decl(_in)
  `uvm_analysis_imp_decl(_out)

  uvm_analysis_imp_in #(T,alu_sbd) mon_in;
  uvm_analysis_imp_out #(T,alu_sbd) mon_out;
  
  int tx_drop_count;
  int m_matches,m_mismatches;
  int tot_tx_recvd;
  real total_coverage;
  T q_in[$];
  
  function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    mon_in=new("mon_in",this);
    mon_out=new("mon_out",this);
  endfunction

  virtual function void write_in(T tx);
    T tx_in;
    $cast(tx_in,tx.clone());
    q_in.push_back(tx_in);
  endfunction

  virtual function void write_out(T recvd_tx);
    T ref_tx;
    int index[$];
    int x;
    
    index=q_in.find_index() with (item.inp1==recvd_tx.inp1 && item.inp2==recvd_tx.inp2 && item.op_code==recvd_tx.op_code);
    x=index.pop_back();
    ref_tx=q_in[x];
    
    tot_tx_recvd++;
    if(ref_tx.compare(recvd_tx)) begin
      m_matches++;
      q_in.delete(x);
      `uvm_info("SCB",$sformatf("tx %0d matched ",tot_tx_recvd),UVM_FULL);
    end
    else begin
      m_mismatches++;
      `uvm_error("SCB",$sformatf("tx %0d mis_matched expected=%0s received=%0s",tot_tx_recvd,ref_tx.convert2string(),recvd_tx.convert2string()));
    end
  endfunction
  
  function void extract_phase(uvm_phase phase);
    uvm_config_db#(real)::get(this,"","cov_score",total_coverage);
  endfunction

  function void report_phase(uvm_phase phase);
    uvm_config_db#(int)::get(this,"","tx_drop_count",tx_drop_count);
    `uvm_info(get_type_name(),$sformatf("Scoreboard completed with matches=%0d mismatches=%0d ",m_matches,m_mismatches),UVM_NONE);
    if(m_mismatches) begin
      `uvm_info(get_type_name(),"********************************************",UVM_NONE);
	  `uvm_error(get_type_name(),"Test FAILED ");
      `uvm_info(get_type_name(),$sformatf("txs_mactched=%0d txs_mismatched=%0d tx_drop_count=%0d",m_matches,m_mismatches,tx_drop_count),UVM_NONE);
      `uvm_info(get_type_name(),"*****************************************",UVM_NONE);
    end 
    else begin 
      `uvm_info(get_type_name(),"**************************************",UVM_NONE);
      `uvm_info("PASSED","Test PASSED",UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("txs_mactched=%0d txs_mismatched=%0d tx_drop_count=%0d",m_matches,m_mismatches,tx_drop_count),UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("Coverage=%0f%%",total_coverage),UVM_NONE); 
      `uvm_info(get_type_name(),"*************************************",UVM_NONE);
    end
  endfunction 
    
endclass

