class mem_agent;
mem_gen gen;
mem_bfm bfm;

function new(int i);
	gen=new(i);
	bfm=new(i);
endfunction

task run();
fork
	begin 
	if(gen!=null) gen.run();
	else $fatal("gen null");
	end
	bfm.run();
join
endtask
endclass
