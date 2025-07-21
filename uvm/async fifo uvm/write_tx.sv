class write_tx extends uvm_sequence_item;
randc logic [`DATA_WIDTH-1:0] wdata;
logic wt_en;
logic full,overflow;

`uvm_object_utils_begin(write_tx)
  `uvm_field_int(wt_en,UVM_ALL_ON)
  `uvm_field_int(wdata,UVM_ALL_ON)
  `uvm_field_int(full,UVM_ALL_ON)
  `uvm_field_int(overflow,UVM_ALL_ON)
`uvm_object_utils_end
`NEW_OBJ


endclass
