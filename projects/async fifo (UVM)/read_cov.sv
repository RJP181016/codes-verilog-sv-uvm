class read_cov extends uvm_subscriber#(read_tx);
`uvm_component_utils(read_cov)
  read_tx tx;
real total_coverage;
bit rd_cov_en;
  
  covergroup read_cg;
    rd_en_cp: coverpoint tx.rd_en {
      bins read_enable = {1};
    }
    empty_cp: coverpoint tx.empty {
      bins empty = {1};
      bins not_empty = {0};
    }
    underflow_cp: coverpoint tx.underflow {
      bins underflow = {1};
      bins not_underflow = {0};
    }
  endgroup
    
function new(string name = "", uvm_component parent = null);
	super.new(name,parent);
  read_cg=new();
endfunction 

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  uvm_config_db#(bit)::get(this,"","rd_cov_en",rd_cov_en);
endfunction

function void write(T t);
  $cast(tx,t.clone);
  if(rd_cov_en) begin
  	read_cg.sample();
  	total_coverage=read_cg.get_coverage();
  end
endfunction
  
  function void report_phase(uvm_phase phase);
    if(rd_cov_en) `uvm_info(get_type_name(),$sformatf("********************total_read_coverage=%0f**********************",total_coverage),UVM_NONE);
  endfunction
endclass

