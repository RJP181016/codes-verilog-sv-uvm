class apb_base_seq extends uvm_sequence#(apb_tx);
  	`uvm_object_utils(apb_base_seq)
	`NEW_OBJ
	uvm_reg dma_regs[$];
	uvm_reg_data_t ref_data;
	rand uvm_reg_data_t data;
	uvm_status_e status;
	int reg_mismatches;
	dma_ctrl_reg_block dma_rm;

	task pre_body();
        if(starting_phase != null) begin
			starting_phase.raise_objection(this);
			starting_phase.phase_done.set_drain_time(this,100);
		end
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
    endtask
       
    task post_body();
    	if(starting_phase != null) starting_phase.drop_objection(this);
    endtask
endclass


//reg read seq
class dma_reg_rd_seq extends apb_base_seq;
	`uvm_object_utils(dma_reg_rd_seq)
	`NEW_OBJ

    task body(); 
		dma_rm.get_registers(dma_regs);
		dma_regs.shuffle();
		foreach(dma_regs[i]) begin
			ref_data = dma_regs[i].get_reset();
			dma_regs[i].read(status, data, .parent(this));
			if(ref_data != data) begin
				reg_mismatches++;
				`uvm_error(get_full_name(),$sformatf("Reg read(reset) error for %s: Expected: %0h Actual: %0h", dma_regs[i].get_name(),ref_data, data))
			end
		end
		uvm_resource_db#(int)::set("GLOBAL", "reg_mismatches", reg_mismatches, this);
    endtask 

endclass


//reg write read seq
class dma_reg_wr_rd_seq extends apb_base_seq;
	`uvm_object_utils(dma_reg_wr_rd_seq)
	`NEW_OBJ

    task body(); 
		dma_rm.get_registers(dma_regs);
		//dma_regs.shuffle();
		foreach(dma_regs[i]) begin
			if(!this.randomize())	`uvm_error(get_full_name(),"randomization error")
			dma_regs[i].write(status, data, .parent(this));
		end
		//dma_regs.shuffle();
		foreach(dma_regs[i]) begin
			ref_data = dma_regs[i].get();
			dma_regs[i].read(status, data, .parent(this));
			if(ref_data != data) begin
				`uvm_error(get_full_name(),$sformatf("Reg write read error for %s: Expected: %0h Actual: %0h", dma_regs[i].get_name(),ref_data, data))
				reg_mismatches++;
			end
		end
		uvm_resource_db#(int)::set("GLOBAL", "reg_mismatches", reg_mismatches, this);
    endtask 

endclass


//5.1 General configuration
class dma_general_config_seq extends apb_base_seq;
	rand bit core0_mode;
	`uvm_object_utils(dma_general_config_seq)
	`NEW_OBJ

	constraint core0_mode_c {
		soft core0_mode==0;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//core0_clkdiv_ratio
		dma_rm.core0_clkdiv_r_i.write(status,2);
		//core0_joint_mode
		dma_rm.core0_joint_mode_i.write(status,core0_mode);
    endtask 
endclass


//5.2 Configure and start a channel
//1. Configure static registers
class dma_configure_static_reg_seq extends apb_base_seq;
	rand bit [2:0] ch_num;
	rand bit [9:0] overall_transfer_size;
	rand bit rd_allow_full_burst;
	rand bit rd_allow_full_fifo;
	rand bit [5:0] rd_tokens;
	rand bit [3:0] rd_outs_max;
	rand bit rd_outstanding;
	rand bit rd_incr;

	rand bit wr_allow_full_burst;
	rand bit wr_allow_full_fifo;
	rand bit [5:0] wr_tokens;
	rand bit [3:0] wr_outs_max;
	rand bit wr_outstanding;
	rand bit wr_incr;

	rand bit [11:0] frame_width;
	rand bit block;
	rand bit joint;
	rand bit auto_retry;
	rand bit rd_cmd_port_num;
	rand bit rd_port_num;
	rand bit wr_port_num;
	rand bit [2:0] int_num;
	rand bit [1:0] endswap;

	rand bit [11:0] rd_wait_limit;
	rand bit [11:0] wr_wait_limit;

	`uvm_object_utils(dma_configure_static_reg_seq)
	`NEW_OBJ

	constraint default_field_value_c {
		soft ch_num==0;
		soft overall_transfer_size==32;	//256
		soft rd_allow_full_burst==1;
		soft rd_allow_full_fifo==1;
		soft rd_tokens==1;
		soft rd_outs_max==4;
		soft rd_outstanding==0;
		soft rd_incr==1;

		soft wr_allow_full_burst==1;
		soft wr_allow_full_fifo==1;
		soft wr_tokens==1;
		soft wr_outs_max==4;
		soft wr_outstanding==0;
		soft wr_incr==1;

		soft frame_width==0;
		soft block==0;
		soft joint==0;
		soft auto_retry==0;
		soft rd_cmd_port_num==0;
		soft rd_port_num==0;
		soft wr_port_num==0;
		soft int_num==0;
		soft endswap==0;

		soft rd_wait_limit==0;
		soft wr_wait_limit==0;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//configure static register0 
		data={rd_incr,rd_outstanding,2'b0,rd_outs_max,2'b0,rd_tokens,2'b0,rd_allow_full_fifo,rd_allow_full_burst,2'b0,overall_transfer_size};
		dma_rm.ch0_static_reg0_i.write(status,data);
		//configure static register1 
		data={wr_incr,wr_outstanding,2'b0,wr_outs_max,2'b0,wr_tokens,2'b0,wr_allow_full_fifo,wr_allow_full_burst,2'b0,overall_transfer_size};
		dma_rm.ch0_static_reg1_i.write(status,data);
		//configure static register2 
		data={2'b0,endswap,1'b0,int_num,1'b0,wr_port_num,rd_port_num,rd_cmd_port_num,2'b0,auto_retry,joint,block,3'b0,frame_width};
		dma_rm.ch0_static_reg2_i.write(status,data);
		//configure static register3 
		data={4'b0,wr_wait_limit,4'b0,rd_wait_limit};
		dma_rm.ch0_static_reg3_i.write(status,data);
    endtask 
endclass


//1. Configure static registers - all_channel
class dma_configure_static_reg_all_ch_seq extends apb_base_seq;
	rand bit [2:0] ch_num;
	rand bit [9:0] overall_transfer_size;
	rand bit rd_allow_full_burst;
	rand bit rd_allow_full_fifo;
	rand bit [5:0] rd_tokens;
	rand bit [3:0] rd_outs_max;
	rand bit rd_outstanding;
	rand bit rd_incr;

	rand bit wr_allow_full_burst;
	rand bit wr_allow_full_fifo;
	rand bit [5:0] wr_tokens;
	rand bit [3:0] wr_outs_max;
	rand bit wr_outstanding;
	rand bit wr_incr;

	rand bit [11:0] frame_width;
	rand bit block;
	rand bit joint;
	rand bit auto_retry;
	rand bit rd_cmd_port_num;
	rand bit rd_port_num;
	rand bit wr_port_num;
	rand bit [2:0] int_num;
	rand bit [1:0] endswap;

	rand bit [11:0] rd_wait_limit;
	rand bit [11:0] wr_wait_limit;

	`uvm_object_utils(dma_configure_static_reg_all_ch_seq)
	`NEW_OBJ

	constraint default_field_value_c {
		soft ch_num==0;
		soft overall_transfer_size==32;	//256
		soft rd_allow_full_burst==1;
		soft rd_allow_full_fifo==1;
		soft rd_tokens==1;
		soft rd_outs_max==4;
		soft rd_outstanding==0;
		soft rd_incr==1;

		soft wr_allow_full_burst==1;
		soft wr_allow_full_fifo==1;
		soft wr_tokens==1;
		soft wr_outs_max==4;
		soft wr_outstanding==0;
		soft wr_incr==1;

		soft frame_width==0;
		soft block==0;
		soft joint==0;
		soft auto_retry==0;
		soft rd_cmd_port_num==0;
		soft rd_port_num==0;
		soft wr_port_num==0;
		soft int_num==0;
		soft endswap==0;

		soft rd_wait_limit==16;
		soft wr_wait_limit==16;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//configure static register0 
		data={rd_incr,rd_outstanding,2'b0,rd_outs_max,2'b0,rd_tokens,2'b0,rd_allow_full_fifo,rd_allow_full_burst,2'b0,overall_transfer_size};
		dma_rm.ch0_static_reg0_i.write(status,data);
		dma_rm.ch1_static_reg0_i.write(status,data);
		dma_rm.ch2_static_reg0_i.write(status,data);
		dma_rm.ch3_static_reg0_i.write(status,data);
		dma_rm.ch4_static_reg0_i.write(status,data);
		dma_rm.ch5_static_reg0_i.write(status,data);
		dma_rm.ch6_static_reg0_i.write(status,data);
		dma_rm.ch7_static_reg0_i.write(status,data);
		//configure static register1 
		data={wr_incr,wr_outstanding,2'b0,wr_outs_max,2'b0,wr_tokens,2'b0,wr_allow_full_fifo,wr_allow_full_burst,2'b0,overall_transfer_size};
		dma_rm.ch0_static_reg1_i.write(status,data);
		dma_rm.ch1_static_reg1_i.write(status,data);
		dma_rm.ch2_static_reg1_i.write(status,data);
		dma_rm.ch3_static_reg1_i.write(status,data);
		dma_rm.ch4_static_reg1_i.write(status,data);
		dma_rm.ch5_static_reg1_i.write(status,data);
		dma_rm.ch6_static_reg1_i.write(status,data);
		dma_rm.ch7_static_reg1_i.write(status,data);
		//configure static register2 
		data={2'b0,endswap,1'b0,int_num,1'b0,wr_port_num,rd_port_num,rd_cmd_port_num,2'b0,auto_retry,joint,block,3'b0,frame_width};
		dma_rm.ch0_static_reg2_i.write(status,data);
		dma_rm.ch1_static_reg2_i.write(status,data);
		dma_rm.ch2_static_reg2_i.write(status,data);
		dma_rm.ch3_static_reg2_i.write(status,data);
		dma_rm.ch4_static_reg2_i.write(status,data);
		dma_rm.ch5_static_reg2_i.write(status,data);
		dma_rm.ch6_static_reg2_i.write(status,data);
		dma_rm.ch7_static_reg2_i.write(status,data);
		//configure static register3 
		data={4'b0,wr_wait_limit,4'b0,rd_wait_limit};
		dma_rm.ch0_static_reg3_i.write(status,data);
		dma_rm.ch1_static_reg3_i.write(status,data);
		dma_rm.ch2_static_reg3_i.write(status,data);
		dma_rm.ch3_static_reg3_i.write(status,data);
		dma_rm.ch4_static_reg3_i.write(status,data);
		dma_rm.ch5_static_reg3_i.write(status,data);
		dma_rm.ch6_static_reg3_i.write(status,data);
		dma_rm.ch7_static_reg3_i.write(status,data);
    endtask 
endclass

//2. Configure interrupt controller (all interrupts are enabled by default)
class dma_configure_interrupt_reg_seq extends apb_base_seq;
	rand bit int_rawstat_ch_end;
	rand bit int_rawstat_rd_decerr;
	rand bit int_rawstat_rd_slverr;
	rand bit int_rawstat_wr_decerr;
	rand bit int_rawstat_wr_slverr;
	rand bit int_rawstat_overflow;
	rand bit int_rawstat_underflow;
	rand bit int_rawstat_timeout_r;
	rand bit int_rawstat_timeout_ar;
	rand bit int_rawstat_timeout_b;
	rand bit int_rawstat_timeout_w;
	rand bit int_rawstat_timeout_aw;
	rand bit int_rawstat_wdt;

	`uvm_object_utils(dma_configure_interrupt_reg_seq)
	`NEW_OBJ

	constraint default_field_value_c {
		int_rawstat_ch_end==0;
		int_rawstat_rd_decerr==0;
		int_rawstat_rd_slverr==0;
		int_rawstat_wr_decerr==0;
		int_rawstat_wr_slverr==0;
		int_rawstat_overflow==0;
		int_rawstat_underflow==0;
		int_rawstat_timeout_r==0;
		int_rawstat_timeout_ar==0;
		int_rawstat_timeout_b==0;
		int_rawstat_timeout_w==0;
		int_rawstat_timeout_aw==0;
		int_rawstat_wdt==0;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//configure int rawstat register 
		data={int_rawstat_wdt,int_rawstat_timeout_aw,int_rawstat_timeout_w,int_rawstat_timeout_b,int_rawstat_timeout_ar,int_rawstat_timeout_r,int_rawstat_underflow,int_rawstat_overflow,int_rawstat_wr_slverr,int_rawstat_wr_decerr,int_rawstat_rd_slverr,int_rawstat_rd_decerr,int_rawstat_ch_end};
		dma_rm.ch0_int_rawstat_reg_i.write(status,data);
		//configure int enable register //TODO 
		dma_rm.ch0_int_rawstat_reg_i.write(status,13'h1FFFF);
    endtask 
endclass

//2. Configure interrupt controller - all_channel
class dma_configure_interrupt_reg_all_ch_seq extends apb_base_seq;
	rand bit int_rawstat_ch_end;
	rand bit int_rawstat_rd_decerr;
	rand bit int_rawstat_rd_slverr;
	rand bit int_rawstat_wr_decerr;
	rand bit int_rawstat_wr_slverr;
	rand bit int_rawstat_overflow;
	rand bit int_rawstat_underflow;
	rand bit int_rawstat_timeout_r;
	rand bit int_rawstat_timeout_ar;
	rand bit int_rawstat_timeout_b;
	rand bit int_rawstat_timeout_w;
	rand bit int_rawstat_timeout_aw;
	rand bit int_rawstat_wdt;

	`uvm_object_utils(dma_configure_interrupt_reg_all_ch_seq)
	`NEW_OBJ

	constraint default_field_value_c {
		int_rawstat_ch_end==0;
		int_rawstat_rd_decerr==0;
		int_rawstat_rd_slverr==0;
		int_rawstat_wr_decerr==0;
		int_rawstat_wr_slverr==0;
		int_rawstat_overflow==0;
		int_rawstat_underflow==0;
		int_rawstat_timeout_r==0;
		int_rawstat_timeout_ar==0;
		int_rawstat_timeout_b==0;
		int_rawstat_timeout_w==0;
		int_rawstat_timeout_aw==0;
		int_rawstat_wdt==0;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//configure int rawstat register 
		data={int_rawstat_wdt,int_rawstat_timeout_aw,int_rawstat_timeout_w,int_rawstat_timeout_b,int_rawstat_timeout_ar,int_rawstat_timeout_r,int_rawstat_underflow,int_rawstat_overflow,int_rawstat_wr_slverr,int_rawstat_wr_decerr,int_rawstat_rd_slverr,int_rawstat_rd_decerr,int_rawstat_ch_end};
		dma_rm.ch0_int_rawstat_reg_i.write(status,data);
		//configure int enable register //TODO 
		dma_rm.ch0_int_rawstat_reg_i.write(status,13'h1FFFF);
		dma_rm.ch1_int_rawstat_reg_i.write(status,data);
		dma_rm.ch1_int_rawstat_reg_i.write(status,13'h1FFFF);
		dma_rm.ch2_int_rawstat_reg_i.write(status,data);
		dma_rm.ch2_int_rawstat_reg_i.write(status,13'h1FFFF);
		dma_rm.ch3_int_rawstat_reg_i.write(status,data);
		dma_rm.ch3_int_rawstat_reg_i.write(status,13'h1FFFF);
		dma_rm.ch4_int_rawstat_reg_i.write(status,data);
		dma_rm.ch4_int_rawstat_reg_i.write(status,13'h1FFFF);
		dma_rm.ch5_int_rawstat_reg_i.write(status,data);
		dma_rm.ch5_int_rawstat_reg_i.write(status,13'h1FFFF);
		dma_rm.ch6_int_rawstat_reg_i.write(status,data);
		dma_rm.ch6_int_rawstat_reg_i.write(status,13'h1FFFF);
		dma_rm.ch7_int_rawstat_reg_i.write(status,data);
		dma_rm.ch7_int_rawstat_reg_i.write(status,13'h1FFFF);
    endtask 
endclass


//3. Configure command 
class dma_configure_command_seq extends apb_base_seq;
	rand bit [31:0] rd_start_addr;
	rand bit [31:0] wr_start_addr;
	rand bit [15:0] buffer_size;	//buffer size in design is 10 bits
	rand bit [7:0] x_size;
	rand bit [7:0] y_size;
	rand bit  cmd_set_int;
	rand bit  cmd_last;
	rand bit [27:0] cmd_next_addr;
	`uvm_object_utils(dma_configure_command_seq)
	`NEW_OBJ

	constraint default_field_value_c {
		rd_start_addr==32'h10000;
		wr_start_addr==32'h20000;
		buffer_size==512;	
		x_size==0;
		y_size==0;
		cmd_set_int==0;
		cmd_last==1;
		cmd_next_addr==0;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//1st command
		//configure command register0 
		dma_rm.ch0_cmd_reg0_i.write(status,rd_start_addr);
		//configure command register1 
		dma_rm.ch0_cmd_reg1_i.write(status,wr_start_addr);
		//configure command register2 
		//buffer_size=0;
		dma_rm.ch0_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch0_cmd_reg3_i.write(status,data);
    endtask 
endclass

//3. Configure command  - all_channel
class dma_configure_command_all_ch_seq extends apb_base_seq;
	rand bit [31:0] rd_start_addr;
	rand bit [31:0] wr_start_addr;
	rand bit [15:0] buffer_size;
	rand bit [7:0] x_size;
	rand bit [7:0] y_size;
	rand bit  cmd_set_int;
	rand bit  cmd_last;
	rand bit [27:0] cmd_next_addr;
	`uvm_object_utils(dma_configure_command_all_ch_seq)
	`NEW_OBJ

	constraint default_field_value_c {
		rd_start_addr==32'h10000;
		wr_start_addr==32'h20000;
		buffer_size==128;	
		x_size==0;
		y_size==0;
		cmd_set_int==0;
		cmd_last==1;
		cmd_next_addr==0;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		// channel 0
		//configure command register0 
		dma_rm.ch0_cmd_reg0_i.write(status,rd_start_addr);
		//configure command register1 
		dma_rm.ch0_cmd_reg1_i.write(status,wr_start_addr);
		//configure command register2 
		dma_rm.ch0_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch0_cmd_reg3_i.write(status,data);
		// channel 1
		//configure command register0 
		dma_rm.ch1_cmd_reg0_i.write(status,rd_start_addr+32'h100);
		//configure command register1 
		dma_rm.ch1_cmd_reg1_i.write(status,wr_start_addr+32'h100);
		//configure command register2 
		dma_rm.ch1_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch1_cmd_reg3_i.write(status,data);
		// channel 2
		//configure command register0 
		dma_rm.ch2_cmd_reg0_i.write(status,rd_start_addr+32'h200);
		//configure command register1 
		dma_rm.ch2_cmd_reg1_i.write(status,wr_start_addr+32'h200);
		//configure command register2 
		dma_rm.ch2_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch2_cmd_reg3_i.write(status,data);
		// channel 3
		//configure command register0 
		dma_rm.ch3_cmd_reg0_i.write(status,rd_start_addr+32'h300);
		//configure command register1 
		dma_rm.ch3_cmd_reg1_i.write(status,wr_start_addr+32'h300);
		//configure command register2 
		dma_rm.ch3_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch3_cmd_reg3_i.write(status,data);
		// channel 4
		//configure command register0 
		dma_rm.ch4_cmd_reg0_i.write(status,rd_start_addr+32'h400);
		//configure command register1 
		dma_rm.ch4_cmd_reg1_i.write(status,wr_start_addr+32'h400);
		//configure command register2 
		dma_rm.ch4_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch4_cmd_reg3_i.write(status,data);
		// channel 5
		//configure command register0 
		dma_rm.ch5_cmd_reg0_i.write(status,rd_start_addr+32'h500);
		//configure command register1 
		dma_rm.ch5_cmd_reg1_i.write(status,wr_start_addr+32'h500);
		//configure command register2 
		dma_rm.ch5_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch5_cmd_reg3_i.write(status,data);
		// channel 6
		//configure command register0 
		dma_rm.ch6_cmd_reg0_i.write(status,rd_start_addr+32'h600);
		//configure command register1 
		dma_rm.ch6_cmd_reg1_i.write(status,wr_start_addr+32'h600);
		//configure command register2 
		dma_rm.ch6_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch6_cmd_reg3_i.write(status,data);
		// channel 7
		//configure command register0 
		dma_rm.ch7_cmd_reg0_i.write(status,rd_start_addr+32'h700);
		//configure command register1 
		dma_rm.ch7_cmd_reg1_i.write(status,wr_start_addr+32'h700);
		//configure command register2 
		dma_rm.ch7_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch7_cmd_reg3_i.write(status,data);
    endtask 
endclass



//3. Configure command list
class dma_configure_command_list_seq extends apb_base_seq;
	rand bit [31:0] rd_start_addr;
	rand bit [31:0] wr_start_addr;
	rand bit [15:0] buffer_size;
	rand bit [7:0] x_size;
	rand bit [7:0] y_size;
	rand bit  cmd_set_int;
	rand bit  cmd_last;
	rand bit [27:0] cmd_next_addr;
	`uvm_object_utils(dma_configure_command_list_seq)
	`NEW_OBJ

	constraint default_field_value_c {
		rd_start_addr==32'h10000;
		wr_start_addr==32'h20000;
		buffer_size==128;
		x_size==0;
		y_size==0;
		cmd_set_int==0;
		cmd_last==0;
		cmd_next_addr==0;
	}

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//1st command
		//configure command register0 
		dma_rm.ch0_cmd_reg0_i.write(status,rd_start_addr);
		//configure command register1 
		dma_rm.ch0_cmd_reg1_i.write(status,wr_start_addr);
		//configure command register2 
		dma_rm.ch0_cmd_reg2_i.write(status,buffer_size);
		//configure command register3 
		cmd_next_addr = `DMA_CMD_1_STORING_ADDR_UPPER;
		data={cmd_next_addr,2'b0,cmd_last,cmd_set_int};
		dma_rm.ch0_cmd_reg3_i.write(status,data);
    endtask 
endclass



// 4. Enable the channel (all channels are enabled by default)
// 5. Start the channel
class dma_enable_start_channel_seq extends apb_base_seq;
	`uvm_object_utils(dma_enable_start_channel_seq)
	`NEW_OBJ

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		dma_rm.ch0_ch_enable_reg_i.write(status,1);
		dma_rm.ch0_ch_start_reg_i.write(status,1);
    endtask 
endclass


//dma periph trigger seq
class dma_periph_trigger_seq extends apb_base_seq;
	`uvm_object_utils(dma_periph_trigger_seq)
	`NEW_OBJ

    task body(); 
		dma_ctrl_reg_block dma_rm;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//dma_rm.ch0_ch_enable_reg_i.write(status,1);
		//dma_rm.ch0_ch_start_reg_i.write(status,1);
		`uvm_do_with(req,{req.periph_rx_req==31'h1; req.periph_transfer_f==1;})
    endtask 
endclass

// 4. Enable the channel (all channels are enabled by default)
// 5. Start the channel - all_channel
class dma_enable_start_all_channel_seq extends apb_base_seq;
	`uvm_object_utils(dma_enable_start_all_channel_seq)
	`NEW_OBJ

    task body(); 
		dma_ctrl_reg_block dma_rm;
		super.body;
		uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//channel 0
		dma_rm.ch0_ch_enable_reg_i.write(status,1);
		dma_rm.ch0_ch_start_reg_i.write(status,1);
		#500;
		//channel 1
		dma_rm.ch1_ch_enable_reg_i.write(status,1);
		dma_rm.ch1_ch_start_reg_i.write(status,1);
		#500;
		//channel 2
		dma_rm.ch2_ch_enable_reg_i.write(status,1);
		dma_rm.ch2_ch_start_reg_i.write(status,1);
		#500;
		//channel 3
		dma_rm.ch3_ch_enable_reg_i.write(status,1);
		dma_rm.ch3_ch_start_reg_i.write(status,1);
		#500;
		//channel 4
		dma_rm.ch4_ch_enable_reg_i.write(status,1);
		dma_rm.ch4_ch_start_reg_i.write(status,1);
		#500;
		//channel 5
		dma_rm.ch5_ch_enable_reg_i.write(status,1);
		dma_rm.ch5_ch_start_reg_i.write(status,1);
		#500;
		//channel 6
		dma_rm.ch6_ch_enable_reg_i.write(status,1);
		dma_rm.ch6_ch_start_reg_i.write(status,1);
		#500;
		//channel 7
		dma_rm.ch7_ch_enable_reg_i.write(status,1);
		dma_rm.ch7_ch_start_reg_i.write(status,1);
		#500;
    endtask 
endclass

//5.2 Configure and start a channel(command)
class dma_config_start_ch_cmd_seq extends apb_base_seq;
	dma_configure_static_reg_seq 		configure_static_reg_seq; 
	dma_configure_interrupt_reg_seq 	configure_interrupt_reg_seq;
	dma_configure_command_seq 			configure_command_seq;
	dma_enable_start_channel_seq 		enable_start_channel_seq;
	`uvm_object_utils(dma_config_start_ch_cmd_seq)
	`NEW_OBJ

	task body();
		`uvm_do(configure_static_reg_seq);
		`uvm_do(configure_interrupt_reg_seq);
		`uvm_do(configure_command_seq);
		`uvm_do(enable_start_channel_seq);
	endtask
endclass


//5.2 Configure and start a channel(command list)
class dma_config_start_ch_cmd_list_seq extends apb_base_seq;
	dma_configure_static_reg_seq 		configure_static_reg_seq; 
	dma_configure_interrupt_reg_seq 	configure_interrupt_reg_seq;
	dma_configure_command_list_seq 		configure_command_list_seq;
	dma_enable_start_channel_seq 		enable_start_channel_seq;
	`uvm_object_utils(dma_config_start_ch_cmd_list_seq)
	`NEW_OBJ

	task body();
		`uvm_do(configure_static_reg_seq);
		`uvm_do(configure_interrupt_reg_seq);
		`uvm_do(configure_command_list_seq);
		`uvm_do(enable_start_channel_seq);
	endtask
endclass


//5.2 Configure and start a channel(command, all_channel)
class dma_config_start_all_ch_cmd_seq extends apb_base_seq;
	dma_configure_static_reg_all_ch_seq 		configure_static_reg_all_ch_seq; 
	dma_configure_interrupt_reg_all_ch_seq 		configure_interrupt_reg_all_ch_seq;
	dma_configure_command_all_ch_seq 			configure_command_all_ch_seq;
	dma_enable_start_all_channel_seq 			enable_start_all_channel_seq;
	`uvm_object_utils(dma_config_start_all_ch_cmd_seq)
	`NEW_OBJ

	task body();
		`uvm_do(configure_static_reg_all_ch_seq);
		`uvm_do(configure_interrupt_reg_all_ch_seq);
		`uvm_do(configure_command_all_ch_seq);
		`uvm_do(enable_start_all_channel_seq);
	endtask
endclass


//5.2 Configure and start a channel(peripheral transfer)
class dma_periph_transfer_seq extends apb_base_seq;
	dma_configure_static_reg_seq 		configure_static_reg_seq; 
	dma_configure_interrupt_reg_seq 	configure_interrupt_reg_seq;
	dma_configure_command_list_seq 		configure_command_list_seq;
	dma_enable_start_channel_seq 		enable_start_channel_seq;
	dma_periph_trigger_seq				periph_trigger_seq;
	`uvm_object_utils(dma_periph_transfer_seq)
	`NEW_OBJ

	task body();
	bit [4:0] wr_periph_num, rd_periph_num;
	bit [31:0] data_t;
		`uvm_do(configure_static_reg_seq);
		wr_periph_num = 0;
		rd_periph_num = 1;
		data_t = {6'b0,3'd2,3'b0,wr_periph_num,6'b0,3'd2,3'b0,rd_periph_num};
		dma_rm.ch0_static_reg4_i.write(status,data_t);
		dma_rm.core0_joint_mode_i.write(status,32'h1);

		`uvm_do(configure_interrupt_reg_seq);
		`uvm_do(configure_command_list_seq);
		`uvm_do(enable_start_channel_seq);
		`uvm_do(periph_trigger_seq);
		#200;
		`uvm_do(periph_trigger_seq);
		#200;
		`uvm_do(periph_trigger_seq);
		#200;
		`uvm_do(periph_trigger_seq);
	endtask
endclass

