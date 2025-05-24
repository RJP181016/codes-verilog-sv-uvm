typedef class eth_pkt;
typedef class eth_good_pkt;
typedef class eth_bad_pkt;
typedef class eth_ill_pkt;
typedef class eth_gen;
typedef class eth_bfm;

`include "eth_common.sv"
`include "eth_bad_pkt.sv"
`include "eth_bfm.sv"
`include "eth_env.sv"
`include "eth_gen.sv"
`include "eth_good_pkt.sv"
`include "eth_ill_pkt.sv"
`include "eth_pkt.sv"
module top;
eth_env env=new();
event e;
string testcase;
int count;

initial begin
	@(e);
	env.run(testcase,count);
end

initial begin
	$value$plusargs("testcase=%s",testcase);
	$value$plusargs("count=%0d",count);
	->e;

	#100;
	$finish;
end

endmodule
