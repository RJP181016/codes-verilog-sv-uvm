class apb_gen;
apb_tx tx;

task run();
repeat(10) begin
	tx=new();
	assert(tx.randomize());
	mbox.put(tx);
end
endtask
endclass
