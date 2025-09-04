class iMonitor extends uvm_monitor;
`uvm_component_utils(iMonitor)

virtual memory_if.tb_mon_in vif;
// This TLM port is used to connect the monitor to the scoreboard
uvm_analysis_port #(packet) analysis_port;

// Current monitored transaction
packet pkt;

function new (string name="iMonitor",uvm_component parent);
	super.new(name,parent);
endfunction

extern virtual task run_phase(uvm_phase phase);
extern virtual function void build_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
endclass 

function void iMonitor::build_phase(uvm_phase phase) ;
	super.build_phase(phase);
    analysis_port=new("analysis_port",this);
endfunction
function void iMonitor::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
	if (!uvm_config_db#(virtual memory_if.tb_mon_in)::get(get_parent(), "", "iMon_if", vif)) begin
          `uvm_fatal(get_type_name(), "iMonitor DUT interface not set");
         end
endfunction

task iMonitor::run_phase(uvm_phase phase);
    // The job of the iMonitor is to passively monitor the physical signals,
    // interprete and report the activities that it sees.  In this case, to
    // re-construct the packet that it sees on the DUT's input port as specified
    forever begin
        @(vif.cb_mon_in.wdata);
	pkt = packet::type_id::create("pkt",this);
	pkt.addr  = vif.cb_mon_in.addr;
	pkt.data  = vif.cb_mon_in.wdata;//write data
        `uvm_info(get_type_name(),pkt.convert2string(),UVM_MEDIUM);
	analysis_port.write(pkt);
     end

endtask 

