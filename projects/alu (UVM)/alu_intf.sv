interface alu_intf(input logic clk);
  parameter N=8;
  logic reset;
  logic [N-1:0] inp1,inp2;
  logic [1:0] op_code;
  logic [(2*N)-1:0] outp;
  
  
  clocking cb @(posedge clk);
    output  inp1,inp2;
    output  op_code;
  endclocking
  
 //Master monitor clocking block
clocking cb_mon_in @(posedge clk);
input  inp1,inp2;
input  op_code;
endclocking

//Slave monitor clocking block
clocking cb_mon_out @(posedge clk);
input #1 outp;
endclocking

//modport for specifying directions
modport tb      (clocking cb,output reset);
  modport tb_mon_in  (clocking cb_mon_in);
  modport tb_mon_out  (clocking cb_mon_out,input reset);
  
endinterface: alu_intf