`define DEPTH 16
`define PTR_WIDTH $clog2(DEPTH)
`define DATA_WIDTH 8
`define WT_CLK_CYCLE_DELAY 1
`define RD_CLK_CYCLE_DELAY 3
`define WT_MAX_DELAY 5
`define RD_MAX_DELAY 2
`define NUM_WRITES 3000
`define NUM_READS 17


`define NEW_COMP \
function new(string name="",uvm_component parent=null); \
	super.new(name,parent); \
endfunction 
`define NEW_OBJ \
function new(string name=""); \
	super.new(name); \
endfunction 
