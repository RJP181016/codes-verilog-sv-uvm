class write_cov extends uvm_subscriber#(write_tx);
`uvm_component_utils(write_cov)
  write_tx tx;
real total_coverage;
  bit wt_cov_en;
  
  covergroup write_cg;
    wt_en_cp: coverpoint tx.wt_en {
      bins write_enable = {1};
    }
    wdata_cp: coverpoint tx.wdata {
      bins write_data[] = {[0:2**`DATA_WIDTH-1]};
    }
    full_cp: coverpoint tx.full {
      bins full = {1};
      bins not_full = {0};
    }
    overflow_cp: coverpoint tx.overflow {
      bins overflow = {1};
      bins not_overflow = {0};
    }
    cross wt_en_cp,wdata_cp;
  endgroup
    
function new(string name = "", uvm_component parent = null);
	super.new(name,parent);
  write_cg=new();
endfunction 

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::get(this,"","wt_cov_en",wt_cov_en);
endfunction

function void write(T t);
  $cast(tx,t.clone);
  if(wt_cov_en) begin
  	write_cg.sample();
  	total_coverage=write_cg.get_coverage();
  end
endfunction
  
  function void report_phase(uvm_phase phase);
    if(wt_cov_en) `uvm_info(get_type_name(),$sformatf("********************total_write_coverage=%0f**********************",total_coverage),UVM_NONE);
  endfunction

endclass
