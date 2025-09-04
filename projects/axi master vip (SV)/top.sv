`include "axi_cfg.sv"
`include "axi.svh"
module top;
//1. design instiantion
axi_slave  dut(
    .aclk(pif.aclk),
    .arstn(pif.arstn),
    //write addr channel
    .awaddr(pif.awaddr),
    .awlen(pif.awlen),
    .awsize(pif.awsize),
    .awburst(pif.awburst),
    .awcache(pif.awcache),
    .awprot(pif.awprot),
    .awlock(pif.awlock),
    .awid(pif.awid),
    .awvalid(pif.awvalid),
    .awready(pif.awready),
    //Write data channel
    .wdata(pif.wdata),
    .wstrb(pif.wstrb),
    .wid(pif.wid),
    .wvalid(pif.wvalid),
    .wready(pif.wready),
    .wlast(pif.wlast),
    //write response channel
    .bid(pif.bid),
    .bresp(pif.bresp),
    .bvalid(pif.bvalid),
    .bready(pif.bready),
    //read address channel
    .araddr(pif.araddr),
    .arlen(pif.arlen),
    .arsize(pif.arsize),
    .arburst(pif.arburst),
    .arcache(pif.arcache),
    .arprot(pif.arprot),
    .arlock(pif.arlock),
    .arid(pif.arid),
    .arvalid(pif.arvalid),
    .arready(pif.arready),
    //read data & resp channel
    .rdata(pif.rdata),
    .rid(pif.rid),
    .rvalid(pif.rvalid),
    .rready(pif.rready),
    .rlast(pif.rlast),
    .rresp(pif.rresp)
        );
//2. clk, rst declaration, generation
reg clk, rst;
//3. interface instinaitons
axi_intf  pif(clk, rst);
//4. testbench instinaitons
axi_tb tb();
//5. assertion module instinaitons
axi_assertion  assert_dut(
    .aclk(pif.aclk),
    .arstn(pif.arstn),
    //write addr channel
    .awaddr(pif.awaddr),
    .awlen(pif.awlen),
    .awsize(pif.awsize),
    .awburst(pif.awburst),
    .awcache(pif.awcache),
    .awprot(pif.awprot),
    .awlock(pif.awlock),
    .awid(pif.awid),
    .awvalid(pif.awvalid),
    .awready(pif.awready),
    //Write data channel
    .wdata(pif.wdata),
    .wstrb(pif.wstrb),
    .wid(pif.wid),
    .wvalid(pif.wvalid),
    .wready(pif.wready),
    .wlast(pif.wlast),
    //write response channel
    .bid(pif.bid),
    .bresp(pif.bresp),
    .bvalid(pif.bvalid),
    .bready(pif.bready),
    //read address channel
    .araddr(pif.araddr),
    .arlen(pif.arlen),
    .arsize(pif.arsize),
    .arburst(pif.arburst),
    .arcache(pif.arcache),
    .arprot(pif.arprot),
    .arlock(pif.arlock),
    .arid(pif.arid),
    .arvalid(pif.arvalid),
    .arready(pif.arready),
    //read data & resp channel
    .rdata(pif.rdata),
    .rid(pif.rid),
    .rvalid(pif.rvalid),
    .rready(pif.rready),
    .rlast(pif.rlast),
    .rresp(pif.rresp)
);
//6. logic to decide when to end simultion(when to call $finish)
initial begin
	rst=1;
	reset();
	@(posedge clk);
	rst=0;
    #3000;
    $finish();
end
//clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end
//7. logic to read the testname
initial begin
    assert($value$plusargs("testname=%s",axi_cfg::testname));  //Process#1
    axi_cfg::vif = pif;
    axi_cfg::testread_f = 1;
end


task reset();
    pif.awaddr=0;
    pif.awlen=0;
    pif.awsize=0;
    pif.awburst=burst_type_t'(0);
    pif.awcache=0;
    pif.awprot=0;
    pif.awlock=lock_t'(0);
    pif.awid=0;
    pif.awvalid=0;
    pif.wdata=0;
    pif.wstrb=0;
    pif.wid=0;
    pif.wvalid=0;
    pif.wlast=0;
    pif.bready=0;
    pif.araddr=0;
    pif.arlen=0;
    pif.arsize=0;
    pif.arburst=burst_type_t'(0);
    pif.arcache=0;
    pif.arprot=0;
    pif.arlock=lock_t'(0);
    pif.arid=0;
    pif.arvalid=0;
    pif.rready=0;
endtask
endmodule

