class eth_gen extends eth_common;
eth_good_pkt g_pkt;
eth_bad_pkt b_pkt;
eth_ill_pkt i_pkt;
bit [2:0]pkt_type;

task run();
case(testcase)
	"test_all_good_pkts": begin
		for(int i=0;i<count;i++) begin
			g_pkt=new();
			assert(g_pkt.randomize());
			gen2bfm_mb.put(g_pkt);
		end
	
	end
	"test_all_bad_pkts": begin
		for(int i=0;i<count;i++) begin
			b_pkt=new();
			assert(b_pkt.randomize());
			gen2bfm_mb.put(b_pkt);
		end
	
	end
	"test_all_ill_pkts": begin
		for(int i=0;i<count;i++) begin
			i_pkt=new();
			assert(i_pkt.randomize());
			gen2bfm_mb.put(i_pkt);
		end
	
	end
	"test_random_pkts": begin
		for(int i=0;i<count;i++) begin
			pkt_type=$urandom_range(0,2);
			case(pkt_type)
				0: begin
					g_pkt=new();
					assert(g_pkt.randomize());
					gen2bfm_mb.put(g_pkt);
				end
				1: begin
					b_pkt=new();
					assert(b_pkt.randomize());
					gen2bfm_mb.put(b_pkt);
				end
				2: begin
					i_pkt=new();
					assert(i_pkt.randomize());
					gen2bfm_mb.put(i_pkt);
				end
			endcase
		end
	end
endcase
endtask

endclass
