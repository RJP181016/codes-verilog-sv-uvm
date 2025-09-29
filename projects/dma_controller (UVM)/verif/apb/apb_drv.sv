class apb_drv extends uvm_driver#(apb_tx);
`uvm_component_utils(apb_drv)
`NEW_COMP
virtual apb_intf vif;
virtual periph_intf pvif;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_resource_db#(virtual apb_intf)::read_by_name("GLOBAL","apb_pif",vif,this);
	uvm_resource_db#(virtual periph_intf)::read_by_name("GLOBAL","periph_pif",pvif,this);
endfunction

task run_phase(uvm_phase phase);
fork
forever begin
	seq_item_port.get_next_item(req);
	if(req.periph_transfer_f==0) drive_tx(req);
	else begin
		pvif.periph_tx_req = req.periph_tx_req;
		pvif.periph_rx_req = req.periph_rx_req;
	end
	seq_item_port.item_done();
end
forever begin
	@(posedge pvif.clk);
	if(pvif.periph_rx_clr[1]==1) begin
		pvif.periph_rx_req[1]=0;
	end
	if(pvif.periph_tx_clr[1]==1) begin
		pvif.periph_tx_req[1]=0;
	end
end
join
endtask

task drive_tx(apb_tx tx);
	@(vif.master_cb);
	vif.master_cb.paddr <= tx.addr;
	vif.master_cb.pwrite <= tx.wr_rd;
	if(tx.wr_rd == 1) vif.master_cb.pwdata <= tx.data;
	vif.master_cb.penable <= 0;	//penable is implemented as active low signal in DMA ctrl
	vif.master_cb.psel <= 1;
	wait(vif.master_cb.pready == 1);
	if(tx.wr_rd==0) tx.data <= vif.master_cb.prdata;
	@(vif.master_cb);
	vif.master_cb.paddr <= 0;
	if(tx.wr_rd == 1) vif.master_cb.pwdata <= 0;
	vif.master_cb.pwrite <= 0;
	vif.master_cb.penable <= 1;
	vif.master_cb.psel <= 0;
endtask
endclass
