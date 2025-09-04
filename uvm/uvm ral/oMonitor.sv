class oMonitor extends uvm_monitor;
`uvm_component_utils(oMonitor)

virtual memory_if.tb_mon_out vif;
// This TLM port is used to connect the monitor to the scoreboard
uvm_analysis_port #(packet) analysis_port;

// Current monitored transaction
packet pkt;

function new (string name="oMonitor",uvm_component parent);
	super.new(name,parent);
endfunction

extern virtual task run_phase(uvm_phase phase);
extern virtual function void build_phase(uvm_phase phase);
endclass 

function void oMonitor::build_phase(uvm_phase phase) ;
super.build_phase(phase);
if (!uvm_config_db#(virtual memory_if.tb_mon_out)::get(get_parent(), "", "oMon_if", vif)) 
  begin
  `uvm_fatal(get_type_name(), "oMonitor DUT interface not set");
 end
//create TLM port
    analysis_port=new("analysis_port",this);
endfunction

task oMonitor::run_phase(uvm_phase phase);
    // The job of the oMonitor is to passively monitor the physical signals,
    // interprete and report the activities that it sees.  In this case, to
    // re-construct the packet that it sees on the DUT's output port as specified
    forever begin
	 @(vif.cb_mon_out.rdata);
	if(vif.cb_mon_out.addr=='h18) continue;//csr1_wr_count

	//skip the loop when data_out is in high impedance state
	if(vif.cb_mon_out.rdata === 'z || vif.cb_mon_out.rdata === 'x)
	    continue;

	pkt = packet::type_id::create("pkt",this);
	pkt.addr  = vif.cb_mon_out.addr;
	pkt.data  = vif.cb_mon_out.rdata;//read data

        `uvm_info(get_type_name(),pkt.convert2string(),UVM_MEDIUM);
	analysis_port.write(pkt);
     end

endtask 

