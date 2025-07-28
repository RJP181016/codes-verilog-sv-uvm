class apb_tx extends uvm_sequence_item;
rand bit [`ADDR_WIDTH-1:0] addr;
rand bit [`WIDTH-1:0] data;
rand bit wt_rd;
`uvm_object_utils_begin(apb_tx)
	`uvm_field_int(addr, UVM_ALL_ON)
	`uvm_field_int(data, UVM_ALL_ON)
	`uvm_field_int(wt_rd, UVM_ALL_ON)
`uvm_object_utils_end

function new(string name="");
	super.new(name);
endfunction
endclass
