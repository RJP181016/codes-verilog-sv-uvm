`timescale 1ns/1ps
`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "dma.svh"
`include "dma_common.sv"
`include "axi_intf.sv"
`include "apb_intf.sv"
`include "periph_intf.sv"
`include "apb_tx.sv"
`include "dma_ctrl_reg_adapter.sv"
`include "dma_ctrl_reg_block.sv"
`include "apb_drv.sv"
`include "apb_seq_lib.sv"
`include "apb_sqr.sv"
`include "apb_mon.sv"
`include "apb_cov.sv"
`include "apb_agent.sv"
`include "axi_tx.sv"
`include "axi_slave.sv"
`include "axi_mon.sv"
`include "axi_agent.sv"
`include "dma_sbd.sv"
`include "dma_env.sv"
`include "test_lib.sv"

module top;
reg clk, reset;
 
initial begin
    clk = 0;
	apb_pif.pclken = 1;
    forever #1.25 clk = ~clk; //2.5ns => 400MHz(spec - 7.1 single core design - design 5 - freq)
end
 
initial begin
    reset = 1;
	apb_pif.scan_en = 0;
    repeat(1) @(posedge clk);
    reset = 0;
end
 
//interface instantiation
axi_intf     axi_pif(clk, reset);
apb_intf     apb_pif(clk, reset);
periph_intf periph_pif(clk, reset);
initial begin
	uvm_resource_db#(virtual axi_intf)::set("GLOBAL","axi_pif",axi_pif,null);
	uvm_resource_db#(virtual apb_intf)::set("GLOBAL","apb_pif",apb_pif,null);
	uvm_resource_db#(virtual periph_intf)::set("GLOBAL","periph_pif",periph_pif,null);
end
 
////DUT instantiation
dma_axi64 dut(
        .clk(apb_pif.clk),
        .reset(apb_pif.reset),
        .scan_en(apb_pif.scan_en),
        .idle(apb_pif.idle),
        .INT(apb_pif.INT),
        .periph_tx_req(periph_pif.periph_tx_req),
        .periph_tx_clr(periph_pif.periph_tx_clr),
        .periph_rx_req(periph_pif.periph_rx_req),
        .periph_rx_clr(periph_pif.periph_rx_clr),
        .pclken(apb_pif.pclken),
        .psel(apb_pif.psel),
        .penable(apb_pif.penable),
        .paddr(apb_pif.paddr),
        .pwrite(apb_pif.pwrite),
        .pwdata(apb_pif.pwdata),
        .prdata(apb_pif.prdata),
        .pslverr(apb_pif.pslverr),
        .pready(apb_pif.pready),
        .AWID0(axi_pif.awid),
        .AWADDR0(axi_pif.awaddr),
        .AWLEN0(axi_pif.awlen),
        .AWSIZE0(axi_pif.awsize),
        .AWVALID0(axi_pif.awvalid),
        .AWREADY0(axi_pif.awready),
        .WID0(axi_pif.wid),
        .WDATA0(axi_pif.wdata),
        .WSTRB0(axi_pif.wstrb),
        .WLAST0(axi_pif.wlast),
        .WVALID0(axi_pif.wvalid),
        .WREADY0(axi_pif.wready),
        .BID0(axi_pif.bid),
        .BRESP0(axi_pif.bresp),
        .BVALID0(axi_pif.bvalid),
        .BREADY0(axi_pif.bready),
        .ARID0(axi_pif.arid),
        .ARADDR0(axi_pif.araddr),
        .ARLEN0(axi_pif.arlen),
        .ARSIZE0(axi_pif.arsize),
        .ARVALID0(axi_pif.arvalid),
        .ARREADY0(axi_pif.arready),
        .RID0(axi_pif.rid),
        .RDATA0(axi_pif.rdata),
        .RRESP0(axi_pif.rresp),
        .RLAST0(axi_pif.rlast),
        .RVALID0(axi_pif.rvalid),
        .RREADY0(axi_pif.rready)
        );
 
initial begin
	run_test();
end

initial begin
    #50000;
    $finish;
end
endmodule
