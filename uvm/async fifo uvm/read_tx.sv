class read_tx extends uvm_sequence_item;
rand logic [`DATA_WIDTH-1:0] rdata;
logic rd_en;
logic empty,underflow;

`uvm_object_utils_begin(read_tx)
  `uvm_field_int(rd_en,UVM_ALL_ON)
  `uvm_field_int(rdata,UVM_ALL_ON)
  `uvm_field_int(empty,UVM_ALL_ON)
  `uvm_field_int(underflow,UVM_ALL_ON)
`uvm_object_utils_end
`NEW_OBJ


endclass
