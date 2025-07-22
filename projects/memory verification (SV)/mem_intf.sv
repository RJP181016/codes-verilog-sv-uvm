interface mem_intf(input logic clk,rst);
logic [`ADDR_WIDTH-1:0]addr;
logic [`WIDTH-1:0]wdata;
logic [`WIDTH-1:0]rdata;
logic wt_rd,valid;
logic ready;

clocking bfm_cb@(posedge clk);
default input #0 output #1;
output addr;
output #2 wdata;
input #0 rdata;
output #1 wt_rd,valid;
input #0 ready;
endclocking

clocking mon_cb@(posedge clk);
default input #1;
input addr;
input wdata;
input rdata;
input wt_rd,valid;
input ready;
endclocking

modport bfm_mp(clocking bfm_cb);
modport mon_mp(clocking mon_cb);

endinterface
