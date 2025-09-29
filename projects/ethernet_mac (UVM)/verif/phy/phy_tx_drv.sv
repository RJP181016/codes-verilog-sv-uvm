class phy_tx_drv extends uvm_driver#(eth_frame); 
    `uvm_component_utils(phy_tx_drv); 
    `NEW_COMP

    virtual phy_intf vif; 
	real clk_tp;
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
        if(!uvm_resource_db#(int)::read_by_name("GLOBAL", "PHY_CLK_TP", clk_tp, this)) clk_tp=40;
		uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", mac_rm, this);
    endfunction 

    task run_phase(uvm_phase phase); 
	fork
        forever begin 
			#(clk_tp/2.0) vif.mtx_clk_pad_i = ~vif.mtx_clk_pad_i;
        end
		forever begin
			@(posedge vif.mtx_clk_pad_i);
			if(vif.mtxen_pad_o==1) begin
				frame_collect_in_progress_f =1;
				nibble_count++;
				if(nibble_count%2==1) byte_collected[3:0] = vif.mtxd_pad_o;
				if(nibble_count%2==0) begin
					byte_collected[7:4] = vif.mtxd_pad_o;
					byteQ.push_back(byte_collected);
				end
			end
			if(frame_collect_in_progress_f==1 && vif.mtxen_pad_o==0) begin
				frame=new("phy_drv frame");
				frame_collect_in_progress_f=0;
				nibble_count=0;
				reg_data=mac_rm.moder.get();
				if(reg_data[13]==1) {>>byte{frame.preamble,frame.sfd,frame.payload,frame.crc}}=byteQ;
				else {>>byte{frame.preamble,frame.sfd,frame.payload}}=byteQ;
				//frame.print();
			end
		end
	join
    endtask 

endclass



