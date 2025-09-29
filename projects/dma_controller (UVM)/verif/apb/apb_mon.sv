class apb_mon extends uvm_monitor;
`uvm_component_utils(apb_mon)
`NEW_COMP
virtual apb_intf vif;
apb_tx tx;
uvm_analysis_port#(apb_tx) ap_port;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_resource_db#(virtual apb_intf)::read_by_name("GLOBAL","apb_pif",vif,this);
	ap_port = new("ap_port",this);
endfunction

task run_phase(uvm_phase phase);
	forever begin
		@(posedge vif.clk);
		if(~vif.penable && vif.pready) begin
			tx=apb_tx::type_id::create("tx");
			tx.addr = vif.paddr;
			tx.wr_rd=vif.pwrite;
			if(vif.pwrite==1) tx.data = vif.pwdata;
			if(vif.pwrite==0) tx.data = vif.prdata;
			ap_port.write(tx);
		end
	end
endtask
endclass
