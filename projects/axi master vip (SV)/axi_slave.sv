module axi_slave(
    aclk,
    arstn,
    //write addr channel
    awaddr,
    awlen,
    awsize,
    awburst,
    awcache,
    awprot,
    awlock,
    awid,
    awvalid,
    awready,
    //Write data channel
    wdata,
    wstrb,
    wid,
    wvalid,
    wready,
    wlast,
    //write response channel
    bid,
    bresp,
    bvalid,
    bready,
    //read address channel
    araddr,
    arlen,
    arsize,
    arburst,
    arcache,
    arprot,
    arlock,
    arid,
    arvalid,
    arready,
    //read data & resp channel
    rdata,
    rid,
    rvalid,
    rready,
    rlast,
    rresp
);
input aclk;
input arstn;
input [3:0] awid;
input [31:0] awaddr;
input [2:0] awsize;
input [3:0] awlen;
input lock_t awlock;
input burst_type_t awburst;
input [3:0] awcache;
input [1:0] awprot;
input awvalid;
output reg awready;

input [31:0]    wdata;
input [3:0]    wstrb;
input [3:0]    wid;
input  wvalid;
output reg  wready;
input  wlast;

output reg [3:0] bid;
output resp_t bresp;
output reg bvalid;
input bready;

input [3:0] arid;
input [31:0] araddr;
input [2:0] arsize;
input [3:0] arlen;
input lock_t arlock;
input burst_type_t arburst;
input [3:0] arcache;
input [1:0] arprot;
input arvalid;
output reg arready;

output reg [31:0]    rdata;
output reg [3:0]    rid;
output reg [0:0]    rvalid;
input  rready;
output reg  rlast;
output resp_t rresp;

//reg [31:0] mem[int];
byte mem[*];
bit [31:0] awaddr_t_arr[16];
bit [3:0] awlen_t_arr[16];
bit [2:0] awsize_t_arr[16];
burst_type_t awburst_t_arr[16];

bit [31:0] araddr_t_arr[16];
bit [3:0] arlen_t_arr[16];
bit [2:0] arsize_t_arr[16];
burst_type_t arburst_t_arr[16];

int tx_size;
bit [31:0] addr_offset,wrap_lower_addr,wrap_upper_addr,boundary_4kb;

bit bready_f = 0;

always @(posedge aclk) begin
	if(arstn) begin
		awready=0;
		wready=0;
		bid=0;
		bresp=resp_t'(0);
		bvalid=0;
		arready=0;
		rdata=0;
		rid=0;
		rvalid=0;
		rlast=0;
		rresp=resp_t'(0);
	end
	else begin
		//write addr phase
	    if (awvalid == 1) begin
	        awready = 1;
			$display($time,"	=============================write============================");
	        awaddr_t_arr[awid] = awaddr; 
			awlen_t_arr[awid] = awlen; 
	        awsize_t_arr[awid] = awsize;
	        awburst_t_arr[awid] =  awburst;
			boundary_4kb = awaddr%4096 + (2**awsize * (awlen+1));
			$display($time," boundary_4kb = %d",boundary_4kb);
			calc_wrap_boundaries(awaddr_t_arr[awid],awlen_t_arr[awid],awsize_t_arr[awid]);
	    end
		else begin
	        awready = 0;
	    end
	
	    //write data phase
	    if (wvalid == 1) begin
	        wready = 1;
			if(awsize_t_arr[wid] == 2) begin
				for(int i=0; i<4; i++) begin
	        		mem[awaddr_t_arr[wid]+i] = wdata[8*i +: 8];
				end
				$display("slave: %t: === awaddr_t_arr[wid]=%h === wdata=%h ===",$time,awaddr_t_arr[wid],wdata);
			end
			if(awsize_t_arr[wid] == 1) begin
			 	case (wstrb)
	            	4'b0011 : begin
	            	    mem[awaddr_t_arr[wid]] = wdata[7:0];
	            	    mem[awaddr_t_arr[wid]+1] = wdata[15:8];
	            	end
	            	4'b1100 : begin
	            	    mem[awaddr_t_arr[wid]] = wdata[23:16];
	            	    mem[awaddr_t_arr[wid]+1] = wdata[31:24];
	            	end
	            	default : begin
	            	    $display("axi_slave: wstrb1 ERROR");
	            	end
	            endcase
				$display("slave: %t: === awaddr_t_arr[wid]=%h === wdata=%h ===",$time,awaddr_t_arr[wid],wdata);
			end
			if(awsize_t_arr[wid] == 0) begin
				case (wstrb)
	        		4'b0001 : begin
	            	    mem[awaddr_t_arr[wid]] = wdata[7:0];
	        		end
	        		4'b0010 : begin
	            	    mem[awaddr_t_arr[wid]] = wdata[15:8];
	        		end
	        		4'b0100 : begin
	            	    mem[awaddr_t_arr[wid]] = wdata[23:16];
	        		end
	        		4'b1000 : begin
	            	    mem[awaddr_t_arr[wid]] = wdata[31:24];
	        		end
	        		default : begin
	            	    $display("axi_slave: wstrb0 ERROR");
	        		end
	        	endcase
				$display("slave: %t: === awaddr_t_arr[wid]=%h === wdata=%h ===",$time,awaddr_t_arr[wid],wdata);
			end
	       	awaddr_t_arr[wid] += 2**awsize_t_arr[wid];
			if (awburst_t_arr[wid] == WRAP && awaddr_t_arr[wid] >= wrap_upper_addr) begin
				$display("###write: wrapping awaddr=%h to wrap_lower_addr=%h",awaddr_t_arr[wid],wrap_lower_addr);
				awaddr_t_arr[wid] = wrap_lower_addr;
			end

			//write_resp_phase
			if (wlast == 1) begin
			fork
	       		do_write_resp(wid);
			join_none
	   		end
	    end
		else begin
	        wready = 0;
	    end
	end
