class eth_bfm;
eth_good_pkt g_pkt;
eth_bad_pkt b_pkt;
eth_ill_pkt i_pkt;
eth_pkt pkt;
mailbox gen2bfm;

function new(mailbox mb);
	gen2bfm=mb;
endfunction

task run();
forever begin	
	gen2bfm.get(pkt);
	pkt.print();
end
endtask
endclass
