class eth_env;
mailbox mbox=new();
eth_gen gen=new(mbox);
eth_bfm bfm=new(mbox);

task run(string testcase,int count);
fork
	gen.run(testcase,count);
	bfm.run();
join
endtask
endclass
