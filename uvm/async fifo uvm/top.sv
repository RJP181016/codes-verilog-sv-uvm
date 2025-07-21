`include "uvm_macros.svh"
import uvm_pkg::*;

`include "common.sv"
`include "async_fifo_intf.sv"
`include "async_fifo1.v"
`include "list.sv"

module top;
bit rst,wt_clk,rd_clk;
  
parameter DEPTH=`DEPTH;
parameter PTR_WIDTH=`PTR_WIDTH;
parameter DATA_WIDTH=`DATA_WIDTH;

parameter WT_CLK_CYCLE_DELAY=`WT_CLK_CYCLE_DELAY;
parameter RD_CLK_CYCLE_DELAY=`RD_CLK_CYCLE_DELAY;

  fifo_intf pif(rst,wt_clk,rd_clk);

  async_fifo #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH),.PTR_WIDTH(PTR_WIDTH)) dut (.wt_clk(wt_clk),
                                                                                 .rd_clk(rd_clk),
                                                                                 .rst(pif.rst),
                                                                                 .wt_en(pif.wt_en),
                                                                                 .wdata(pif.wdata),
                                                                                 .full(pif.full),
                                                                                 .overflow(pif.overflow),
                                                                                 .rd_en(pif.rd_en),
                                                                                 .rdata(pif.rdata),
                                                                                 .empty(pif.empty),
                                                                                 .underflow(pif.underflow));

//clock generation
initial begin
	wt_clk=0;
	forever #WT_CLK_CYCLE_DELAY wt_clk = ~wt_clk;
end
initial begin
	rd_clk=0;
	forever #RD_CLK_CYCLE_DELAY rd_clk = ~rd_clk;
end

//run_test
initial begin
  run_test("write_test");
end

//virtual intf
initial begin
	uvm_resource_db#(virtual fifo_intf)::set("GLOBAL","vif",pif,null);
end

initial begin
    reset_mem();
end

//reset
task reset_mem();
	rst=1;
	pif.wt_en=0;
	pif.rd_en=0;
	pif.wdata=0;
	@(posedge wt_clk);
	rst=0;
endtask
  
  /*
  initial begin
    $dumpvars();
    $dumpfile("1.vcd");
  end
*/
endmodule
