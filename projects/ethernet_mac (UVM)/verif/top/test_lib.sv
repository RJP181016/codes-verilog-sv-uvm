class mac_base_test extends uvm_test; 
    `uvm_component_utils(mac_base_test); 
    `NEW_COMP 
    ethmac_env env; 

    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
		uvm_reg::include_coverage("*",UVM_CVR_ALL,this);
        env = ethmac_env::type_id::create("env", this);
    endfunction 

    function void end_of_elaboration_phase(uvm_phase phase); 
        uvm_top.print_topology();
    endfunction 
endclass 


//register read test
class mac_reg_read_test extends mac_base_test; 
    `uvm_component_utils(mac_reg_read_test); 
    `NEW_COMP 
 
    task run_phase(uvm_phase phase); 
       wb_reg_read_seq read_seq;
       read_seq = wb_reg_read_seq::type_id::create("read_seq");
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 100); 
       read_seq.start(env.proc_agent_i.sqr);
       phase.drop_objection(this);
    endtask
endclass  


//register write read test
class mac_reg_write_read_test extends mac_base_test; 
    `uvm_component_utils(mac_reg_write_read_test); 
    `NEW_COMP 
 
    task run_phase(uvm_phase phase); 
       wb_reg_write_read_seq write_read_seq;
       write_read_seq = wb_reg_write_read_seq::type_id::create("write_read_seq");
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 100); 
       write_read_seq.start(env.proc_agent_i.sqr);
       phase.drop_objection(this);
    endtask
endclass 


//register read using register model test 
class mac_reg_read_rm_test extends mac_base_test; 
    `uvm_component_utils(mac_reg_read_rm_test); 
    `NEW_COMP 
 
    task run_phase(uvm_phase phase); 
       wb_reg_rd_rm_seq read_rm_seq;
       read_rm_seq = wb_reg_rd_rm_seq::type_id::create("read_rm_seq");
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 100); 
       read_rm_seq.start(env.proc_agent_i.sqr);
       phase.drop_objection(this);
    endtask
endclass 


//register write read using register model test 
class mac_reg_write_read_rm_test extends mac_base_test; 
    `uvm_component_utils(mac_reg_write_read_rm_test); 
    `NEW_COMP 
 
    task run_phase(uvm_phase phase); 
       wb_reg_wt_rd_rm_seq write_read_rm_seq;
       write_read_rm_seq = wb_reg_wt_rd_rm_seq::type_id::create("write_read_rm_seq");
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 100); 
       write_read_rm_seq.start(env.proc_agent_i.sqr);
       phase.drop_objection(this);
    endtask
endclass 


//10Mbps full duplex trasmit test
class mac_10mbps_fd_tx_test extends mac_base_test; 
    `uvm_component_utils(mac_10mbps_fd_tx_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//10Mhz => TP in ns = 1000/freq * 4 bits(bus size) = 400ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 400, this);
		ethmac_common::exp_int_src_reg_val=7'b000_0001;
	endfunction

    task run_phase(uvm_phase phase); 
       mac_fd_tx_seq fd_tx_seq = mac_fd_tx_seq::type_id::create("fd_tx_seq");
       mac_isr_seq isr_seq = mac_isr_seq::type_id::create("isr_seq");
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 3000); 
	   fork
       		isr_seq.start(env.proc_agent_i.sqr);
	   join_none
       fd_tx_seq.start(env.proc_agent_i.sqr);
	   wait(ethmac_common::int_o_generated==1);
       phase.drop_objection(this);
    endtask
endclass


//100Mbps full duplex trasmit test
class mac_100mbps_fd_tx_test extends mac_base_test; 
    `uvm_component_utils(mac_100mbps_fd_tx_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//100Mhz => TP in ns = 1000/freq * 4 bits(bus size)= 40ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 40, this);
		ethmac_common::exp_int_src_reg_val=7'b000_0001;
	endfunction


    task run_phase(uvm_phase phase); 
       mac_fd_tx_seq fd_tx_seq = mac_fd_tx_seq::type_id::create("fd_tx_seq");
       mac_isr_seq isr_seq = mac_isr_seq::type_id::create("isr_seq");
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 3000); 
	   fork
       		isr_seq.start(env.proc_agent_i.sqr);
	   join_none
       fd_tx_seq.start(env.proc_agent_i.sqr);
	   wait(ethmac_common::int_o_generated==1);
       phase.drop_objection(this);
    endtask
