class eth_good_pkt extends eth_pkt;
static int count_good;
string count="eth_good_pkt count";

function void print(string name="eth_good_pkt");
	super.print(name);
	$display("\tcount_good=%0d",count_good);
	$display("\tcount=%0d",super.count);
	$display("\tcount=%0d",this.count);
endfunction
constraint len_c{
	len inside {[60:80]};
}
endclass
