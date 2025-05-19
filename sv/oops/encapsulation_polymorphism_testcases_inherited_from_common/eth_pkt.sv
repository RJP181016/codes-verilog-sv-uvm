class eth_pkt;
protected static int count;
protected rand bit [9:0]len;
protected rand bit [7:0] payload[$];

function new();
	count++;
endfunction

virtual function void print(string name="eth_pkt");
	$display("printing %s fields",name);
	$display("\tcount=%0d",count);
	$display("\tlen=%0d",len);
	$display("\tpayload=%p\n",payload);
endfunction

constraint len_con{
	len inside{[15:25]};
}

constraint payload_con{
	payload.size()==len;
}

endclass
