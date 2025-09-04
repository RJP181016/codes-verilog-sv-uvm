class axi_cov;
    axi_tx tx;
    covergroup axi_cg;
		AWBURST_CP : coverpoint tx.wburst iff (tx.tx_type == WRITE) {
			bins FIXED = {FIXED};
			bins WRAP = {WRAP};
			bins INCR = {INCR};
		}
		ARBURST_CP : coverpoint tx.rburst iff (tx.tx_type == READ) {
			bins FIXED = {FIXED};
			bins WRAP = {WRAP};
			bins INCR = {INCR};
		}
        AWLEN_CP : coverpoint tx.wlen iff (tx.tx_type == WRITE) {
            bins WLEN = {[0:15]};
        }
        ARLEN_CP : coverpoint tx.rlen iff (tx.tx_type == READ) {
            bins RLEN = {[0:15]};
        }
        AWSIZE_CP : coverpoint tx.wsize iff (tx.tx_type == WRITE) {
            bins WSIZE = {[0:2]};
        }
        ARSIZE_CP : coverpoint tx.rsize iff (tx.tx_type == READ) {
            bins RSIZE = {[0:2]};
        }
		ALIGNED_CP : coverpoint (tx.waddr%(2**tx.wsize)) iff (tx.tx_type == WRITE) {
			bins aligned = {0};
			bins misaligned = default;
		}
        WSTRB_CP : coverpoint tx.wstrbQ[tx.wid] iff (tx.tx_type == WRITE) {
            bins WSTRB1 = {1,2,4,8};
            bins WSTRB2 = {3,12};
            bins WSTRB4 = {15};
        }
		BRESP_CP : coverpoint tx.wresp iff (tx.tx_type == WRITE) {
		    bins okay   = {OKAY};
		    ignore_bins exokay = {EXOKAY};
		    bins slverr = {SLVERR};
		    bins decerr = {DECERR};
		}
		RRESP_CP : coverpoint tx.rrespQ[tx.rid] iff (tx.tx_type == READ) {
		    bins okay   = {OKAY};
		    ignore_bins exokay = {EXOKAY};
		    bins slverr = {SLVERR};
		    bins decerr = {DECERR};
		}
    endgroup

    function new();
        axi_cg = new();
    endfunction

    task run();
        $display("axi_cov :: run");
    	while (1) begin
    	    axi_cfg::mon2cov.get(tx);
    	   // $display("################### TX Collected in coverage ###############");
    	    //tx.print();
    	    axi_cg.sample();
    	end
    endtask
endclass
