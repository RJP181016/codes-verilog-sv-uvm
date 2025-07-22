//get txs from monitor through mailbox
class mem_cov;
mem_tx tx;

	covergroup mem_cg;
		ADDR_CP : coverpoint tx.addr {
			bins LOW_RANGE = {[0:50]};
			bins MID_RANGE = {[51:100]};
			bins HIGH_RANGE = {[101:200]};
			bins VERY_HIGH_RANGE = {[201:254]};
			illegal_bins ILL = {255};
		}
		WT_RD_CP : coverpoint tx.wt_rd; 
		cross ADDR_CP,WT_RD_CP;
	endgroup

	function new();
		mem_cg=new();
	endfunction

	task run();
		forever begin
			mem_common::mon2cov.get(tx);
			mem_cg.sample();
		end
	endtask

endclass
