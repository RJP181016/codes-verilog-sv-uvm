`include "if_memory.sv"
`include "memory_rtl.sv"
`include "program_mem.sv"
module top;
parameter reg [15:0] ADDR_WIDTH=8;
parameter reg [15:0] DATA_WIDTH=32;
parameter reg [15:0] MEM_SIZE=16;

bit clk;

always #10 clk=!clk;


memory_if   #(ADDR_WIDTH,DATA_WIDTH,MEM_SIZE) mem_if_inst (clk);
memory_rtl  #(ADDR_WIDTH,DATA_WIDTH,MEM_SIZE) dut_inst    (.clk(clk),.reset(mem_if_inst.reset),
                                                      .wr(mem_if_inst.wr),.addr(mem_if_inst.addr),
						      .response(mem_if_inst.slv_rsp),
						      .wdata(mem_if_inst.wdata),
		                                      .rdata(mem_if_inst.rdata));

mem_program pgm_inst (mem_if_inst);
  
    
endmodule

