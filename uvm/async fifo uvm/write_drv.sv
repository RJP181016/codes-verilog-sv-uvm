class write_drv extends uvm_driver#(write_tx);
`uvm_component_utils(write_drv);
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


task drive_tx(write_tx tx);
  @(posedge vif.wt_clk iff(!vif.rst));
  vif.wt_en <= 1;
  vif.wdata <= tx.wdata;
  @(posedge vif.wt_clk);
  vif.wt_en <=0;
endtask

endclass
