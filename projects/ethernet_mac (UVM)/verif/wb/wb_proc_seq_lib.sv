class wb_proc_base_seq extends uvm_sequence#(wb_tx);
    `uvm_object_utils(wb_proc_base_seq) 
    `NEW_OBJ

	uvm_reg mac_regs[$];
	uvm_reg_data_t ref_data;
	rand uvm_reg_data_t data;
	uvm_status_e status;
	mac_reg_block mac_rm;
        
    task pre_body();
        if(starting_phase != null) begin
			starting_phase.raise_objection(this);
			starting_phase.phase_done.set_drain_time(this,100);
		end
		uvm_resource_db#(mac_reg_block)::read_by_name("GLOBAL", "MAC_RM", mac_rm, this);
    endtask
       
    task post_body();
    	if(starting_phase != null) starting_phase.drop_objection(this);
    endtask
endclass


//reg read seq
class wb_reg_read_seq extends wb_proc_base_seq; 
    `uvm_object_utils(wb_reg_read_seq)
    `NEW_OBJ 
	wb_tx tx;

    task body(); 
		super.body();
    	for(int i =0; i<21; i++) begin
    	   `uvm_do_with(req, {req.wr_rd == 0; req.addr == i;})
    	end
    endtask 
endclass


//reg write read seq
class wb_reg_write_read_seq extends wb_proc_base_seq; 
    `uvm_object_utils(wb_reg_write_read_seq)
    `NEW_OBJ 

    task body(); 
		bit [31:0] data_t;
    	for(int i =0; i<21; i++) begin
			data_t = $random & ethmac_common::regmaskA[i];	//masking reserved bits
    	   `uvm_do_with(req, {req.wr_rd == 1; req.addr == i; req.data == data_t;})
    	   `uvm_do_with(req, {req.wr_rd == 0; req.addr == i;})
    	end
    endtask 
endclass


//reg read using reg model seq
class wb_reg_rd_rm_seq extends wb_proc_base_seq; 
    `uvm_object_utils(wb_reg_rd_rm_seq)
    `NEW_OBJ 

    task body(); 
		mac_rm.get_registers(mac_regs);
		mac_regs.shuffle();
		foreach(mac_regs[i]) begin
			ref_data = mac_regs[i].get_reset();
			mac_regs[i].read(status, data, .parent(this));
			if(ref_data != data) begin
				ethmac_common::mismatched++;
				`uvm_error(get_full_name(),$sformatf("Reg read(reset) error for %s: Expected: %0h Actual: %0h", mac_regs[i].get_name(),ref_data, data))
			end
			else ethmac_common::matched++; //`uvm_info(get_name(),"Reg reset value matched",UVM_LOW);
		end
    endtask 
endclass


//reg write read using reg model seq
class wb_reg_wt_rd_rm_seq extends wb_proc_base_seq; 
    `uvm_object_utils(wb_reg_wt_rd_rm_seq)
    `NEW_OBJ 

	uvm_reg_data_t miicommand_wr_data;

    task body(); 
		string reg_name;
		mac_rm.get_registers(mac_regs);
		repeat(1) begin
			mac_regs.shuffle();
			foreach(mac_regs[i]) begin
				if(!this.randomize())	`uvm_error(get_full_name(),"randomization error")
				reg_name = mac_regs[i].get_name();
				if(reg_name == "miicommand") miicommand_wr_data = data;
				if(reg_name == "txbdnum") if(data > 8'h80) data = 8'h7F;
				mac_regs[i].write(status, data, .parent(this));
			end
			if(miicommand_wr_data[0] == 1) mac_rm.miistatus.predict(3'b110);
			mac_regs.shuffle();
			foreach(mac_regs[i]) begin
				ref_data = mac_regs[i].get();
				mac_regs[i].read(status, data, .parent(this));
				if(ref_data != data) begin
					`uvm_error(get_full_name(),$sformatf("Reg read error for %s: Expected: %0h Actual: %0h", mac_regs[i].get_name(),ref_data, data))
					ethmac_common::mismatched++;
				end
				else ethmac_common::matched++; //`uvm_info(get_name(),"Reg value matched",UVM_LOW);
			end
		end
    endtask 
