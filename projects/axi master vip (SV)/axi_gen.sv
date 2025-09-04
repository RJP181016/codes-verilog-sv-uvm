class axi_gen;
    axi_tx tx, tx_t;
    axi_tx wrtxQ[$];
    axi_tx tx_resp;
    task run();
        $display("axi_gen :: run");
        case (axi_cfg::testname)
			"SINGLE_WRITE_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.wlen ==0;});
                axi_cfg::gen2bfm.put(tx);
			end
			"SINGLE_READ_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.wlen == 0;});
                axi_cfg::gen2bfm.put(tx);
                $cast (tx_t, tx);
                tx = new();
                assert(tx.randomize() with {tx.tx_type == READ; 
                                			tx.raddr == tx_t.waddr; 
                                			tx.rlen == 0; 
                                			tx.rsize == tx_t.wsize; 
                                			tx.rburst == tx_t.wburst;}
                                			);
                axi_cfg::gen2bfm.put(tx);
	
			end
			"10_WRITE_READ" : begin
				repeat(10) begin
                	tx = new();
                	assert(tx.randomize() with {tx.tx_type == WRITE;});
                	axi_cfg::gen2bfm.put(tx);
                	$cast (tx_t, tx);
                	tx = new();
                	assert(tx.randomize() with {tx.tx_type == READ; 
                	                			tx.raddr == tx_t.waddr; 
                	                			tx.rlen == tx_t.wlen; 
                	                			tx.rsize == tx_t.wsize; 
                	                			tx.rburst == tx_t.wburst;}
                	                			);
                	axi_cfg::gen2bfm.put(tx);
            	end
			end
			"WRAP_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.waddr == 32'h00003334; tx.wburst == WRAP; tx.wlen == 7; tx.wsize == 2;});
                axi_cfg::gen2bfm.put(tx);
               	$cast (tx_t, tx);
               	tx = new();
               	assert(tx.randomize() with {tx.tx_type == READ; 
               	                			tx.raddr == tx_t.waddr; 
                	                		tx.rlen == tx_t.wlen; 
                	                		tx.rsize == tx_t.wsize; 
                	                		tx.rburst == tx_t.wburst;}
                	                		);
               	axi_cfg::gen2bfm.put(tx);	
			end
			"INCR_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.waddr == 32'h00003334; tx.wburst == INCR; tx.wlen == 7; tx.wsize == 2;});
                axi_cfg::gen2bfm.put(tx);
               	$cast (tx_t, tx);
               	tx = new();
               	assert(tx.randomize() with {tx.tx_type == READ; 
               	                			tx.raddr == tx_t.waddr; 
                	                		tx.rlen == tx_t.wlen; 
                	                		tx.rsize == tx_t.wsize; 
                	                		tx.rburst == tx_t.wburst;}
                	                		);
               	axi_cfg::gen2bfm.put(tx);	
			end
			"FIXED_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.waddr == 32'h00003334; tx.wburst == FIXED; tx.wlen == 7; tx.wsize == 2;});
                axi_cfg::gen2bfm.put(tx);
               	$cast (tx_t, tx);
               	tx = new();
               	assert(tx.randomize() with {tx.tx_type == READ; 
               	                			tx.raddr == tx_t.waddr; 
                	                		tx.rlen == tx_t.wlen; 
                	                		tx.rsize == tx_t.wsize; 
                	                		tx.rburst == tx_t.wburst;}
                	                		);
               	axi_cfg::gen2bfm.put(tx);	
			end
			"WRITE_ALIGNED_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.waddr == 32'h00003320; tx.wsize == 2; tx.wlen == 7;});
                axi_cfg::gen2bfm.put(tx);
			end
			"WRITE_UNALIGNED_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.waddr == 32'h00003321; tx.wsize == 2; tx.wlen == 7;});
                axi_cfg::gen2bfm.put(tx);	
			end
			"NARROW_TRANSFER_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.wsize == 0;});
                axi_cfg::gen2bfm.put(tx);
				$cast (tx_t, tx);
               	tx = new();
               	assert(tx.randomize() with {tx.tx_type == READ; 
               	                			tx.raddr == tx_t.waddr; 
                	                		tx.rlen == tx_t.wlen; 
                	                		tx.rsize == tx_t.wsize; 
                	                		tx.rburst == tx_t.wburst;}
                	                		);
               	axi_cfg::gen2bfm.put(tx);
			end
			"INTERLEAVED_AND_OUT_OF_ORDER" : begin
                tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.wlen == 15;});
                axi_cfg::gen2bfm.put(tx);
                tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.rlen == 3;});
                axi_cfg::gen2bfm.put(tx);
            end
			"SLAVE_ERROR_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.wsize == 3;});	//unsupported transfer size
                axi_cfg::gen2bfm.put(tx);
				tx = new();
                assert(tx.randomize() with {tx.tx_type == READ; tx.rsize == 3;});	//unsupported transfer size
                axi_cfg::gen2bfm.put(tx);
			end
			"DECODE_ERROR_TEST" : begin
				tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.waddr == 32'h0001_0000; tx.wsize == 2;});	//unsupported address range
                axi_cfg::gen2bfm.put(tx);
				tx = new();
                assert(tx.randomize() with {tx.tx_type == READ; tx.waddr == 32'h0001_0000; tx.rsize == 2;});	//unsupported address range
                axi_cfg::gen2bfm.put(tx);
			end
			"4KB_BOUNDARY_TEST" : begin
				tx = new();
				tx.boundary_4kb_c.constraint_mode(0);
                assert(tx.randomize() with {tx.tx_type == WRITE; tx.wburst == INCR; tx.waddr == 32'h00000FFF;});	//crossing 4kb boundary
                axi_cfg::gen2bfm.put(tx);
			end
            "TEST_10_WR_10_RD_COMPARE_TX" : begin
                //read 10 times from same 10 locaitons above
                //then compare the data that is written to data that is read

               //write 10 times to random locations
               for (int i = 0; i < 10; i++) begin
                tx = new();
                assert(tx.randomize() with {tx.tx_type == WRITE;});
                axi_cfg::gen2bfm.put(tx);
                wrtxQ.push_back(tx); //stroing the tx's into Q, so that it will be used for readtx & for comapre
               end
                //now Q has 10 tx's, each of type write tx
               //read 10 times to same locations as of write
               for (int i = 0; i < 10; i++) begin
                tx = new();
                assert(tx.randomize() with {
                    tx.tx_type == READ;
                    tx.raddr == wrtxQ[i].waddr; //in 1st iteration of read, I shoule 1st element of Q
                    tx.rlen == wrtxQ[i].wlen; //in 1st iteration of read, I shoule 1st element of Q
                    tx.rburst == wrtxQ[i].wburst; //in 1st iteration of read, I shoule 1st element of Q
                    tx.rprot == wrtxQ[i].wprot; //in 1st iteration of read, I shoule 1st element of Q
                    tx.rcache == wrtxQ[i].wcache; //in 1st iteration of read, I shoule 1st element of Q
                    tx.rsize == wrtxQ[i].wsize; //in 1st iteration of read, I shoule 1st element of Q
                      }); //??
                axi_cfg::gen2bfm.put(tx);
               end
               //Compare
               //what all things to compare?  len, data
               for (int i = 0; i < 10; i++) begin
                   axi_cfg::bfm2gen.get(tx_resp);
                   //I need to compare tx_resp with tx done durign write phase(not read cycle)
                   //compare addr
                   if (wrtxQ[i].waddr != tx_resp.raddr) begin
                       $display("FAILED : Address does not match");
                       return;
                   end
                   if (wrtxQ[i].wdataQ.size() != tx_resp.rdataQ.size()) begin
                       $display("FAILED : DataQ size does not match, WriteDataQ.Size=%d, ReadDataQ.Size= %d", wrtxQ[i].wdataQ.size(), tx_resp.rdataQ.size());
                       return;  //no need to do further compares
                   end
                   foreach (wrtxQ[i].wdataQ[i]) begin
                       if (wrtxQ[i].wdataQ[i] != tx_resp.rdataQ[i]) begin
                           $display("FAILED : Data value does not match, WriteData=%h, ReadData= %h", wrtxQ[i].wdataQ[i], tx_resp.rdataQ[i]);
                           return;  //no need to do further compares
                       end
                   end
               end
            end
        endcase
    endtask
endclass

