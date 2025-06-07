`include "mem_cfg.sv"
`include "mem_gen.sv"
module top;
mem_gen gen=new();

initial begin
	$value$plusargs("target_slave=%b",mem_cfg::target_slave);
	$display("target_slave=%b",mem_cfg::target_slave);
	for(int i=0;i<`NUM_SLAVE;i++) begin
		if(mem_cfg::target_slave[i]) begin
			mem_cfg::target_slaveQ.push_back(`NUM_SLAVE'b1<<i);
		end
	end
	$display("target_slaveQ=%p",mem_cfg::target_slaveQ);
	gen.run();

end

endmodule