endclass


//read interupt source register seq
class mac_isr_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_isr_seq)
    `NEW_OBJ 

	uvm_reg_data_t int_src_reg_data;
	uvm_status_e status;

    task body(); 
		forever begin
			wait(ethmac_common::int_o_generated==1);
			ethmac_common::int_o_generated=0;
			mac_rm.intsrc.read(status, int_src_reg_data, .parent(this));
			if(int_src_reg_data!=ethmac_common::exp_int_src_reg_val) begin
				`uvm_error(get_full_name(),$psprintf("int_src_reg_data mismatch int_src_reg_data = %h, exp_int_src_reg_val = %h",int_src_reg_data,ethmac_common::exp_int_src_reg_val));
			end
			else begin
				mac_rm.intsrc.write(status, int_src_reg_data, .parent(this)); 	//write the register to deassert the interupt
			end
		end
    endtask 
endclass


//full duplex transmit seq
class mac_fd_tx_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_fd_tx_seq)
    `NEW_OBJ 

	rand uvm_reg_data_t moder_data;
	rand uvm_reg_data_t int_mask_data;
	uvm_reg_data_t data_t;

    task body(); 
		//int_mask write
		int_mask_data[0] = 1;	//unmasking transmit buffer interupt
		mac_rm.intmask.write(status, int_mask_data, .parent(this));
	
		//FD mode
		moder_data = 0;
		moder_data[10] = 1;	//full duplex mode
		moder_data[13] = 1;	//crc enable
		mac_rm.moder.write(status, moder_data, .parent(this));

		//TX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h200,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(512 bytes),
		`uvm_do_with(req, {req.addr==10'h100; req.data==data_t; req.wr_rd==1;})			//400 is actual address, but don't drive 400, drive only 100
		data_t = 32'h1000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h101; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//transmit enable
		moder_data[1] = 1;	//TXEN = 1
		mac_rm.moder.write(status, moder_data, .parent(this));
    endtask 
endclass



//full duplex recieve seq
class mac_fd_rx_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_fd_rx_seq)
    `NEW_OBJ 

	rand uvm_reg_data_t moder_data;
	rand uvm_reg_data_t int_mask_data;
	uvm_reg_data_t data_t;

    task body(); 
		//int_mask write
		int_mask_data[2] = 1;	//unmasking recieve buffer interupt
		mac_rm.intmask.write(status, int_mask_data, .parent(this));
	
		//FD mode
		moder_data = 0;
		moder_data[10] = 1;	//full duplex mode
		moder_data[5] = 1;	//promiscus bit
		moder_data[13] = 1;	//crc enable
		mac_rm.moder.write(status, moder_data, .parent(this));

		//RX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h80,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(128 bytes),
		`uvm_do_with(req, {req.addr==10'h180; req.data==data_t; req.wr_rd==1;})			//600 is actual address, but don't drive 600, drive only 180
		data_t = 32'h2000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h181; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//receive enable
		moder_data[0] = 1;	//RXEN = 1
		mac_rm.moder.write(status, moder_data, .parent(this));
    endtask 
endclass


//full duplex transmit recieve seq
class mac_fd_tx_rx_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_fd_tx_rx_seq)
    `NEW_OBJ 

	rand uvm_reg_data_t moder_data;
	rand uvm_reg_data_t int_mask_data;
	uvm_reg_data_t data_t;

    task body(); 
		//int_mask write
		int_mask_data[0] = 1;	//unmasking transmit buffer interupt
		int_mask_data[2] = 1;	//unmasking recieve buffer interupt
		mac_rm.intmask.write(status, int_mask_data, .parent(this));
	
		//FD mode
		moder_data = 0;
		moder_data[10] = 1;	//full duplex mode
		moder_data[5] = 1;	//promiscus bit
		moder_data[13] = 1;	//crc enable
		mac_rm.moder.write(status, moder_data, .parent(this));

		//TX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h200,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(512 bytes),
		`uvm_do_with(req, {req.addr==10'h100; req.data==data_t; req.wr_rd==1;})			//400 is actual address, but don't drive 400, drive only 100
		data_t = 32'h1000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h101; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//RX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h80,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(128 bytes),
		`uvm_do_with(req, {req.addr==10'h180; req.data==data_t; req.wr_rd==1;})			//600 is actual address, but don't drive 600, drive only 180
		data_t = 32'h2000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h181; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//transmit receive enable
		moder_data[0] = 1;	//RXEN = 1
		moder_data[1] = 1;	//TXEN = 1
		mac_rm.moder.write(status, moder_data, .parent(this));
    endtask 
endclass


//---------------------------------->//half duplex transmit recieve seq
class mac_hd_tx_rx_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_hd_tx_rx_seq)
    `NEW_OBJ 

	rand uvm_reg_data_t moder_data;
	rand uvm_reg_data_t int_mask_data;
	uvm_reg_data_t data_t;

    task body(); 
		//int_mask write
		int_mask_data[0] = 1;	//unmasking transmit buffer interupt
		int_mask_data[2] = 1;	//unmasking recieve buffer interupt
		mac_rm.intmask.write(status, int_mask_data, .parent(this));
	
		//HD mode
		moder_data = 17'h0;	
		moder_data[10] = 0;	//half duplex mode
		moder_data[5] = 1;	//promiscus bit
		moder_data[13] = 1;	//crc enable
		mac_rm.moder.write(status, moder_data, .parent(this));

		//TX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h200,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(512 bytes),
		`uvm_do_with(req, {req.addr==10'h100; req.data==data_t; req.wr_rd==1;})			//400 is actual address, but don't drive 400, drive only 100
		data_t = 32'h1000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h101; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//RX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h80,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(128 bytes),
		`uvm_do_with(req, {req.addr==10'h180; req.data==data_t; req.wr_rd==1;})			//600 is actual address, but don't drive 600, drive only 180
		data_t = 32'h2000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h181; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//transmit receive enable
		moder_data[0] = 1;	//RXEN = 1
		moder_data[1] = 1;	//TXEN = 1
		mac_rm.moder.write(status, moder_data, .parent(this));
    endtask 
endclass


//half duplex transmit seq
class mac_hd_tx_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_hd_tx_seq)
    `NEW_OBJ 

	rand uvm_reg_data_t moder_data;
	rand uvm_reg_data_t collconf_data;
	rand uvm_reg_data_t int_mask_data;
	uvm_reg_data_t data_t;

    task body(); 
		//int_mask write
		int_mask_data[0] = 1;	//unmasking transmit buffer interupt
		int_mask_data = 7'b1111111;	//unmasking all interupt
		mac_rm.intmask.write(status, int_mask_data, .parent(this));
	
		//FD mode
		moder_data = 17'h0;	
		moder_data[10] = 0;	//half duplex mode
		moder_data[13] = 1;	//crc enable
		moder_data[8] = 1;	//nobackoff
		mac_rm.moder.write(status, moder_data, .parent(this));

		//collconf
		collconf_data[19:0] = 0;	
		collconf_data[19:16] = 4'hF;	//max retry 15 times
		collconf_data[5:0] = 6'h3F;		//collision should occur within 64 bytes else transmission is aborted
		mac_rm.collconf.write(status, collconf_data, .parent(this));

		//TX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h200,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(512 bytes),
		`uvm_do_with(req, {req.addr==10'h100; req.data==data_t; req.wr_rd==1;})			//400 is actual address, but don't drive 400, drive only 100
		data_t = 32'h1000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h101; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//transmit enable
		moder_data[1] = 1;	//TXEN = 1
		mac_rm.moder.write(status, moder_data, .parent(this));
    endtask 
endclass



//mii write control data to phy seq
class mac_mii_wr_ctrl_data_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_mii_wr_ctrl_data_seq)
    `NEW_OBJ 

	rand uvm_reg_data_t miimoder_data;
	rand uvm_reg_data_t miicommand_data;
	rand uvm_reg_data_t miiaddress_data;
	rand uvm_reg_data_t miitx_data;
	rand uvm_reg_data_t miirx_data;
	rand uvm_reg_data_t miistatus_data;

    task body(); 
		//miimoder reg
		miimoder_data = 9'h0;	
		miimoder_data[8] = 1;	//no preamble(mii frame)
		miimoder_data[7:0] = 4;	//clk_div
		mac_rm.miimoder.write(status, miimoder_data, .parent(this));

		//miicommand reg
		miicommand_data = 3'b0;
		miicommand_data[2] = 1;	//initiating for writectrl data
		mac_rm.miicommand.write(status, miicommand_data, .parent(this));

		//miiaddress reg
		miiaddress_data = 32'b0;
		miiaddress_data[4:0] = 5'h10;	//FIAD(phy addr)
		miiaddress_data[12:8] = 5'h07;	//RGAD(reg addr)
		mac_rm.miiaddress.write(status, miiaddress_data, .parent(this));

		//mii tx reg
		miitx_data= 32'b0;
		miitx_data[15:0] = 16'hAA33;	//1010_1010_0011_0011
		mac_rm.miitx_data.write(status, miitx_data, .parent(this));

		mac_rm.miistatus.read(status,miistatus_data);
		while(miistatus_data[1] == 1) begin
			mac_rm.miistatus.read(status,miistatus_data);	//mii is not busy
		end
		if(miistatus_data[0] == 1'b1) `uvm_error("MII","link failed");
    endtask 
endclass


//FD TX pause frame seq
class mac_fd_tx_pause_frame_seq extends wb_proc_base_seq; 
    `uvm_object_utils(mac_fd_tx_pause_frame_seq)
    `NEW_OBJ 

	rand uvm_reg_data_t moder_data;
	rand uvm_reg_data_t ctrlmoder_data;
	rand uvm_reg_data_t int_mask_data;
	uvm_reg_data_t data_t;

    task body(); 
		//int_mask write
		int_mask_data[0] = 1;	//unmasking transmit buffer interupt
		mac_rm.intmask.write(status, int_mask_data, .parent(this));
	
		//FD mode
		moder_data = {6'b0,1'b1,10'b0};	//full duplex mode
		moder_data[13] = 1;	//crc enable
		mac_rm.moder.write(status, moder_data, .parent(this));

		//CTRL MODER reg for pause frame
		ctrlmoder_data[1] = 1;	
		mac_rm.ctrlmoder.write(status, ctrlmoder_data, .parent(this));


		//TX_BD																			//we can't load these tx bd using reg model
		data_t = {16'h200,1'b1,1'b1,1'b1,1'b0,1'b0,2'b0,1'b0,4'b0,1'b0,1'b0,1'b0,1'b0};	//len(512 bytes),
		`uvm_do_with(req, {req.addr==10'h100; req.data==data_t; req.wr_rd==1;})			//400 is actual address, but don't drive 400, drive only 100
		data_t = 32'h1000_0000;															//address
		`uvm_do_with(req, {req.addr==10'h101; req.data==data_t; req.wr_rd==1;})			//verilog/ethmac.v => 299: input [11:2] wb_adr_i; //word aligned

		//transmit enable
		moder_data[1] = 1;	//TXEN = 1
		moder_data[0] = 1;	//RXEN = 1
		mac_rm.moder.write(status, moder_data, .parent(this));
    endtask 
endclass


