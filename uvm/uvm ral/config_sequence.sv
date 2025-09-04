class config_sequence extends base_sequence;

`uvm_object_utils(config_sequence)

function new (string name="config_sequence");
	super.new(name);
endfunction

extern virtual task body();
endclass

task config_sequence::body();
      `uvm_create(req);
      req.addr='h20;
      req.data='h1;
      req.mode=CONFIG;
      start_item(req);
      finish_item(req);
	`uvm_info("CONFIG_SEQ","Config sequence Transaction Done ",UVM_MEDIUM);
endtask

