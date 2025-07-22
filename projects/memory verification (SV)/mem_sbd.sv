class mem_sbd;
bit [`WIDTH-1:0] mem[*];
mem_tx tx;

task run();
bit [`WIDTH-1:0]tb_data;
forever begin
	mem_common::mon2ref.get(tx);
	if(tx.wt_rd==1) begin
		mem[tx.addr]=tx.data;
	end
	else begin
		if(tx.data == mem[tx.addr]) begin
			mem_common::num_matches++;
		end
		else begin
			$error("read data not matched with data present in TB ref model mem");
			tb_data=mem[tx.addr];
			$display("addr=%h, DUT_data=%h, TB_data=%h",tx.addr,tx.data,tb_data);
			mem_common::num_mismatches++;
		end
	end
end
endtask

endclass