endclass


//full duplex recieve test
class mac_fd_rx_test extends mac_base_test; 
    `uvm_component_utils(mac_fd_rx_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//100Mhz => TP in ns = 1000/freq * 4 bits(bus size)= 40ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 40, this);
		ethmac_common::exp_int_src_reg_val=7'b000_0100;
	endfunction

    task run_phase(uvm_phase phase); 
       mac_fd_rx_seq fd_rx_seq = mac_fd_rx_seq::type_id::create("fd_rx_seq");
       mac_isr_seq isr_seq = mac_isr_seq::type_id::create("isr_seq");
	   phy_rx_gen_frame_seq rx_gen_frame_seq = phy_rx_gen_frame_seq::type_id::create("rx_gen_frame_seq");
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 1000); 
	   fork
       isr_seq.start(env.proc_agent_i.sqr);
	   join_none
       fd_rx_seq.start(env.proc_agent_i.sqr);
       rx_gen_frame_seq.start(env.phy_rx_agent_i.sqr);
	   wait(ethmac_common::int_o_generated==1);
       phase.drop_objection(this);
    endtask
endclass


//full duplex transmit recieve test
class mac_fd_tx_rx_test extends mac_base_test; 
    `uvm_component_utils(mac_fd_tx_rx_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//100Mhz => TP in ns = 1000/freq * 4 bits(bus size)= 40ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 40, this);
	endfunction

    task run_phase(uvm_phase phase); 
       	mac_fd_tx_rx_seq fd_tx_rx_seq = mac_fd_tx_rx_seq::type_id::create("fd_tx_rx_seq");
       	mac_isr_seq isr_seq = mac_isr_seq::type_id::create("isr_seq");
	   	phy_rx_gen_frame_seq rx_gen_frame_seq = phy_rx_gen_frame_seq::type_id::create("rx_gen_frame_seq");
       	phase.raise_objection(this); 
       	phase.phase_done.set_drain_time(this, 500); 
	   	fork
       	isr_seq.start(env.proc_agent_i.sqr);
	   	join_none
       	fd_tx_rx_seq.start(env.proc_agent_i.sqr);
       	rx_gen_frame_seq.start(env.phy_rx_agent_i.sqr);
		ethmac_common::exp_int_src_reg_val=7'b000_0100;
	   	wait(ethmac_common::int_o_generated==1);
		#100;
		ethmac_common::exp_int_src_reg_val=7'b000_0001;
	   	wait(ethmac_common::int_o_generated==1);
       	phase.drop_objection(this);
    endtask
endclass


//------------------------------->//half duplex transmit recieve test
class mac_hd_tx_rx_test extends mac_base_test; 
    `uvm_component_utils(mac_hd_tx_rx_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//100Mhz => TP in ns = 1000/freq * 4 bits(bus size)= 40ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 40, this);
	endfunction

    task run_phase(uvm_phase phase); 
       	mac_hd_tx_rx_seq hd_tx_rx_seq = mac_hd_tx_rx_seq::type_id::create("hd_tx_rx_seq");
       	mac_isr_seq isr_seq = mac_isr_seq::type_id::create("isr_seq");
	   	phy_rx_gen_frame_seq rx_gen_frame_seq = phy_rx_gen_frame_seq::type_id::create("rx_gen_frame_seq");
       	phase.raise_objection(this); 
       	phase.phase_done.set_drain_time(this, 500); 
	   	fork
       	isr_seq.start(env.proc_agent_i.sqr);
	   	join_none
       	hd_tx_rx_seq.start(env.proc_agent_i.sqr);
       	rx_gen_frame_seq.start(env.phy_rx_agent_i.sqr);
		ethmac_common::exp_int_src_reg_val=7'b000_0100;
	   	wait(ethmac_common::int_o_generated==1);
		#100;
		ethmac_common::exp_int_src_reg_val=7'b000_0001;
	   	wait(ethmac_common::int_o_generated==1);
       	phase.drop_objection(this);
    endtask
endclass


//collision detection test
class mac_collision_detect_test extends mac_base_test; 
    `uvm_component_utils(mac_collision_detect_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//100Mhz => TP in ns = 1000/freq * 4 bits(bus size)= 40ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 40, this);
		ethmac_common::exp_int_src_reg_val=7'b000_0001;
	endfunction


    task run_phase(uvm_phase phase); 
       mac_hd_tx_seq hd_tx_seq = mac_hd_tx_seq::type_id::create("hd_tx_seq");
       mac_isr_seq isr_seq = mac_isr_seq::type_id::create("isr_seq");
	   phy_coll_det_seq coll_det_seq = phy_coll_det_seq::type_id::create("coll_det_seq");
	   coll_det_seq.randomize() with {delay == 1700;};
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 500); 
	   
	   fork
       		isr_seq.start(env.proc_agent_i.sqr);
	   join_none
       hd_tx_seq.start(env.proc_agent_i.sqr);
       coll_det_seq.start(env.phy_rx_agent_i.sqr);

	   wait(ethmac_common::int_o_generated==1);
       phase.drop_objection(this);
    endtask
endclass


//mii write control data to phy test
class mac_mii_wr_ctrl_data_test extends mac_base_test; 
    `uvm_component_utils(mac_mii_wr_ctrl_data_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//100Mhz => TP in ns = 1000/freq * 4 bits(bus size)= 40ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 40, this);
	endfunction

    task run_phase(uvm_phase phase); 
       	mac_mii_wr_ctrl_data_seq mii_wr_ctrl_data_seq = mac_mii_wr_ctrl_data_seq::type_id::create("mii_wr_ctrl_data_seq");
       	phase.raise_objection(this); 
       	phase.phase_done.set_drain_time(this, 10000); 
       	mii_wr_ctrl_data_seq.start(env.proc_agent_i.sqr);
       	phase.drop_objection(this);
    endtask
endclass

//------------------------------>//pause_frame test
class mac_fd_tx_pause_frame_test extends mac_base_test; 
    `uvm_component_utils(mac_fd_tx_pause_frame_test); 
    `NEW_COMP 
 	
	function void build_phase(uvm_phase phase);
		super.build_phase(phase);
		//100Mhz => TP in ns = 1000/freq * 4 bits(bus size)= 40ns
		uvm_resource_db#(int)::set("GLOBAL", "PHY_CLK_TP", 40, this);
		ethmac_common::exp_int_src_reg_val=7'b000_0001;
	endfunction


    task run_phase(uvm_phase phase); 
       mac_fd_tx_pause_frame_seq fd_tx_pause_frame_seq = mac_fd_tx_pause_frame_seq::type_id::create("fd_tx_pause_frame_seq");
       mac_isr_seq isr_seq = mac_isr_seq::type_id::create("isr_seq");
	   phy_pause_frame_seq pause_frame_seq = phy_pause_frame_seq::type_id::create("pause_frame_seq");
	   pause_frame_seq.randomize() with {delay == 3000;};
       phase.raise_objection(this); 
       phase.phase_done.set_drain_time(this, 500); 
	   
	   fork
       		isr_seq.start(env.proc_agent_i.sqr);
	   join_none
       fd_tx_pause_frame_seq.start(env.proc_agent_i.sqr);
       pause_frame_seq.start(env.phy_rx_agent_i.sqr);

	   wait(ethmac_common::int_o_generated==1);
       phase.drop_objection(this);
    endtask
endclass



