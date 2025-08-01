interface fifo_intf(input logic rst,wt_clk,rd_clk);
parameter DATA_WIDTH =`DATA_WIDTH;
logic wt_en,rd_en;
logic [DATA_WIDTH-1:0]wdata;
logic [DATA_WIDTH-1:0]rdata;
logic full,empty,overflow,underflow;
  
clocking wt_cb@(posedge wt_clk);
  default input #1;
  input wt_en,wdata;
  input #0 full;
  input #0 overflow;
endclocking

clocking rd_cb@(posedge rd_clk);
	default input #0;
	input #1 rd_en;
    input rdata;
    input underflow;
    input #0 empty;
endclocking
endinterface
