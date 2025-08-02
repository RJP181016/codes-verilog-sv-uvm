class alu_base_seq extends uvm_sequence#(alu_tx);
  `uvm_object_utils(alu_base_seq)
  `NEW_OBJ
  
  uvm_phase phase;
  //raise objection
task pre_body();
	phase= get_starting_phase();
	if(phase!=null) begin
		phase.raise_objection(this);
		phase.phase_done.set_drain_time(this,100);
	end
endtask

//drop objection
task post_body();
	if(phase!=null) begin
		phase.drop_objection(this);
	end
endtask
endclass

class add_seq extends alu_base_seq;
  `uvm_object_utils(add_seq)
  `NEW_OBJ
  alu_tx tx;
  int tx_count;
  
  task body();
    uvm_resource_db#(int)::read_by_name("ALL","tx_count",tx_count,this);
    //`uvm_do_with(req,{req.reset==1;})
    repeat(tx_count) begin
      `uvm_do_with(req,{req.reset==0;req.op_code==2'b00;})
    end
    `uvm_do_with(req,{req.reset==0;req.op_code==2'b00;req.inp2==8'hff;}) 
  endtask
endclass

class sub_seq extends alu_base_seq;
  `uvm_object_utils(sub_seq)
  `NEW_OBJ
  alu_tx tx;
  int tx_count;
  
  task body();
    uvm_resource_db#(int)::read_by_name("ALL","tx_count",tx_count,this);
    //`uvm_do_with(req,{req.reset==1;})
    repeat(tx_count) begin
      `uvm_do_with(req,{req.reset==0;req.op_code==2'b01;})
    end
  endtask
endclass

class mul_seq extends alu_base_seq;
  `uvm_object_utils(mul_seq)
  `NEW_OBJ
  alu_tx tx;
  int tx_count;
  
  task body();
    uvm_resource_db#(int)::read_by_name("ALL","tx_count",tx_count,this);
    //`uvm_do_with(req,{req.reset==1;})
    repeat(tx_count) begin
      `uvm_do_with(req,{req.reset==0;req.op_code==2'b10;})
    end
  endtask
endclass

class div_seq extends alu_base_seq;
  `uvm_object_utils(div_seq)
  `NEW_OBJ
  alu_tx tx;
  int tx_count;
  
  task body();
    uvm_resource_db#(int)::read_by_name("ALL","tx_count",tx_count,this);
    //`uvm_do_with(req,{req.reset==1;})
    repeat(tx_count) begin
      `uvm_do_with(req,{req.reset==0;req.op_code==2'b11;})
    end
  endtask
endclass


class alu_seq extends alu_base_seq;
  `uvm_object_utils(alu_seq)
  `NEW_OBJ
  alu_tx tx;
  add_seq add;
  sub_seq sub;
  mul_seq mul;
  div_seq div;
  
  task body();
    `uvm_do_with(req,{req.reset==1;})
    fork
    `uvm_do(add)
    `uvm_do(sub)
    `uvm_do(mul)
    `uvm_do(div)
    join
  endtask
endclass