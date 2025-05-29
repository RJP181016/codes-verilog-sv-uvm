typedef class eth_pkt;
typedef class eth_good_pkt;
typedef class eth_bad_pkt;
typedef class eth_ill_pkt;
typedef class eth_gen;
typedef class eth_bfm;

`include "eth_common6.sv"
`include "eth_good_pkt6.sv"
`include "eth_bad_pkt6.sv"
`include "eth_ill_pkt6.sv"
`include "eth_gen6.sv"
`include "eth_bfm6.sv"
`include "eth_env6.sv"
`include "eth_pkt6.sv"
module top;
eth_env env=new();
string testname;
event e;

initial begin
	@(e);
	env.run(testname);
end

initial begin
	$value$plusargs("testname=%s",testname);
	->e;
	#100;
	$finish;
end
endmodule
