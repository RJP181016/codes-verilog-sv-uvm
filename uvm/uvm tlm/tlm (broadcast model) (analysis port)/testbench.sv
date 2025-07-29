`include "uvm_pkg.sv"
`include "uvm_macros.svh"
`define ADDR_WIDTH 8
`define WIDTH 4
import uvm_pkg::*;
`include "apb_tx.sv"
`include "apb_mon.sv"
`include "apb_cov.sv"
`include "apb_sbd.sv"
`include "apb_ckr.sv"
`include "apb_env.sv"
`include "apb_test.sv"



module top;
initial begin
	run_test("apb_test");
end
endmodule

