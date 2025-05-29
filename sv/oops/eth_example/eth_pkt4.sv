class eth_common;
static string testname;
endclass

////////////////////////////////////////////////////////////////
class eth_pkt extends eth_common;
local static int count;
protected randc bit [1:0] sof;
protected rand bit [47:0] da;
protected rand bit [15:0] len;
protected rand bit [7:0] payload[$];
protected bit [31:0] crc;

function new();
	count++;
endfunction

extern function void len_u(bit [15:0] length);
extern function void print(string name="eth_pkt",int i=0);
extern function void copy(eth_pkt pkt);
//extern function void copy(output eth_pkt pkt);
extern function void compare(eth_pkt pkt);
extern function void pack(output bit bitQ[$]);
extern function void unpack(input bit bitQ[$]);
extern function void pre_randomize();
extern function void post_randomize();
extern function bit [31:0] calc_crc(bit [7:0] data[$]);

constraint len_con{
	len inside{[42:150]};
}

constraint payload_con{
	payload.size()==len;
}

endclass

////////////////////////////////////////////////////////////////////////
class eth_new_pkt extends eth_pkt;
string len;

function void print(string name="eth_new_pkt",int i=0);
	super.print(name,i);
	$display("len from base class=%0d\n",super.len);
endfunction

endclass

////////////////////////////////////////////////////////////////////////
module top;
eth_new_pkt pkt1[10],pkt2[10],pkt3[10];
bit bitQ[$];

initial begin
	$value$plusargs("testname=%s",eth_common::testname);
	foreach(pkt1[i]) begin
		pkt1[i]=new();
		pkt2[i]=new();
		pkt3[i]=new();
	end
	foreach(pkt1[i]) begin
		assert(pkt1[i].randomize());
	end
	
	foreach(pkt1[i]) begin
		pkt1[i].print("pkt1",i);
		pkt1[i].pack(bitQ);
		foreach(bitQ[i]) begin
			bitQ[i]=bitQ[i]+1;
		end
		pkt2[i]=new();
		pkt2[i].unpack(bitQ);
		pkt2[i].print("pkt2",i);
		pkt1[i].compare(pkt2[i]);
	end

end

endmodule


///////////////////////////////////////////////////////////////////////////


function void eth_pkt::len_u(bit [15:0] length);
	len=length;
endfunction

function void eth_pkt::print(string name="eth_pkt",int i=0);
	$display("%0t: printing %s[%0d] fields",$time,name,i);
	$display("\tsof=%0d",sof);
	$display("\tda=%h",da);
	$display("\tlen=%0d",len);
	$display("\tpayload=%p",payload);
	$display("\tcrc=%h",crc);
	$display("\tcount=%0d\n",count);
endfunction

function void eth_pkt::copy(eth_pkt pkt);
	pkt.sof = sof;
    pkt.da = da;
    pkt.len = len;
    pkt.payload = payload;
    pkt.crc = crc;
endfunction

function void eth_pkt::compare(eth_pkt pkt);
	if(pkt.sof==sof && pkt.da==da && pkt.len==len && pkt.payload==payload && pkt.crc==crc) $display("pkt fields are matching\n");
	else $display("pkt fields are not matching\n");
endfunction

function void eth_pkt::pack(output bit bitQ[$]);
	bitQ={>>bit{sof,da,len,payload,crc}};
	//$display("\nbitQ=%p\n",bitQ);
endfunction

function void eth_pkt::unpack(input bit bitQ[$]);
	{>>bit{sof,da,len,payload,crc}}=bitQ;
endfunction

function void eth_pkt::pre_randomize();
	$display("pre_randomize");
	case(testname)
		"test_len_rand_disabled": begin
			len.rand_mode(0);
			len_con.constraint_mode(0);
			len_u(10);				//update len in post_randomize
		end
		"test_len_rand_enabled": begin
			len.rand_mode(1);
			len_con.constraint_mode(1);

		end
	endcase
endfunction

function void eth_pkt::post_randomize();
	$display("post_randomize");
	case(testname)
		"test_len_rand_disabled": begin
    		crc = calc_crc(payload);  // Compute CRC after payload generation
			len_u(10);				//update len in post_randomize
		end
		"test_len_rand_enabled": begin
    		crc = calc_crc(payload);  // Compute CRC after payload generation
		end
	endcase
endfunction

function bit [31:0] eth_pkt::calc_crc(bit [7:0] data[$]);
    bit [31:0] crc_reg;
    int i, j;
    bit polynomial = 32'h04C11DB7; // Standard CRC-32 polynomial

    crc_reg = 32'hFFFFFFFF; // Initial value

    foreach (data[i]) begin
      crc_reg ^= (data[i] << 24);
      for (j = 0; j < 8; j++) begin
        crc_reg = (crc_reg & 32'h80000000) ? (crc_reg << 1) ^ polynomial : (crc_reg << 1);
      end
    end

    return crc_reg ^ 32'hFFFFFFFF; // Final XOR
endfunction
