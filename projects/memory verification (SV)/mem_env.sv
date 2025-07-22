class mem_env;
mem_agent agentDA[];
mem_mon mon=new();
mem_cov cov=new();
mem_sbd sbd=new();

function new();
	agentDA=new[mem_common::num_agents];
	foreach(agentDA[i]) agentDA[i]=new(i);
endfunction

task run();
fork
	mon.run();
	cov.run();
	sbd.run();
join_none

for(int i=0;i<mem_common::num_agents;i++) begin
automatic int j;
j=i;
	fork
		agentDA[j].run();
	join_none
	//#0;
end
wait fork;
endtask

endclass
