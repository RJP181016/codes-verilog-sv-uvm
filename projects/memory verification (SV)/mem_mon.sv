//1. check the interface at every +edge for valid tx, collect txs from interface
//2. put those txs into mailbox for reference model and coverage
class mem_mon;
virtual mem_intf.mon_mp vif;
mem_tx tx;

function new();
	vif=mem_common::vif;	//top.pif;
endfunction

task run();
	forever begin
		@(vif.mon_cb);
		if (vif.mon_cb.valid && vif.mon_cb.ready) begin
			tx=new();
			tx.addr=vif.mon_cb.addr;
			tx.data=vif.mon_cb.wt_rd ? vif.mon_cb.wdata : vif.mon_cb.rdata;
			tx.wt_rd=vif.mon_cb.wt_rd;

			mem_common::mon2ref.put(tx);
			mem_common::mon2cov.put(tx);
		end

	end
endtask

endclass
