class axi_tx extends uvm_sequence_item;
    rand bit tx_type;
    rand bit wid; 
    rand bit [31:0] waddr;
    rand bit [63:0] wdataQ[$:15];
    rand bit [64/8-1:0] wstrbQ[$:15];
    rand bit [3:0] wlen;	
    rand bit [1:0] wsize;
    bit [1:0] wresp;

    rand bit rid; 
    rand bit [31:0] raddr;
    rand bit [63:0] rdataQ[$:15];
    rand bit [3:0] rlen;
    rand bit [1:0] rsize;
    rand bit [1:0] rrespQ[$:16];

`uvm_object_utils_begin(axi_tx)
	`uvm_field_int(tx_type,UVM_ALL_ON)
	`uvm_field_int(wid,UVM_ALL_ON)
    `uvm_field_int(waddr,UVM_ALL_ON)
    `uvm_field_queue_int(wdataQ,UVM_ALL_ON)
    `uvm_field_queue_int(wstrbQ,UVM_ALL_ON)
    `uvm_field_int(wlen,UVM_ALL_ON)
    `uvm_field_int(wsize,UVM_ALL_ON)
    `uvm_field_int(wresp,UVM_ALL_ON)
    `uvm_field_int(rid,UVM_ALL_ON)
    `uvm_field_int(raddr,UVM_ALL_ON)
    `uvm_field_queue_int(rdataQ,UVM_ALL_ON)
    `uvm_field_int(rlen,UVM_ALL_ON)
    `uvm_field_int(rsize,UVM_ALL_ON)
    `uvm_field_queue_int(rrespQ,UVM_ALL_ON)
`uvm_object_utils_end
`NEW_OBJ


endclass