end

//read_addr_phase
always @(posedge aclk) begin
    if (arvalid == 1) begin
        arready = 1;
		$display($time,"	=============================read============================");
        araddr_t_arr[arid] = araddr; 
        arlen_t_arr[arid] = arlen; 
        arsize_t_arr[arid] = arsize;
        arburst_t_arr[arid] = arburst;
		calc_wrap_boundaries(araddr_t_arr[arid],arlen_t_arr[arid],arsize_t_arr[arid]);
		//read__data_phase
        do_read_data_phase(arid);
    end
	else begin
        arready = 0;
    end
end

task do_read_data_phase(input [31:0] arid_t);
	for (int i = 0; i <= arlen_t_arr[arid_t]; i++) begin
		if(arsize_t_arr[arid_t]==2) begin
	    	rdata[7:0] = mem[araddr_t_arr[arid_t]];
	    	rdata[15:8] = mem[araddr_t_arr[arid_t]+1];
	    	rdata[23:16] = mem[araddr_t_arr[arid_t]+2];
	    	rdata[31:24] = mem[araddr_t_arr[arid_t]+3];
			$display("slave: %t: === araddr_t_arr[rid]=%h === wdata=%h ===",$time,araddr_t_arr[arid_t],rdata);
		end
		if(arsize_t_arr[arid_t]==1) begin
	    	rdata[7:0] = mem[araddr_t_arr[arid_t]];
	    	rdata[15:8] = mem[araddr_t_arr[arid_t]+1];
			$display("slave: %t: === araddr_t_arr[rid]=%h === wdata=%h ===",$time,araddr_t_arr[arid_t],rdata);
		end
		if(arsize_t_arr[arid_t]==0) begin
	    	rdata[7:0] = mem[araddr_t_arr[arid_t]];
			$display("slave: %t: === araddr_t_arr[rid]=%h === wdata=%h ===",$time,araddr_t_arr[arid_t],rdata);
		end

	    rid = arid_t;
	    rvalid = 1;
		$display("(((2**arsize_t_arr[arid_t])*8)>32) = %0d",arsize_t_arr[arid_t]);
		if ((boundary_4kb > 4096) || (((2**arsize_t_arr[arid_t])*8)>32)) rresp = SLVERR;
		else if(araddr_t_arr[arid_t] > 32'h0000_FFFF) rresp = DECERR; 
		else rresp = OKAY;
	    if (i == arlen_t_arr[arid_t]) rlast = 1;
	    @(posedge aclk);
	    wait(rready == 1);
	   	
		araddr_t_arr[arid_t] += 2**arsize_t_arr[arid_t];
		if (arburst_t_arr[arid_t] == WRAP && araddr_t_arr[arid_t] >= wrap_upper_addr) begin
			$display("###read: wrapping araddr=%h to wrap_lower_addr=%h",araddr_t_arr[arid_t],wrap_lower_addr);
			araddr_t_arr[arid_t] = wrap_lower_addr;
		end
	end
    rvalid = 0;
    rlast = 0;
	rdata=0;
endtask

task do_write_resp(input [3:0] bid_t);
    @(posedge aclk);
    bid = bid_t;
	if ((boundary_4kb > 4096) || (((2**awsize_t_arr[bid_t])*8)>32)) bresp = SLVERR;
	else if(awaddr_t_arr[bid_t] > 32'h0000_FFFF) bresp = DECERR; 
	else bresp = OKAY;
    bvalid = 1;
    //handing concept
    bready_f = 0;
    while (bready_f == 0) begin
        @(posedge aclk);
        if (bready == 1) bready_f = 1;
    end
   // @(posedge aclk);
    bvalid = 0;
	bid = 0;
endtask


function void calc_wrap_boundaries(bit [31:0] addr, bit [3:0] len, bit [2:0] burst_size);
	tx_size = (len+1)*(2**burst_size);
	addr_offset = addr%tx_size;
	wrap_lower_addr = addr - addr_offset;
	wrap_upper_addr = wrap_lower_addr + tx_size-1;
	$display("wrap_lower_addr=%h, wrap_upper_addr=%h",wrap_lower_addr,wrap_upper_addr);

endfunction

endmodule

