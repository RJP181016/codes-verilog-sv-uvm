class eth_bad_pkt extends eth_pkt;
static int count_bad;

function new();
	count_bad++;
endfunction

function void print(string name="eth_pkt");
	super.print("eth_bad_pkt");
	$display("\tcount_bad=%0d\n",count_bad);
endfunction

endclass
