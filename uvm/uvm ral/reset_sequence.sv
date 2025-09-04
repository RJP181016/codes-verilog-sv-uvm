class reset_sequence extends base_sequence;

`uvm_object_utils(reset_sequence)

function new (string name="reset_sequence");
	super.new(name);
endfunction

extern virtual task body();
endclass

task reset_sequence::body();
     begin
      `uvm_create(req);
      req.mode=RESET;
      req.addr ='b0;
      req.data ='b0;
      start_item(req);
      finish_item(req);
	`uvm_info("RST_SEQ","Reset Transaction Done",UVM_MEDIUM);
     end
endtask

