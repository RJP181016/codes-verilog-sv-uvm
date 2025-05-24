class eth_ill_pkt extends eth_pkt;
static int count_ill;

function new();
	count_ill++;
endfunction

function void print(string name="eth_pkt");
	super.print("eth_ill_pkt");
	$display("\tcount_ill=%0d\n",count_ill);
endfunction

endclass
