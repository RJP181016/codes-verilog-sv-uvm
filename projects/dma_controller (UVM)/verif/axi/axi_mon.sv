class axi_mon extends uvm_monitor;
`uvm_component_utils(axi_mon)
`NEW_COMP
virtual axi_intf vif;
uvm_analysis_port#(axi_tx) ap_port;

axi_tx tx;
axi_tx tx_wr_arr[*];
axi_tx tx_rd_arr[*];

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_resource_db#(virtual axi_intf)::read_by_name("GLOBAL","axi_pif",vif,this);
	ap_port = new("ap_port",this);
endfunction

task run_phase(uvm_phase phase);
	forever begin
		@(vif.mon_cb);
        if (vif.mon_cb.awvalid && vif.mon_cb.awready) begin 
            tx_wr_arr[vif.mon_cb.awid] = axi_tx::type_id::create("tx");
            tx_wr_arr[vif.mon_cb.awid].tx_type = 1;
            tx_wr_arr[vif.mon_cb.awid].waddr = vif.mon_cb.awaddr;
            tx_wr_arr[vif.mon_cb.awid].wlen = vif.mon_cb.awlen;
            tx_wr_arr[vif.mon_cb.awid].wsize = vif.mon_cb.awsize;
            tx_wr_arr[vif.mon_cb.awid].wid = vif.mon_cb.awid;
        end
        if (vif.mon_cb.wvalid && vif.mon_cb.wready) begin
            tx_wr_arr[vif.mon_cb.wid].wdataQ.push_back(vif.mon_cb.wdata);
            tx_wr_arr[vif.mon_cb.wid].wstrbQ.push_back(vif.mon_cb.wstrb);
        end
        if (vif.mon_cb.bvalid && vif.mon_cb.bready) begin
            tx_wr_arr[vif.mon_cb.bid].wresp = vif.mon_cb.bresp;
            ap_port.write(tx_wr_arr[vif.mon_cb.bid]);
        end
        if (vif.mon_cb.arvalid && vif.mon_cb.arready) begin
            tx_rd_arr[vif.mon_cb.arid] = axi_tx::type_id::create("tx");
            tx_rd_arr[vif.mon_cb.arid].tx_type = 0;
            tx_rd_arr[vif.mon_cb.arid].raddr = vif.mon_cb.araddr;
            tx_rd_arr[vif.mon_cb.arid].rlen = vif.mon_cb.arlen;
            tx_rd_arr[vif.mon_cb.arid].rsize = vif.mon_cb.arsize;
            tx_rd_arr[vif.mon_cb.arid].rid = vif.mon_cb.arid;
        end
        if (vif.mon_cb.rvalid && vif.mon_cb.rready) begin
            tx_rd_arr[vif.mon_cb.rid].rdataQ.push_back(vif.mon_cb.rdata);
            tx_rd_arr[vif.mon_cb.rid].rrespQ.push_back(vif.mon_cb.rresp);
            if (vif.mon_cb.rlast == 1) begin
                ap_port.write(tx_rd_arr[vif.mon_cb.rid]);
            end
        end
	end
endtask

endclass
