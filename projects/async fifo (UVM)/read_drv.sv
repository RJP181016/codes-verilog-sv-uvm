class read_drv extends uvm_driver#(read_tx);
`uvm_component_utils(read_drv);
`NEW_COMP
virtual fifo_intf vif;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	if(!uvm_resource_db#(virtual fifo_intf)::read_by_name("GLOBAL","vif",vif,this)) begin
	`uvm_error(get_type_name(),"Unable to retrive vif")
	end
endfunction

task run_phase(uvm_phase phase);
forever begin
	seq_item_port.get_next_item(req);
	drive_tx(req);
	seq_item_port.item_done();
end
endtask


task drive_tx(read_tx tx);
  @(posedge vif.rd_clk iff(!vif.rst));
  vif.rd_en <= 1;
  tx.rdata <= vif.rdata;
  @(posedge vif.rd_clk);
  vif.rd_en <=0;
endtask

endclass

