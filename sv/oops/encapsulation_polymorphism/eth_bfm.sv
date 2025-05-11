class eth_bfm;
eth_good_pkt g_pkt;
eth_bad_pkt b_pkt;
eth_ill_pkt i_pkt;
eth_pkt pkt;

task run();
repeat(10) begin
	eth_common::gen2bfm_mb.get(pkt);
	pkt.print();
end
endtask

endclass
