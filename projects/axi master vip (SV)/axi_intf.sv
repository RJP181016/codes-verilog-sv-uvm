`define DATA_WIDTH 32
`define ADDR_WIDTH 32
typedef enum {
    READ,
    WRITE,
    READ_WRITE
} tx_type_t;

typedef enum {
    FIXED,
    INCR,
    WRAP,
	BRESERVED
} burst_type_t;

typedef enum {
    NORMAL,
    EXCL,
    LOCKED,
	LRESERVED
}  lock_t;

typedef enum {
	OKAY,
	EXOKAY,
	SLVERR,
	DECERR
} resp_t;

interface axi_intf(input logic aclk, input logic arstn);
logic [3:0] awid;
logic [31:0] awaddr;
logic [3:0] awlen;
logic [2:0] awsize;
burst_type_t awburst;
lock_t awlock;
logic [3:0] awcache;
logic [1:0] awprot;
logic awvalid;
logic awready;

logic [3:0]wid;
logic [31:0] wdata;
logic [3:0] wstrb;
logic wlast;
logic wvalid;
logic wready;

logic [3:0] bid;
resp_t bresp;
logic bvalid;
logic bready;

logic [3:0] arid;
logic [31:0] araddr;
logic [3:0] arlen;
logic [2:0] arsize;
burst_type_t arburst;
lock_t arlock;
logic [3:0] arcache;
logic [1:0] arprot;
logic arvalid;
logic arready;
 
logic [3:0]rid;
logic [31:0] rdata;
resp_t rresp;
logic rlast;
logic rvalid;
logic rready;

clocking master_cb@(posedge aclk);
default input #0 output #1;
output awid;
output awaddr;
output awlen;
output awsize;
output awburst;
output awlock;
output awcache;
output awprot;
output awvalid;
input awready;
output wid;
output wdata;
output wstrb;
output wlast;
output wvalid;
input wready;
input bid;
input bresp;
input bvalid;
output bready;
output arid;
output araddr;
output arlen;
output arsize;
output arburst;
output arlock;
output arcache;
output arprot;
output arvalid;
input arready;
input rid;
input rdata;
input rresp;
input rlast;
input rvalid;
output rready;
endclocking

clocking mon_cb@(posedge aclk);
default input #1;
input awid;
input awaddr;
input awlen;
input awsize;
input awburst;
input awlock;
input awcache;
input awprot;
input awvalid;
input awready;
input wid;
input wdata;
input wstrb;
input wlast;
input wvalid;
input wready;
input bid;
input bresp;
input bvalid;
input bready;
input arid;
input araddr;
input arlen;
input arsize;
input arburst;
input arlock;
input arcache;
input arprot;
input arvalid;
input arready;
input rid;
input rdata;
input rresp;
input rlast;
input rvalid;
input rready;
endclocking


endinterface
