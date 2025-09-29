class apb_tx extends uvm_sequence_item;
rand bit [31:0] addr;
rand bit [31:0] data;
rand bit wr_rd;

rand bit periph_transfer_f;
rand bit [31:0] periph_tx_req;
rand bit [31:0] periph_rx_req;

`uvm_object_utils_begin(apb_tx)
	`uvm_field_int(addr,UVM_ALL_ON)
	`uvm_field_int(data,UVM_ALL_ON)
	`uvm_field_int(wr_rd,UVM_ALL_ON)
`uvm_object_utils_end
`NEW_OBJ

constraint periph_transfer_f_c {
	soft periph_transfer_f ==1;
}
endclass
