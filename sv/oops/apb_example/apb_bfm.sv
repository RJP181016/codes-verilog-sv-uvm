class apb_bfm;
apb_tx tx;

task run();
repeat(10) begin
	tx=new();
	mbox.get(tx);
end
endtask
endclass
