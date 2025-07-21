class fifo_sbd extends uvm_scoreboard;
  `uvm_component_utils(fifo_sbd)
  `NEW_COMP
  
  `uvm_analysis_imp_decl(_in)
  `uvm_analysis_imp_decl(_out)
  uvm_analysis_imp_in#(write_tx,fifo_sbd) mon_in;
  uvm_analysis_imp_out#(read_tx,fifo_sbd) mon_out;
  
  write_tx wt_txQ[$];
  read_tx rd_txQ[$];
  bit [`DATA_WIDTH-1:0] wdataQ[$];
  bit [`DATA_WIDTH-1:0] rdataQ[$];
  write_tx wt_tx;
  read_tx rd_tx;
  bit [`DATA_WIDTH-1:0] wdata;
  bit [`DATA_WIDTH-1:0] rdata;
  int m_matches,m_mismatches,m_full,m_empty,m_overflow,m_underflow;
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    mon_in=new("mon_in",this);
    mon_out=new("mon_out",this);
  endfunction
  
  function void write_in(write_tx tx);
    write_tx tx_in;
    $cast(tx_in,tx.clone);
    wt_txQ.push_back(tx_in);
    if(!tx_in.overflow) begin wdataQ.push_back(tx_in.wdata);
    end
  endfunction
  
  function void write_out(read_tx tx);
    read_tx tx_in;
    $cast(tx_in,tx.clone);
    rd_txQ.push_back(tx_in);
    if(!tx_in.underflow) begin rdataQ.push_back(tx_in.rdata);
    end
  endfunction
  
  task run_phase(uvm_phase phase);
    fork
    forever begin
      wait(wdataQ.size()>0 && rdataQ.size()>0);
      wdata=wdataQ.pop_front();
      rdata=rdataQ.pop_front();
        if(wdata == rdata) begin
          m_matches++;
          `uvm_info(get_type_name(),$sformatf("data matched, write_data=%0h, read_data=%0h, matches=%0d",wdata,rdata,m_matches),UVM_HIGH);     
        end
        else begin 
          m_mismatches++;
          `uvm_error(get_type_name(),$sformatf("data mismatched, write_data=%0h, read_data=%0h, mismatches=%0d",wdata,rdata,m_mismatches));
        end
    end
    forever begin
      wait(wt_txQ.size()>0);
      wt_tx=wt_txQ.pop_front();
      if(wt_tx.full) m_full++;
      if(wt_tx.overflow) m_overflow++;
    end
    forever begin
      wait(rd_txQ.size()>0);
      rd_tx=rd_txQ.pop_front();
      if(rd_tx.empty) m_empty++;
      if(rd_tx.underflow) m_underflow++;
    end
    join
  endtask
  
  function void report_phase(uvm_phase phase);
    if(m_mismatches) begin
      `uvm_info(get_type_name(),"********************************************",UVM_NONE);
	  `uvm_error(get_type_name(),"Test FAILED ");
      `uvm_info(get_type_name(),$sformatf("txs_mactched=%0d txs_mismatched=%0d",m_matches,m_mismatches),UVM_NONE);
      `uvm_info(get_type_name(),"*****************************************",UVM_NONE);
    end 
    else begin 
      `uvm_info(get_type_name(),"**************************************",UVM_NONE);
      `uvm_info("PASSED","Test PASSED",UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("txs_mactched=%0d txs_mismatched=%0d",m_matches,m_mismatches),UVM_NONE);
      `uvm_info(get_type_name(),"*************************************",UVM_NONE);
    end
    if(m_full) begin 
      `uvm_info(get_type_name(),"**************************************",UVM_NONE);
      `uvm_info("PASSED","Full Test PASSED",UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("num_fulls=%0d",m_full),UVM_NONE);
      `uvm_info(get_type_name(),"*************************************",UVM_NONE);
    end
    if(m_empty) begin 
      `uvm_info(get_type_name(),"**************************************",UVM_NONE);
      `uvm_info("PASSED","Empty Test PASSED",UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("num_emptys=%0d",m_empty),UVM_NONE);
      `uvm_info(get_type_name(),"*************************************",UVM_NONE);
    end
    if(m_overflow) begin 
      `uvm_info(get_type_name(),"**************************************",UVM_NONE);
      `uvm_info("PASSED","Overflow Test PASSED",UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("num_overflows=%0d",m_overflow),UVM_NONE);
      `uvm_info(get_type_name(),"*************************************",UVM_NONE);
    end
    if(m_underflow) begin 
      `uvm_info(get_type_name(),"**************************************",UVM_NONE);
      `uvm_info("PASSED","Underflow Test PASSED",UVM_NONE);
      `uvm_info(get_type_name(),$sformatf("num_underflows=%0d",m_underflow),UVM_NONE);
      `uvm_info(get_type_name(),"*************************************",UVM_NONE);
    end   
  endfunction
endclass