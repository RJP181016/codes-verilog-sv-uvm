class eth_good_pkt extends eth_pkt;
static int count_good;

function new();
	count_good++;
endfunction

function void print(string name="eth_pkt");
	super.print("eth_good_pkt");
	$display("\tcount_good=%0d\n",count_good);
endfunction

endclass
