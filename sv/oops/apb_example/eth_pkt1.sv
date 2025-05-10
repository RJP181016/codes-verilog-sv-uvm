class eth_pkt;
local bit [55:0]preamble;
local bit [7:0]sof;
rand protected bit [47:0]da;
rand protected bit [47:0]sa;
rand bit [15:0]len;
rand bit [7:0]payload[$];
	 bit [31:0]crc;

function new();
	preamble={28{2'b10}};
	sof=8'b1010_1011;
endfunction

function void set_preamble(bit [55:0]preamble1);
	preamble=preamble1;
endfunction

function void set_sof(bit [7:0]sof1);
	sof=sof1;
endfunction

function void set_da(bit [47:0]da_set);
	da=da_set;
endfunction

function void get_da(output bit [47:0] da_get);
	da_get=da;
endfunction

function void set_sa(bit [47:0]sa1);
	sa=sa1;
endfunction

function void get_sa(output bit [47:0] sa_get);
	sa_get=sa;
endfunction


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

constraint len_payload_con{
	len inside{[42:150]};
	payload.size()== len;
}

endclass

//inheritance
class eth_ext_pkt extends eth_pkt;


function new();
	//preamble=100;		//Error (suppressible): (vlog-8688) eth_pkt1.sv(50): Illegal access to local member preamble.
	//sof=200;			//Error (suppressible): (vlog-8688) eth_pkt1.sv(51): Illegal access to local member sof.
	
	set_preamble(100);
	set_sof(200);
endfunction

endclass




//top module
module top();
bit [47:0]da_get;
bit [47:0]sa_get;
eth_ext_pkt pkt=new;

initial begin
	pkt.print("pkt with new");
	assert(pkt.randomize());
	pkt.print("pkt after randomization");
	
	//pkt.preamble=100;					//Error (suppressible): (vlog-8688) eth_pkt1.sv(43): Illegal access to local member preamble.
	//pkt.sof=200;						//Error (suppressible): (vlog-8688) eth_pkt1.sv(44): Illegal access to local member sof.
	//pkt.print("pkt after updating preamble and sof");
	pkt.print("pkt after updating preamble and sof in extended class");
	
	//pkt.da=48'hfffffffffff;			//Error (suppressible): (vlog-8688) eth_pkt1.sv(59): Illegal access to protected member da.
	//pkt.sa=48'heeeeeeeeeee;			//Error (suppressible): (vlog-8688) eth_pkt1.sv(60): Illegal access to protected member sa.
	//pkt.print("pkt after updating da and sa");
	//how can we update da and sa?
	pkt.set_da(48'hfffffffffff);
	pkt.set_sa(48'heeeeeeeeeee);
	pkt.print("pkt after updating da and sa");

	//$display("pkt.da=%h",pkt.da);		//Error (suppressible): (vlog-8688) eth_pkt1.sv(94): Illegal access to protected member da.
	//$display("pkt.sa=%h",pkt.sa);		//Error (suppressible): (vlog-8688) eth_pkt1.sv(95): Illegal access to protected member sa.
	pkt.get_da(da_get);
	pkt.get_sa(sa_get);
	$display("pkt.da=%h",da_get);	
	$display("pkt.sa=%h",sa_get);





end

endmodule
