class phy_rx_drv extends uvm_driver#(eth_frame);
    `uvm_component_utils(phy_rx_drv); 
    `NEW_COMP

    virtual phy_intf vif; 
	real clk_tp;

    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
        uvm_resource_db#(virtual phy_intf)::read_by_name("GLOBAL", "PHY_VIF", vif, this);
        if(!uvm_resource_db#(int)::read_by_name("GLOBAL", "PHY_CLK_TP", clk_tp, this)) clk_tp=40;
    endfunction 

    task run_phase(uvm_phase phase); 
	fork
        forever begin 
			#(clk_tp/2.0) vif.mrx_clk_pad_i = ~vif.mrx_clk_pad_i;
        end
        forever begin 
			seq_item_port.get_next_item(req);
			//req.print();
			case(req.frame_type)
				ETH_FRAME: drive_frame(req);
				COLL_DET: drive_coll_det(req.coll_det_delay);
				PAUSE_FRAME: drive_pause_frame(req,req.pause_frame_delay);
			endcase
			seq_item_port.item_done();
		end
	join
    endtask 

	task drive_frame(eth_frame frame);
		nibble_t nibbleQ[$];
		nibble_t temp;
		nibbleQ = {>>nibble_t{frame.preamble,frame.sfd,frame.payload,frame.crc}};
		//toggle the even and odd nibble positions
		for(int i=0; i<nibbleQ.size()/2; i++) begin
			temp = nibbleQ[2*i];
			nibbleQ[2*i]=nibbleQ[2*i+1];
			nibbleQ[2*i+1]=temp;
		end
		//Idle cycle => to set startpreamble=1
		repeat(8) begin
			@(posedge vif.mrx_clk_pad_i);
			vif.mrxd_pad_i = 4'h0;
			vif.mrxdv_pad_i = 1'b1;
		end
		//drive the nibbles	
		foreach(nibbleQ[i]) begin
			@(posedge vif.mrx_clk_pad_i);
			vif.mrxd_pad_i = nibbleQ[i];
			vif.mrxdv_pad_i = 1;
		end
		@(posedge vif.mrx_clk_pad_i);
		vif.mrxd_pad_i = 0;
		vif.mrxdv_pad_i = 0;
	endtask


	task drive_coll_det(int delay);
		#delay;
		vif.mcoll_pad_i = 1;
		#50;
		vif.mcoll_pad_i = 0;
	endtask
	

	task drive_pause_frame(eth_frame frame,int delay);
		nibble_t nibbleQ[$];
		nibble_t temp;
		nibbleQ = {>>nibble_t{frame.preamble,frame.sfd,frame.da,frame.sa,frame.type_len,frame.opcode,frame.pausetimer,frame.crc}};
		//toggle the even and odd nibble positions
		for(int i=0; i<nibbleQ.size()/2; i++) begin
			temp = nibbleQ[2*i];
			nibbleQ[2*i]=nibbleQ[2*i+1];
			nibbleQ[2*i+1]=temp;
		end
		#delay;
		////Idle cycle => to set startpreamble=1
		repeat(8) begin
			@(posedge vif.mrx_clk_pad_i);
			vif.mrxd_pad_i = 4'h0;
			vif.mrxdv_pad_i = 1'b1;
		end
		//drive the nibbles	
		foreach(nibbleQ[i]) begin
			@(posedge vif.mrx_clk_pad_i);
			vif.mrxd_pad_i = nibbleQ[i];
			vif.mrxdv_pad_i = 1;
		end
		@(posedge vif.mrx_clk_pad_i);
		vif.mrxd_pad_i = 0;
		vif.mrxdv_pad_i = 0;
	endtask
endclass




