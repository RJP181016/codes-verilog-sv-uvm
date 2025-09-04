class axi_mon;
    virtual axi_intf vif;
    axi_tx tx;
    axi_tx tx_wr_arr[16];
    axi_tx tx_rd_arr[16];
    task run();
    $display("axi_mon :: run");
    vif = axi_cfg::vif;
    while(1) begin
        @(posedge vif.aclk);
        if (vif.awvalid && vif.awready) begin //start of a transaciton
            //$display("axi_mon :: write_addr valid");
            tx_wr_arr[vif.awid] = new();
            tx_wr_arr[vif.awid].tx_type = WRITE;
            tx_wr_arr[vif.awid].waddr = vif.awaddr;
            tx_wr_arr[vif.awid].wlen = vif.awlen;
            tx_wr_arr[vif.awid].wsize = vif.awsize;
            tx_wr_arr[vif.awid].wburst = burst_type_t'(vif.awburst);
            tx_wr_arr[vif.awid].wprot = vif.awprot;
            tx_wr_arr[vif.awid].wcache = vif.awcache;
            tx_wr_arr[vif.awid].wlock = lock_t'(vif.awlock);
            tx_wr_arr[vif.awid].wid = vif.awid;
        end
        if (vif.wvalid && vif.wready) begin
            //$display("axi_mon :: write_data valid");
            tx_wr_arr[vif.wid].wdataQ.push_back(vif.wdata);
            tx_wr_arr[vif.wid].wstrbQ.push_back(vif.wstrb);
        end
        if (vif.bvalid && vif.bready) begin
            //$display("axi_mon :: write_resp valid");
            tx_wr_arr[vif.bid].wresp = vif.bresp;
            //now give the tx to coverage
            axi_cfg::mon2cov.put(tx_wr_arr[vif.bid]);
			//tx_wr_arr[vif.bid].print("mon::write");
        end
        if (vif.arvalid && vif.arready) begin
            //$display("axi_mon :: read_addr valid");
            tx_rd_arr[vif.arid] = new();
            tx_rd_arr[vif.arid].tx_type = READ;
            tx_rd_arr[vif.arid].raddr = vif.araddr;
            tx_rd_arr[vif.arid].rlen = vif.arlen;
            tx_rd_arr[vif.arid].rsize = vif.arsize;
            tx_rd_arr[vif.arid].rburst = burst_type_t'(vif.arburst);
            tx_rd_arr[vif.arid].rprot = vif.arprot;
            tx_rd_arr[vif.arid].rcache = vif.arcache;
            tx_rd_arr[vif.arid].rlock = lock_t'(vif.arlock);
            tx_rd_arr[vif.arid].rid = vif.arid;
        end
        if (vif.rvalid && vif.rready) begin
            //$display($time," axi_mon :: read_data=%h valid",vif.rdata);
            tx_rd_arr[vif.rid].rdataQ.push_back(vif.rdata);
            tx_rd_arr[vif.rid].rrespQ.push_back(vif.rresp);
            //need to check when read tx is going to complete
            if (vif.rlast == 1) begin
                axi_cfg::mon2cov.put(tx_rd_arr[vif.rid]);
				//tx_rd_arr[vif.rid].print("mon::read");
            end
        end
    end
    endtask
endclass
