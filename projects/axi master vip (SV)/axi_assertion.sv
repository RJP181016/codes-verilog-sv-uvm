module axi_assertion(
input aclk,
input arstn,
input [3:0] awid,
input [31:0] awaddr,
input [2:0] awsize,
input [3:0] awlen,
input lock_t awlock,
input burst_type_t awburst,
input [3:0] awcache,
input [1:0] awprot,
input awvalid,
input awready,

input [31:0] wdata,
input [3:0] wstrb,
input [3:0] wid,
input wvalid,
input wready,
input wlast,

input [3:0] bid,
input resp_t bresp,
input bvalid,
input bready,

input [3:0] arid,
input [31:0] araddr,
input [2:0] arsize,
input [3:0] arlen,
input lock_t arlock,
input burst_type_t arburst,
input [3:0] arcache,
input [1:0] arprot,
input arvalid,
input arready,

input [31:0] rdata,
input [3:0] rid,
input [0:0] rvalid,
input rready,
input rlast,
input resp_t rresp
);

//handshake check
property handshake_prop(valid,ready,MAX);
    @(posedge aclk) valid |-> ##[0:MAX] (ready==1);
endproperty

WA_CHANNEL_HNDSHK_PROP : assert property (handshake_prop(awvalid, awready, 3));
WD_CHANNEL_HNDSHK_PROP : assert property (handshake_prop(wvalid, wready, 3));
WR_CHANNEL_HNDSHK_PROP : assert property (handshake_prop(bvalid, bready, 3));
RA_CHANNEL_HNDSHK_PROP : assert property (handshake_prop(arvalid, arready, 3));
RD_CHANNEL_HNDSHK_PROP : assert property (handshake_prop(rvalid, rready, 3));


endmodule
