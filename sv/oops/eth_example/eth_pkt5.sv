class eth_pkt;
protected bit [7:0] sof;
protected rand bit [15:0] len;
protected static int count;

function new();
	count++;
	sof=8'b1010_1011;
endfunction

function void print(string name="eth_pkt");
	$display("printing %s fields",name);
	$display("\tsof=%h",sof);
	$display("\tlen=%0d",len);
	$display("\tcount=%0d\n",count);
endfunction

constraint len_c{
	len inside {[20:40]};
}
endclass


