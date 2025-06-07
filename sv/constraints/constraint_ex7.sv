//soft constraint
class eth_pkt;
rand int len;

constraint C1_c {
	soft len inside {[42:1500]};
}

endclass 


module top;
eth_pkt pkt=new();

initial begin
	assert(pkt.randomize() with {len==2000;});
	$display("pkt=%p",pkt);
end



endmodule


