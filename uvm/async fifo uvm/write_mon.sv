class write_mon extends uvm_monitor;
`uvm_component_utils(write_mon)
`NEW_COMP
  
virtual fifo_intf vif;
write_tx tx;
uvm_analysis_port#(write_tx) mon_ap;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
  if(!uvm_resource_db#(virtual fifo_intf)::read_by_name("GLOBAL","vif",vif,this)) begin
    `uvm_error(get_type_name(),"unable to retrive vif")
	end
  mon_ap=new("mon_ap",this);
  tx=write_tx::type_id::create("tx",this);
endfunction

task run_phase(uvm_phase phase);
  forever begin
    @(vif.wt_cb iff(!vif.rst));
    if(vif.wt_cb.wt_en==1) begin
      tx.wt_en = vif.wt_cb.wt_en;
      tx.wdata = vif.wt_cb.wdata;
      tx.full = vif.wt_cb.full;
      tx.overflow = vif.wt_cb.overflow;
      mon_ap.write(tx);
    end
  end
endtask
endclass
