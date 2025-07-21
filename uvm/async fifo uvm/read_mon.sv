class read_mon extends uvm_monitor;
`uvm_component_utils(read_mon)
`NEW_COMP

read_tx tx;
virtual fifo_intf vif;
uvm_analysis_port#(read_tx) mon_ap;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
    if(!uvm_resource_db#(virtual fifo_intf)::read_by_name("GLOBAL","vif",vif,this)) begin
	  `uvm_error(get_type_name(),"Unable to retrive vif")
	end
	mon_ap=new("mon_ap",this);
    tx=read_tx::type_id::create("tx",this);
endfunction

task run_phase(uvm_phase phase);
  forever begin
    @(vif.rd_cb iff(!vif.rst));
    if(vif.rd_cb.rd_en) begin
      tx.rd_en = vif.rd_cb.rd_en;
      tx.empty = vif.rd_cb.empty;
  	  tx.underflow = vif.rd_cb.underflow;
      tx.rdata = vif.rd_cb.rdata;
      //if(vif.rd_cb.underflow==1) tx.rdata = 0;
      mon_ap.write(tx); 
    end
  end
endtask

endclass

