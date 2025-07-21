class write_base_seq extends uvm_sequence#(write_tx);
`uvm_object_utils(write_base_seq)
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


class write_all_seq extends write_base_seq;
  `uvm_object_utils(write_all_seq)
`NEW_OBJ
task body();
  repeat(`DEPTH) begin
		`uvm_do(req);
	end
endtask
endclass
  

class write_n_seq extends write_base_seq;
  `uvm_object_utils(write_n_seq)
`NEW_OBJ
task body();
  repeat(`NUM_WRITES) begin
		`uvm_do(req);
	end
endtask
endclass


class write_seq extends write_base_seq;
`uvm_object_utils(write_seq)
`NEW_OBJ
task body();
		`uvm_do(req);
endtask
endclass