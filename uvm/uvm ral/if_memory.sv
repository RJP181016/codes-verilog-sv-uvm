interface memory_if (input clk);

parameter reg [15:0] ADDR_WIDTH=8;
  parameter reg [15:0] DATA_WIDTH=32;
parameter reg [15:0] MEM_SIZE=16;

logic  reset;
logic  slv_rsp;
logic  wr;// for write wr=1;
          // for read  wr=0;
logic  [ADDR_WIDTH-1:0] addr;
logic  [DATA_WIDTH-1:0] wdata;
logic  [DATA_WIDTH-1:0] rdata;

clocking cb @(posedge clk);
//Directions are w.r.t to testbench
output wr;
output wdata;
output addr;
input rdata;
endclocking

clocking cb_mon_in @(posedge clk);
input wr;
input wdata;
input addr;
endclocking

clocking cb_mon_out @(posedge clk);
input rdata;
input wr;
input addr;
endclocking

//modport for specifying directions
modport tb      (clocking cb,output reset,input slv_rsp);
modport tb_mon_in  (clocking cb_mon_in);
modport tb_mon_out  (clocking cb_mon_out);

endinterface
