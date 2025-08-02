`include "uvm_macros.svh"
import uvm_pkg::*;
`include "alu.v"
`include "alu_intf.sv"
`include "list.sv"

module top;
  parameter N=8;
  logic clk;
  logic reset;
  
  alu_intf #(.N(N)) alu_pintf(clk);
  alu      #(.N(N)) dut    (.clk(clk),
                            .reset(alu_pintf.reset),
                            .op_code(alu_pintf.op_code),
                            .inp1(alu_pintf.inp1),
                            .inp2(alu_pintf.inp2),
                            .outp(alu_pintf.outp)
		          		);
  
  initial begin
    clk=0;
    #1;
    forever #1 clk=~clk;
  end
  
  
  initial begin
    uvm_config_db#(virtual alu_intf)::set(null,"*","vif",alu_pintf);
  end
  
  initial begin
    run_test("alu_base_test");
  end
  initial begin
    #100000;
    $finish;
  end
  
endmodule