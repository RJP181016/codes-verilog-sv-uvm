`define WIDTH 8
class alu_tx extends uvm_sequence_item;
 
  rand logic reset;
  rand logic [`WIDTH-1:0] inp1,inp2;
  randc logic [1:0]   op_code;
  logic [(2* `WIDTH) -1:0] alu_out;
  
  `uvm_object_utils_begin(alu_tx)
  `uvm_field_int(reset,UVM_ALL_ON | UVM_NOCOMPARE)
  `uvm_field_int(inp1,UVM_ALL_ON | UVM_NOCOMPARE)
  `uvm_field_int(inp2,UVM_ALL_ON | UVM_NOCOMPARE)
  `uvm_field_int(op_code,UVM_ALL_ON | UVM_NOCOMPARE)
  `uvm_field_int(alu_out,UVM_ALL_ON)
  `uvm_object_utils_end
  
  constraint valid {
    inp1 inside {[0:255]};
    inp2 inside {[0:255]};
    op_code inside {[0:3]};
  }
  constraint inf_out{
    if(op_code==2'b11){
      inp2!=0;
    }
  }
 `NEW_OBJ
endclass