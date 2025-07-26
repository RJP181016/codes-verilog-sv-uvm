//packet
class packet extends uvm_sequence_item;
rand logic [31:0] addr;
rand logic [31:0] data,data1,data2;
  
  constraint valid {
    addr inside {[0:15]};
    data inside {[10:500]};
  }
  
`uvm_object_utils_begin(packet)
  `uvm_field_int(data,UVM_ALL_ON  )
  `uvm_field_int(addr,UVM_ALL_ON  )
`uvm_object_utils_end

function new(string name="packet");
	super.new(name);
endfunction

endclass

//new_packet
class new_packet extends packet;
  `uvm_object_utils(new_packet)
 
  constraint k {
    addr ==5;
    data ==20;
  }
  
  function new(string name="new_packet");
	super.new(name);
endfunction
  
endclass
