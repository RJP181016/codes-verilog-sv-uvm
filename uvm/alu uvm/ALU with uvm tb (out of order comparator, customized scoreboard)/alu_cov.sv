class alu_cov extends uvm_subscriber#(alu_tx);
  `uvm_component_utils(alu_cov)
  
  real coverage_score;
  alu_tx tx;
  
  covergroup alu_cg;
    cp_op_code: coverpoint tx.op_code {
      bins add={2'b00};
      bins sub={2'b01};
      bins mul={2'b10};
      bins div={2'b11};
    }
    cp_inp1: coverpoint tx.inp1 {
      bins all_zeros={8'h00};
      bins all_ones={8'hff};
    }
    cp_inp2: coverpoint tx.inp2 {
      bins all_zeros={8'h00};
      bins all_ones={8'hff};
    }
      cp_cross1: cross cp_op_code,cp_inp1;
    cp_cross2: cross cp_op_code,cp_inp2{
      ignore_bins div_by_zero = binsof(cp_op_code) intersect {2'b11} &&
      							binsof(cp_inp2) intersect {8'h00};
    }
  endgroup
  
  function new(string name="",uvm_component parent=null);
    super.new(name,parent);
    alu_cg=new;
  endfunction
  
  virtual function void write(alu_tx t);
    $cast(tx,t.clone);
    alu_cg.sample();
    coverage_score=alu_cg.get_coverage();
  endfunction
  
  virtual function void extract_phase(uvm_phase phase);
    uvm_config_db#(real)::set(null,"uvm_test_top.env.sbd","cov_score",coverage_score);
  endfunction
  
endclass