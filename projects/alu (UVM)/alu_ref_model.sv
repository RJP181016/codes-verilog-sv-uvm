class alu_ref_model extends uvm_subscriber#(alu_tx);
  `uvm_component_utils(alu_ref_model)
  `NEW_COMP
  
  uvm_analysis_port#(alu_tx) ref_out_port;
  
  bit [31:0] prev_out;
  int tx_drop_count;

  function void build_phase(uvm_phase phase);
    ref_out_port=new("ref_out_port",this);
  endfunction

  function void write( T t);
	alu_tx tx;
    $cast(tx,t.clone());
	
    tx.alu_out = alu_dpi_model(tx.inp1,tx.inp2,tx.op_code);

    if (prev_out == tx.alu_out) begin
      `uvm_warning("tx_drop","Previous output matches with currnet output");
      tx_drop_count++;
    end
	else begin
      ref_out_port.write(tx);
	end
    prev_out=tx.alu_out;
  endfunction
  
  function void report_phase(uvm_phase phase);
    uvm_config_db#(int)::set(null,"uvm_test_top.env*","tx_drop_count",tx_drop_count);
  endfunction
  
endclass