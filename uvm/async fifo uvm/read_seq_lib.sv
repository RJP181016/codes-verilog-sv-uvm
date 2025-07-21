class read_base_seq extends uvm_sequence#(read_tx);
`uvm_object_utils(read_base_seq)
`NEW_OBJ

task pre_body();
 if(starting_phase != null) begin
 	 starting_phase.raise_objection(this);
	 starting_phase.phase_done.set_drain_time(this,100);
 end
endtask

task post_body();
 if(starting_phase != null)begin
    starting_phase.drop_objection(this);
 end
endtask
endclass

class read_all_seq extends read_base_seq;
  `uvm_object_utils(read_all_seq)
`NEW_OBJ

task body();
  repeat(`DEPTH) begin
		`uvm_do(req);
	end
endtask
endclass

class read_n_seq extends read_base_seq;
  `uvm_object_utils(read_n_seq)
`NEW_OBJ

task body();
  repeat(`NUM_READS) begin
		`uvm_do(req);
	end
endtask
endclass

class read_seq extends read_base_seq;
`uvm_object_utils(read_seq)
`NEW_OBJ

task body();
  `uvm_do(req);
endtask
endclass