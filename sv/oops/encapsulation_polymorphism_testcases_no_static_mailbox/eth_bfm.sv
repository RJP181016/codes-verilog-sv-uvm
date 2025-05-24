class eth_bfm;
eth_good_pkt g_pkt;
eth_bad_pkt b_pkt;
eth_ill_pkt i_pkt;
eth_pkt pkt;
mailbox gen2bfm_mb;

function new(mailbox mb);
	gen2bfm_mb=mb;
endfunction

task run();
//repeat(10) begin
forever begin
	gen2bfm_mb.get(pkt);
	pkt.print();
end
endtask

endclass
