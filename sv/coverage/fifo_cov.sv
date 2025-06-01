mailbox mbox=new();

class fifo_tx;
rand bit full;
rand bit empty;
rand bit wt;
rand bit rd;
endclass

class fifo_cov;
fifo_tx tx;

covergroup fifi_cg;
	FULL_CP: coverpoint tx.full {
		bins FULL={1'b1};
		bins NOT_FULL={1'b0};
		option.at_least=10;
	}
	EMPTY_CP: coverpoint tx.empty {
		bins EMPTY={1'b1};
		bins NOT_EMPTY={1'b0};
	}
	WT_CP: coverpoint tx.wt iff (tx.wt==1) {
		bins WRITE={1'b1};
	}
	RD_CP: coverpoint tx.rd {
		bins READ={1'b1};
		bins allother=default;
	}
	FULL_CP_X_WT_CP: cross FULL_CP,WT_CP {
		bins WT_NOT_FULL= binsof(WT_CP.WRITE) && binsof(FULL_CP.NOT_FULL);
		illegal_bins WT_FULL= binsof(WT_CP.WRITE) && binsof(FULL_CP.FULL);
	}
	EMPTY_CP_X_RD_CP: cross EMPTY_CP,RD_CP {
		bins WT_NOT_EMPTY= binsof(RD_CP.READ) && binsof(EMPTY_CP.NOT_EMPTY);
		illegal_bins WT_EMPTY= binsof(RD_CP.READ) && binsof(EMPTY_CP.EMPTY);
	}
endgroup

function new();
	fifi_cg=new();
endfunction

task run();
	forever begin
		mbox.get(tx);
		fifi_cg.sample();
	end
endtask

endclass

module top;
fifo_tx tx;
fifo_cov cov=new();

initial begin
fork
	repeat(20) begin
		tx=new();
		assert(tx.randomize());
		mbox.put(tx);
		$display("%t: tx=%p",$time,tx);
		#10;
	end
	cov.run();
join
end

endmodule
