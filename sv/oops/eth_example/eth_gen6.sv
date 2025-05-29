typedef enum bit[2:0] {
	good_pkt=3'b000,
	bad_pkt,
	ill_pkt
} pkt_type_t;

class eth_gen;
eth_good_pkt g_pkt;
eth_bad_pkt b_pkt;
eth_ill_pkt i_pkt;
//bit [2:0] pkt_type;
pkt_type_t pkt_type;
mailbox gen2bfm;

function new(mailbox mb);
	gen2bfm=mb;
endfunction

task run(string testname="test_random_pkts");
case(testname)
	"test_all_good_pkts": begin
		for(int i=0;i<eth_common::pkt_count;i++) begin
			g_pkt=new();
			assert(g_pkt.randomize());
			gen2bfm.put(g_pkt);
		end
	end
	"test_all_bad_pkts": begin
		for(int i=0;i<eth_common::pkt_count;i++) begin
			b_pkt=new();
			assert(b_pkt.randomize());
			gen2bfm.put(b_pkt);
		end
	end
	"test_all_ill_pkts": begin
		for(int i=0;i<eth_common::pkt_count;i++) begin
			i_pkt=new();
			assert(i_pkt.randomize());
			gen2bfm.put(i_pkt);
		end
	end
	"test_random_pkts": begin
		for(int i=0;i<eth_common::pkt_count;i++) begin
			pkt_type=pkt_type_t'($urandom_range(0,2));
			case(pkt_type) 
				good_pkt: begin
					g_pkt=new();
					assert(g_pkt.randomize());
					gen2bfm.put(g_pkt);
				end
				bad_pkt: begin
					b_pkt=new();
					assert(b_pkt.randomize());
					gen2bfm.put(b_pkt);
				end
				ill_pkt: begin
					i_pkt=new();
					assert(i_pkt.randomize());
					gen2bfm.put(i_pkt);
				end
			endcase
		end
	end
endcase
	
endtask
endclass
