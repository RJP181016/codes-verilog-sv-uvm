class phy_tx_mon extends uvm_monitor;
    `uvm_component_utils(phy_tx_mon); 
    `NEW_COMP

    virtual phy_intf vif; 
	uvm_analysis_port#(eth_frame) ap_port;
	eth_frame frame;

	bit frame_collect_in_progress_f;
	bit [7:0] byte_collected;
	int nibble_count;
	byte byteQ[$];

	mac_reg_block mac_rm;
	uvm_reg_data_t reg_data;

    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
        uvm_resource_db#(virtual phy_intf)::read_by_name("GLOBAL", "PHY_VIF", vif, this);
		uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", mac_rm, this);
		ap_port=new("ap_port",this);
    endfunction 

    task run_phase(uvm_phase phase); 
		forever begin
			@(vif.tx_mon_cb);
			if(vif.tx_mon_cb.mtxen_pad_o==1) begin
				frame_collect_in_progress_f =1;
				nibble_count++;
				if(nibble_count%2==1) byte_collected[3:0] = vif.tx_mon_cb.mtxd_pad_o;
				if(nibble_count%2==0) begin
					byte_collected[7:4] = vif.tx_mon_cb.mtxd_pad_o;
					byteQ.push_back(byte_collected);
				end
			end
			if(frame_collect_in_progress_f==1 && vif.tx_mon_cb.mtxen_pad_o==0) begin
				frame=eth_frame::type_id::create("phy_mon frame");
				frame_collect_in_progress_f=0;
				nibble_count=0;
				reg_data=mac_rm.moder.get();
				if(reg_data[13]==1) {>>byte{frame.preamble,frame.sfd,frame.payload,frame.crc}}=byteQ;
				else {>>byte{frame.preamble,frame.sfd,frame.payload}}=byteQ;
				//frame.print();
				ap_port.write(frame);
			end
		end
    endtask 
endclass



