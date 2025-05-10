class eth_pkt;
local bit [55:0]preamble;
local bit [7:0]sof;
rand bit [47:0]da;
rand bit [47:0]sa;
rand bit [15:0]len;
rand bit [7:0]payload[$];
	 bit [31:0]crc;

function void print(string name="eth_pkt");
	$display("Printing %s fields",name);
	$display("\tpreamble=%h",preamble);
	$display("\tsof=%h",sof);
	$display("\tda=%h",da);
	$display("\tsa=%h",sa);
	$display("\tlen=%0d",len);
	foreach(payload[i]) begin
		$display("\tpayload[%0d]=%h",i,payload[i]);
	end
	$display("\tcrc=%h",crc);
endfunction

function new();
	preamble={28{2'b10}};
	sof=8'b1010_1011;
endfunction

constraint len_payload_con{
	len inside{[42:150]};
	payload.size()== len;
}

endclass


module top();
eth_pkt pkt=new;

initial begin
	pkt.print("pkt with new");
	assert(pkt.randomize());
	pkt.print("pkt");

end

endmodule
