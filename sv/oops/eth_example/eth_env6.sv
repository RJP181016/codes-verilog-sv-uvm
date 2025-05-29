class eth_env;
mailbox mbox=new();
eth_gen gen=new(mbox);
eth_bfm bfm=new(mbox);

task run(string testname);
fork
	gen.run(testname);
	bfm.run();
join
endtask
endclass
