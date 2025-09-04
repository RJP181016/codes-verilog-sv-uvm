class axi_bfm;
    axi_tx tx;
	int delay;
    virtual axi_intf vif;
	semaphore smp_waddr = new(1);
	semaphore smp_wdata = new(1);
	semaphore smp_raddr = new(1);
    
	task run();
        $display("axi_bfm :: run");
        vif= axi_cfg::vif;
        forever begin
            axi_cfg::gen2bfm.get(tx);
            //tx.print();
			fork
            	drive_tx(tx);
			join_none
			delay=$urandom_range(50,100);
			#(delay);
        end
    endtask

    task drive_tx(axi_tx tx);
        if (tx.tx_type == WRITE) begin
            write_addr(tx);
            write_data(tx);
            write_resp(tx);
        end
        if (tx.tx_type == READ) begin
            read_addr(tx);
            read_data(tx);
        end
        if (tx.tx_type == READ_WRITE) begin
        fork
        begin
            read_addr(tx);
            read_data(tx);
        end
        begin
            write_addr(tx);
            write_data(tx);
            write_resp(tx);
        end
        join
        end
    endtask

//write_addr_phase
    task write_addr(axi_tx tx);
		smp_waddr.get(1);
        vif.master_cb.awaddr <= tx.waddr;
        vif.master_cb.awburst <= tx.wburst;
        vif.master_cb.awlen <= tx.wlen;
        vif.master_cb.awsize <= tx.wsize;
        vif.master_cb.awcache <= tx.wcache;
        vif.master_cb.awprot <= tx.wprot;
        vif.master_cb.awlock <= tx.wlock;
        vif.master_cb.awid <= tx.wid;
        vif.master_cb.awvalid <= 1'b1; 
        @(vif.master_cb);
		wait(vif.master_cb.awready ==1);
        vif.master_cb.awvalid <= 0;
        vif.master_cb.awaddr <= 0;
        vif.master_cb.awburst <= burst_type_t'(0);
        vif.master_cb.awlen <= 0;
        vif.master_cb.awsize <= 0;
        vif.master_cb.awcache <= 0;
        vif.master_cb.awprot <= 0;
        vif.master_cb.awlock <= lock_t'(0);
        vif.master_cb.awid <= 0;
		smp_waddr.put(1);
    endtask

//write_data_phase
    task write_data(axi_tx tx);
        for (int i = 0; i <= tx.wlen; i++) begin  
			smp_wdata.get(1);
            vif.master_cb.wdata <= tx.wdataQ[i];  //tx.wdataQ.pop_front();
            vif.master_cb.wstrb <= tx.wstrbQ[i];  //tx.wstrbQ.pop_front();
            vif.master_cb.wid <= tx.wid;
            vif.master_cb.wvalid <= 1'b1;
            vif.master_cb.bready <= 1;
            vif.master_cb.wlast <= (i == tx.wlen) ? 1 : 0;
			@(vif.master_cb);
			wait(vif.master_cb.wready==1);
			smp_wdata.put(1);
        end 
        vif.master_cb.wvalid <= 0;
        vif.master_cb.wlast <= 0;
		vif.master_cb.wdata <= 0;
        vif.master_cb.wstrb <= 0;
        vif.master_cb.wid <= 0;
    endtask

//write_resp_phase
    task write_resp(axi_tx tx);
		wait(vif.master_cb.bvalid==1);
    	tx.wresp <= vif.master_cb.bresp;
    	@(vif.master_cb);
		vif.master_cb.bready <= 0;
    endtask

//read_addr_phase
    task read_addr(axi_tx tx);
		smp_raddr.get(1);
        vif.master_cb.araddr <= tx.raddr;
        vif.master_cb.arburst <= tx.rburst;
        vif.master_cb.arlen <= tx.rlen;
        vif.master_cb.arsize <= tx.rsize;
        vif.master_cb.arcache <= tx.rcache;
        vif.master_cb.arprot <= tx.rprot;
        vif.master_cb.arlock <= tx.rlock;
        vif.master_cb.arid <= tx.rid;
        vif.master_cb.arvalid <= 1'b1; 
    	vif.master_cb.rready <= 1;
        @(vif.master_cb);
		wait(vif.master_cb.arready == 1);
        vif.master_cb.araddr <= 0;
        vif.master_cb.arburst <= burst_type_t'(0);
        vif.master_cb.arlen <= 0;
        vif.master_cb.arsize <= 0;
        vif.master_cb.arcache <= 0;
        vif.master_cb.arprot <= 0;
        vif.master_cb.arlock <= lock_t'(0);
        //vif.master_cb.arid <= 0;
        vif.master_cb.arvalid <= 0;
		smp_raddr.put(1);
    endtask

//read_data_phase
    task read_data(axi_tx tx);
    	for (int i = 0; i <= tx.rlen; i++) begin
    	   	//@(vif.master_cb);
			//wait(vif.master_cb.rvalid == 1);
   			bit rvalid_f = 0;
        	while(rvalid_f == 0) begin
            	if (vif.master_cb.rvalid == 1) begin
                	rvalid_f = 1;
                	vif.master_cb.rready <= 1;
            	end
        	end
    		@(vif.master_cb);
    		vif.master_cb.rready <= 0;
  		end
    endtask
endclass

