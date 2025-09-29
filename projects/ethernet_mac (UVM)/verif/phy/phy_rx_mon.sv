class phy_rx_mon extends uvm_monitor;
    `uvm_component_utils(phy_rx_mon); 
    `NEW_COMP

    virtual phy_intf vif; 
	uvm_analysis_port#(eth_frame) ap_port;
	eth_frame frame;

    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
        uvm_resource_db#(virtual phy_intf)::read_by_name("GLOBAL", "PHY_VIF", vif, this);
		ap_port=new("ap_port",this);
    endfunction 

    task run_phase(uvm_phase phase); 
	bit ignore_initial_0s = 1;
	bit nibbleQ_data_valid;
	nibble_t nibbleQ[$];
	forever begin
		@(vif.rx_mon_cb);
		if(vif.rx_mon_cb.mrxdv_pad_i) begin
			nibbleQ_data_valid=1;
			if(!(ignore_initial_0s && vif.rx_mon_cb.mrxd_pad_i==4'h0)) begin
				ignore_initial_0s=0;
				nibbleQ.push_back(vif.rx_mon_cb.mrxd_pad_i);
			end
		end
		else begin
			if(nibbleQ_data_valid==1) begin
				frame=eth_frame::type_id::create("phy_rx_mon frame");
				for(int i=0;i<nibbleQ.size()/2;i++) begin
					{nibbleQ[2*i],nibbleQ[2*i+1]}={nibbleQ[2*i+1],nibbleQ[2*i]};
				end
				{>>nibble_t{frame.preamble,frame.sfd,frame.payload,frame.crc}}=nibbleQ;
				nibbleQ_data_valid = 0;
				//frame.print();
				ap_port.write(frame);
			end
		end
	end
    endtask 
endclass



