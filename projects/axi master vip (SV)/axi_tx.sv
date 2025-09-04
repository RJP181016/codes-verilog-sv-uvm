class axi_tx;
//write channels fields
    rand tx_type_t tx_type;
    rand bit [3:0] wid; 
    rand bit [`ADDR_WIDTH-1:0] waddr;
    rand bit [`DATA_WIDTH-1:0] wdataQ[$:15];
    rand bit [(`DATA_WIDTH/8)-1:0] wstrbQ[$:15];
    rand bit [3:0] wlen;	//axi3
    //rand bit [7:0] wlen;	//axi4
    rand bit [2:0] wsize;
    rand burst_type_t wburst;
    rand bit [3:0] wcache; 
    rand lock_t wlock;
    rand bit [2:0] wprot;
    bit [1:0] wresp;

//read channels fields
    rand bit [3:0] rid; 
    rand bit [`ADDR_WIDTH-1:0] raddr;
    rand bit [`DATA_WIDTH-1:0] rdataQ[$:15];
    rand bit [3:0] rlen;	//axi3
    //rand bit [7:0] rlen;	//axi4
    rand bit [2:0] rsize;
    rand burst_type_t rburst;
    rand bit [3:0] rcache;
    rand lock_t rlock;
    rand bit [2:0] rprot;
    rand bit [1:0] rrespQ[$:16];

//axi_tx : print, copy, compare, 
    function void print(input string name="");
            $display("###################Printing AXI_TX ###################");
        if (tx_type == WRITE) begin
            $display("Printing %s Write fields",name);
            $display("write_id = %h", wid);
            $display("write_addr = %h", waddr);
            $display("write_dataQ = %p", wdataQ);
            $display("write_len = %h", wlen);
            $display("write_size = %h", wsize);
            $display("write_burst = %s", wburst);
        end
        if (tx_type == READ) begin
            $display("Printing %s Read fields",name);
            $display("read_id = %h", rid);
            $display("read_addr = %h", raddr);
            $display("read_dataQ = %p", rdataQ);
            $display("read_len = %h", rlen);
            $display("read_size = %h", rsize);
            $display("read_burst = %s", rburst);
        end
        if (tx_type == READ_WRITE) begin
            $display("Printing %s Write fields",name);
            $display("write_id = %h", wid);
            $display("write_addr = %h", waddr);
            $display("write_dataQ = %p", wdataQ);
            $display("write_len = %h", wlen);
            $display("write_size = %h", wsize);
            $display("write_burst = %s", wburst);

            $display("Printing %s Read fields",name);
            $display("read_id = %h", rid);
            $display("read_addr = %h", raddr);
            $display("read_dataQ = %p", rdataQ);
            $display("read_len = %h", rlen);
            $display("read_size = %h", rsize);
            $display("read_burst = %s", rburst);
        end
    endfunction

    function void copy(output axi_tx tx);
        tx = new();
    	//write channels fields
        tx.tx_type = this.tx_type; 
        tx.waddr = this.waddr; 
		tx.wid = this.wid; 
     	tx.waddr = this.waddr;
     	foreach(this.wdataQ[i]) begin
			tx.wdataQ[i] = this.wdataQ[i];
		end
     	//foreach(this.wstrbQ[i]) begin
	    //	tx.wstrbQ[i] = this.wstrQ[i];
		//end
   		tx.wlen = this.wlen;
   		tx.wsize = this.wsize;
   		tx.wburst = this.wburst;
     	tx.wcache = this.wcache; 
     	tx.wlock = this.wlock;
     	tx.wprot = this.wprot;
     	tx.wresp = this.wresp;
    	//read channels fields
   		tx.rid = this.rid; 
   		tx.raddr = this.raddr;
   		tx.rdataQ = this.rdataQ;
   		tx.rlen	= this.rlen;
   		tx.rsize = this.rsize;
   		tx.rburst = this.rburst;
   		tx.rcache = this.rcache;
   		tx.rlock = this.rlock;
   		tx.rprot = this.rprot;
   		tx.rrespQ = this.rrespQ;
    endfunction

    function bit compare(axi_tx tx);
        if ( tx.tx_type != this.tx_type ) begin
            $display("FAILED : Tx type does not match!");
            return 0;
        end
        case (tx_type)
            WRITE : begin
                if (
                    tx.waddr != this.waddr ||
                    tx.wid != this.wid ||
                    tx.wlock != this.wlock ||
                    tx.wcache != this.wcache ||
                    tx.wlen != this.wlen ||
                    tx.wsize != this.wsize ||
                    tx.wburst != this.wburst
                    //also compare wdataQ, wstrbQ, wresp
                ) begin
                    $display("FAILED : Write Tx fields does not match");
                    return 0;
                end
            end
            READ : begin
                if (
                    tx.raddr != this.raddr ||
                    tx.rid != this.rid ||
                    tx.rlock != this.rlock ||
                    tx.rcache != this.rcache ||
                    tx.rlen != this.rlen ||
                    tx.rsize != this.rsize ||
                    tx.rburst != this.rburst
                    //rdataQ
                ) begin
                    $display("FAILED : Write Tx fields does not match");
                    return 0;
                end
            end
            READ_WRITE : begin
            end
        endcase
    endfunction

//constraints
    constraint awsize_c { soft wsize inside {0,1,2}; }
    constraint wdataQ_c { wdataQ.size() == wlen + 1;}
    constraint wstrbQ_c { wstrbQ.size() == wlen + 1;}
    constraint rdataQ_c { rdataQ.size() == rlen + 1;}
    constraint rrespQ_c { rrespQ.size() == rlen + 1;}
    constraint wprot_c {wprot != 2'b11;}
    constraint rprot_c {rprot != 2'b11;}
	constraint soft_c {
		soft wburst == INCR;
		soft rburst == INCR;
		soft wlock == NORMAL;
		soft rlock == NORMAL;
	}
    constraint aligned_c {if(wburst == WRAP) waddr%(2**wsize) == 0;
						  else soft waddr%(2**wsize) == 0;
	}
	constraint wstrb_c { 
		if(wsize==0) {foreach(wstrbQ[i]) {$countones(wstrbQ[i])==1};} 
		if(wsize==1) {foreach(wstrbQ[i]) {wstrbQ[i] inside {4'b0011,4'b1100}};} 
		if(wsize==2) {foreach(wstrbQ[i]) {$countones(wstrbQ[i])==4};} 
	}

	constraint addr_range_c {soft waddr inside {[32'h0000_0000:32'h0000_FFFF]};}
	constraint boundary_4kb_c { waddr%4096 + (2**wsize * (wlen+1)) <= 4096;}
endclass


