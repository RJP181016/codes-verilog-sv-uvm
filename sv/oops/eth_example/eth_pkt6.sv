class eth_pkt;
protected rand bit [47:0] sa;
protected rand bit [9:0] len;
protected static int count;

function new();
	count++;
endfunction

virtual function void print(string name="eth_pkt");
	$display("printing %s fields",name);
	$display("\tsa=%h",sa);
	$display("\tlen=%0d",len);
	$display("\tcount=%0d\n",count);
endfunction

constraint len_c{
	len inside {[20:40]};
}
endclass


