class driver extends uvm_driver#(packet);
`uvm_component_utils(driver)
bit [31:0] pkt_id;
virtual memory_if.tb vif;

function new (string name="driver",uvm_component parent);
	super.new(name,parent);
endfunction

extern virtual task run_phase(uvm_phase phase);
extern virtual function void connect_phase(uvm_phase phase);
extern virtual task write(input packet pkt);
extern virtual task read(input packet pkt);
extern virtual task drive_reset();
extern virtual task drive_config(packet pkt);
extern virtual task ral_write(packet pkt);
extern virtual task ral_read (ref packet pkt);
extern virtual task drive_stimulus(packet pkt);
endclass

task driver::run_phase(uvm_phase phase);
forever begin
seq_item_port.get_next_item(req);
pkt_id++;
`uvm_info("DRVR",$sformatf("Received Transaction(%0s) %0d from TLM port \n",req.mode.name(),pkt_id),UVM_MEDIUM);
rsp=packet::type_id::create("rsp",this);
case (req.mode) 
    RESET: drive_reset();
    CONFIG : drive_config(req);
    REG_WRITE: ral_write(req);
    REG_READ : ral_read(req);
    default: drive_stimulus(req);
endcase
seq_item_port.item_done();
`uvm_info("DRVR",$sformatf("Driver Transaction(%0s) %0d Done \n",req.mode.name(),pkt_id),UVM_MEDIUM);
end
endtask

task driver::drive_stimulus(packet pkt);
write(req);
rsp.slv_rsp=vif.slv_rsp == 1'b1 ? OK : ERROR ; 
read(req);
rsp.set_id_info(req);
seq_item_port.put_response(rsp);
endtask


function void driver::connect_phase(uvm_phase phase);
super.connect_phase(phase);
uvm_config_db#(virtual memory_if.tb)::get(get_parent(),"","drvr_if",vif);
if(vif == null) begin 
`uvm_fatal("VIF_ERR","Virtual interface in driver is NULL ");
end
endfunction

task driver::write(input packet pkt);
@(vif.cb);
`uvm_info(get_type_name()," Write transaction started...",UVM_FULL);
vif.cb.wr      <= 1'b1;
vif.cb.addr    <= pkt.addr;
vif.cb.wdata   <= pkt.data;
@(vif.cb);
`uvm_info(get_type_name(),$sformatf("Write transaction addr=%0d data=%0d ended ",pkt.addr,pkt.data),UVM_HIGH);
endtask

task driver::read(input packet pkt);
`uvm_info(get_type_name()," Read transaction started...",UVM_FULL);
vif.cb.wr      <= 1'b0;
vif.cb.addr    <= pkt.addr;
@(vif.cb);
vif.cb.wr      <= 1'bx;
`uvm_info(get_type_name()," Read transaction ended ",UVM_HIGH);
endtask

task driver::drive_reset();
`uvm_info(get_type_name(),"Reset transaction started...",UVM_FULL);
vif.reset      <= 1'b1;
repeat (2) @(vif.cb);
vif.reset      <= 1'b0;
`uvm_info(get_type_name(),"Reset transaction ended ",UVM_HIGH);
endtask

task driver::drive_config(packet pkt);
`uvm_info(get_type_name(),"Configuration transaction started...",UVM_FULL);
vif.cb.addr <= pkt.addr;
vif.cb.wdata <= pkt.data;
vif.cb.wr <= 1'b1;
repeat (2) @(vif.cb);
`uvm_info(get_type_name(),"Configration transaction ended ",UVM_HIGH);
endtask

task driver::ral_write(packet pkt);
`uvm_info(get_type_name(),"Configuration RAL_WRITE transaction started...",UVM_FULL);
vif.cb.addr <= pkt.addr;
vif.cb.wdata <= pkt.data;
vif.cb.wr <= 1'b1;
repeat (1) @(vif.cb);
`uvm_info(get_type_name(),"Configration RAL_WRITE transaction ended ",UVM_HIGH);
endtask

task driver::ral_read(ref packet pkt);
`uvm_info(get_type_name(),"Configuration RAL_READ transaction started...",UVM_FULL);
@(vif.cb);
vif.cb.addr <= pkt.addr;
vif.cb.wr <= 1'b0;
repeat (2) @(vif.cb);
pkt.data=vif.cb.rdata;
`uvm_info(get_type_name(),"Configration RAL_READ transaction ended ",UVM_HIGH);
endtask



