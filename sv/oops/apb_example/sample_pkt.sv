typedef enum bit[1:0]{
	SMALL=2'b00,
	MEDIUM=2'b01,
	LARGE=2'b10
}pkt_type_t;

class eth_pkt;
rand pkt_type_t pkt_type;
protected bit [55:0]preamble;
protected rand bit [47:0]sa;
protected rand bit [7:0]len;
protected rand bit [7:0]payload[$];
protected static int count;

//methods
function new();
	preamble={28{2'b10}};
	count++;
endfunction

function void print(string name="eth_pkt");
	$display("printing %s fields",name);
	$display("\tpkt_type=%s",pkt_type);
	$display("\tpreamble=%h",preamble);
	$display("\tsa=%h",sa);
	$display("\tlen=%0d",len);
	$display("\tpayload=%p",payload);
	$display("\tcount=%0d\n",count);
endfunction

function void copy(output eth_pkt pkt);
	pkt=new();
	pkt.pkt_type=pkt_type;
	pkt.preamble=preamble;
	pkt.sa=sa;
	pkt.len=len;
	foreach(payload[i])
		pkt.payload[i]=payload[i];
	pkt.count=count;
endfunction

function bit compare(eth_pkt pkt);
	if (pkt_type==pkt.pkt_type && preamble==pkt.preamble && sa==pkt.sa && len==pkt.len && payload==pkt.payload && count==pkt.count) begin
		$display("pkt fields are matching");
		return 1;
	end
	else begin
		$display("pkt fields are not matching");
		return 0;
	end
endfunction

function void pack(output byte byteQ[$]);
	byteQ={>>byte{preamble,sa,len,payload}};
	$display("\nbyteQ=%p\n",byteQ);
endfunction

function void unpack(input byte byteQ[$]);
	preamble={byteQ[0],byteQ[1],byteQ[2],byteQ[3],byteQ[4],byteQ[5],byteQ[6]};
	sa={byteQ[7],byteQ[8],byteQ[9],byteQ[10],byteQ[11],byteQ[12]};
	len=byteQ[13];
	for(int i=0;i<len;i++) begin
		payload[i]=byteQ[14+i];
	end
	if(len inside {[1:20]}) pkt_type=SMALL;
	if(len inside {[21:100]}) pkt_type=MEDIUM;
	if(len inside {[101:255]}) pkt_type=LARGE;

endfunction

//constraints
constraint sa_con{
	sa inside{[100:150]};
}
constraint payload_con{
	payload.size()==len;	
	foreach(payload[i]) {
		payload[i] inside{8'h1F,8'h5F};
	}
}

constraint pkt_type_con{
	(pkt_type==SMALL)->(len inside{[1:20]});
	(pkt_type==MEDIUM)->(len inside{[21:100]});
	(pkt_type==LARGE)->(len inside{[101:255]});
}

endclass




module top();
eth_pkt pkt1,pkt2,pkt3;
byte byteQ[$];
initial begin

pkt1=new();
pkt2=new();
pkt3=new();

assert(pkt1.randomize());
pkt1.print("pkt1");
assert(pkt2.randomize());
pkt2.print("pkt2");
assert(pkt3.randomize());
pkt3.print("pkt3");


$display("################compare 1##################");
pkt1.compare(pkt2);
pkt1.copy(pkt2);
pkt1.compare(pkt2);
pkt1.print("pkt1");
pkt2.print("pkt2");

$display("################compare 2##################");
pkt1.compare(pkt3);
pkt1.pack(byteQ);
pkt3=new();//important //without allocating memory ==>> let say pkt3 payload contain 195 values, if pack & unpack the pkt1 fields which payload field contain 51 values, then these 51 values will be replaced in 1st 51 values in 195 payload values in pkt3.But pkt3 payload field contain 195 values.
pkt3.unpack(byteQ);
pkt3.print("pkt3");
pkt1.compare(pkt3);


end

endmodule
