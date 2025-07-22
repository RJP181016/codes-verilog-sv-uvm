class mem_bfm;
virtual mem_intf.bfm_mp vif;
mem_tx tx;
int bfm_num;

function new(int i);
	vif=mem_common::vif;	//top.pif;
	bfm_num=i;
endfunction

task run();
forever begin
	mem_common::gen2bfmDA[bfm_num].get(tx);
	mem_common::smp.get(1);
	drive_tx(tx);
	mem_common::smp.put(1);
	mem_common::total_tx_driven++;
end
endtask

task drive_tx(mem_tx tx);
	@(vif.bfm_cb);
	vif.bfm_cb.addr<=tx.addr;
	if(tx.wt_rd==1) vif.bfm_cb.wdata<=tx.data;
	vif.bfm_cb.wt_rd<=tx.wt_rd;
	vif.bfm_cb.valid<=1;
	wait(vif.bfm_cb.ready==1);
	if(tx.wt_rd==0) tx.data=vif.bfm_cb.rdata;
	$display("%t: BFM#%0d is doing %s at addr=%h, data=%h",$time,bfm_num,tx.wt_rd?"write":"read",tx.addr,tx.data);
	@(vif.bfm_cb);
	vif.bfm_cb.addr<=0;
	vif.bfm_cb.wdata<=0;
	vif.bfm_cb.wt_rd<=0;
	vif.bfm_cb.valid<=0;
endtask

endclass
