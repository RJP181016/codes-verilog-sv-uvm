class ch0_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch0_cmd_reg0)
	uvm_reg_field rd_start_addr;

	covergroup ch0_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  	function new(string name = "ch0_cmd_reg0");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_cmd_reg0_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_cmd_reg0_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_cmd_reg0_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass

class ch0_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch0_cmd_reg1)
	uvm_reg_field wr_start_addr;

	covergroup ch0_cmd_reg1_cg;
		WR_START_ADDR_CP : coverpoint wr_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  	function new(string name = "ch0_cmd_reg1");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_cmd_reg1_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_cmd_reg1_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_cmd_reg1_cg.sample();
    endfunction: sample_values

	virtual function void build();
		wr_start_addr = uvm_reg_field::type_id::create("wr_start_addr");
		wr_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass

class ch0_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch0_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch0_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_cmd_reg2");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_cmd_reg2_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_cmd_reg2_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_cmd_reg2_cg.sample();
    endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch0_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch0_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_cmd_reg3");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_cmd_reg3_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_cmd_reg3_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_cmd_reg3_cg.sample();
    endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch0_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch0_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  	function new(string name = "ch0_static_reg0");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_static_reg0_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_static_reg0_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_static_reg0_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch0_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch0_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch0_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_static_reg1");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_static_reg1_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_static_reg1_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_static_reg1_cg.sample();
    endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch0_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch0_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch0_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_static_reg2");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_static_reg2_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_static_reg2_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_static_reg2_cg.sample();
    endfunction: sample_values


	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch0_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch0_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

 function new(string name = "ch0_static_reg3");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_static_reg3_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_static_reg3_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_static_reg3_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch0_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch0_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_static_reg4");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_static_reg4_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_static_reg4_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_static_reg4_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch0_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch0_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_restrict_reg");
  	   super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_restrict_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_restrict_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_restrict_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch0_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd1;
	covergroup ch0_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_read_offset_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_read_offset_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_read_offset_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_read_offset_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch0_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd1;
	covergroup ch0_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_write_offset_reg");
    super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_write_offset_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_write_offset_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_write_offset_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch0_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch0_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_fifo_fullness_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_fifo_fullness_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_fifo_fullness_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_fifo_fullness_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch0_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch0_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_cmd_outs_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_cmd_outs_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_cmd_outs_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_cmd_outs_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch0_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch0_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch0_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_ch_enable_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_ch_enable_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_ch_enable_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_ch_enable_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch0_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch0_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch0_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_ch_start_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_ch_start_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_ch_start_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_ch_start_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch0_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch0_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_ch_active_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_ch_active_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_ch_active_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_ch_active_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_count_reg extends uvm_reg;
	`uvm_object_utils(ch0_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch0_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_count_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_count_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_count_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_count_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch0_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch0_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_int_rawstat_reg");
     super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
  	   if(has_coverage(UVM_CVR_FIELD_VALS)) begin 
	   	ch0_int_rawstat_reg_cg = new;
  	    set_coverage(UVM_CVR_FIELD_VALS);
  	   end
  	endfunction

    function void sample(uvm_reg_data_t data,
                         uvm_reg_data_t byte_en,
                         bit            is_read,
                         uvm_reg_map    map);
      if(get_coverage(UVM_CVR_FIELD_VALS)) begin
        ch0_int_rawstat_reg_cg.sample();
      end
    endfunction: sample

    function void sample_values();
      super.sample_values();
      if(get_coverage(UVM_CVR_FIELD_VALS))
        ch0_int_rawstat_reg_cg.sample();
    endfunction: sample_values

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch0_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch0_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch0_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch0_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch0_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch0_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch0_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch0_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch0_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch0_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch0_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch0_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch0_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch0_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch0_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch0_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch0_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch0_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch1_cmd_reg0)
	uvm_reg_field rd_start_addr;
	covergroup ch1_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_cmd_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_cmd_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch1_cmd_reg1)
	uvm_reg_field rd_start_addr;
	covergroup ch1_cmd_reg1_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_cmd_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_cmd_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch1_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch1_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_cmd_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_cmd_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 9, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch1_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch1_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_cmd_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_cmd_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch1_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch1_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_static_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_static_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch1_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch1_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch1_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_static_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_static_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch1_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch1_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch1_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_static_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_static_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch1_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch1_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_static_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_static_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch1_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch1_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_static_reg4");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg4_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_static_reg4_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_static_reg4_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch1_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch1_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_restrict_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_restrict_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_restrict_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_restrict_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch1_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd2;
	covergroup ch1_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_read_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_read_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_read_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_read_offset_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch1_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd2;
	covergroup ch1_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_write_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_write_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_write_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_write_offset_reg_cg.sample();
	endfunction: sample_values
  

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch1_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch1_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_fifo_fullness_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_fifo_fullness_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_fifo_fullness_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_fifo_fullness_reg_cg.sample();
	endfunction: sample_values
   

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch1_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch1_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_cmd_outs_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_outs_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_cmd_outs_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_cmd_outs_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch1_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch1_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch1_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_ch_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_ch_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_ch_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_ch_enable_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch1_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch1_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch1_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_ch_start_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_ch_start_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_ch_start_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_ch_start_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch1_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch1_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_ch_active_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_ch_active_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_ch_active_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_ch_active_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_count_reg extends uvm_reg;
	`uvm_object_utils(ch1_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch1_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_count_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_count_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_count_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_count_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch1_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch1_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_int_rawstat_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_rawstat_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_rawstat_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_int_rawstat_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch1_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch1_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch1_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch1_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch1_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch1_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch1_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch1_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch1_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch1_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch1_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch2_cmd_reg0)
	uvm_reg_field rd_start_addr;
	covergroup ch2_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_cmd_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_cmd_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch2_cmd_reg1)
	uvm_reg_field rd_start_addr;
	covergroup ch2_cmd_reg1_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_cmd_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_cmd_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch2_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch2_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_cmd_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_cmd_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 9, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch2_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch2_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_cmd_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_cmd_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch2_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch2_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_static_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_static_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch2_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch2_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch2_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_static_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_static_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch2_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch2_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch2_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_static_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_static_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch2_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch2_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_static_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_static_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch2_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch2_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_static_reg4");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg4_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_static_reg4_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_static_reg4_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch2_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch2_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_restrict_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_restrict_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_restrict_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_restrict_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch2_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd1;
	covergroup ch2_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_read_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_read_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_read_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_read_offset_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch2_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd1;
	covergroup ch2_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_write_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_write_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_write_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_write_offset_reg_cg.sample();
	endfunction: sample_values
  

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch2_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch2_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_fifo_fullness_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_fifo_fullness_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_fifo_fullness_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_fifo_fullness_reg_cg.sample();
	endfunction: sample_values
   

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch2_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch2_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_cmd_outs_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_outs_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_cmd_outs_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_cmd_outs_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch2_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch2_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch2_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_ch_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_ch_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_ch_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_ch_enable_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch2_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch2_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch2_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_ch_start_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_ch_start_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_ch_start_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_ch_start_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch2_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch2_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_ch_active_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_ch_active_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_ch_active_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_ch_active_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_count_reg extends uvm_reg;
	`uvm_object_utils(ch2_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch2_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_count_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_count_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_count_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_count_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch2_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch2_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_int_rawstat_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_rawstat_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_rawstat_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_int_rawstat_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch2_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch2_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch2_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch2_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch2_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch2_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch2_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch2_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch2_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch2_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch2_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch3_cmd_reg0)
	uvm_reg_field rd_start_addr;
	covergroup ch3_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_cmd_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_cmd_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch3_cmd_reg1)
	uvm_reg_field rd_start_addr;
	covergroup ch3_cmd_reg1_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_cmd_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_cmd_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch3_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch3_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_cmd_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_cmd_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 9, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch3_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch3_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_cmd_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_cmd_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch3_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch3_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_static_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_static_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch3_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch3_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch3_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_static_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_static_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch3_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch3_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch3_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_static_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_static_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch3_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch3_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_static_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_static_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch3_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch3_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_static_reg4");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg4_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_static_reg4_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_static_reg4_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch3_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch3_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_restrict_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_restrict_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_restrict_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_restrict_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch3_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd1;
	covergroup ch3_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_read_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_read_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_read_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_read_offset_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch3_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd1;
	covergroup ch3_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_write_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_write_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_write_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_write_offset_reg_cg.sample();
	endfunction: sample_values
  

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch3_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch3_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_fifo_fullness_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_fifo_fullness_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_fifo_fullness_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_fifo_fullness_reg_cg.sample();
	endfunction: sample_values
   

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch3_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch3_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_cmd_outs_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_outs_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_cmd_outs_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_cmd_outs_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch3_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch3_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch3_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_ch_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_ch_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_ch_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_ch_enable_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch3_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch3_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch3_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_ch_start_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_ch_start_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_ch_start_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_ch_start_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch3_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch3_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_ch_active_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_ch_active_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_ch_active_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_ch_active_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_count_reg extends uvm_reg;
	`uvm_object_utils(ch3_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch3_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_count_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_count_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_count_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_count_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch3_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch3_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_int_rawstat_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_rawstat_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_rawstat_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_int_rawstat_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch3_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch3_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch3_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch3_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch3_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch3_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch3_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch3_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch3_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch3_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch3_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch4_cmd_reg0)
	uvm_reg_field rd_start_addr;
	covergroup ch4_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_cmd_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_cmd_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch4_cmd_reg1)
	uvm_reg_field rd_start_addr;
	covergroup ch4_cmd_reg1_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_cmd_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_cmd_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch4_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch4_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_cmd_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_cmd_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 9, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch4_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch4_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_cmd_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_cmd_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch4_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch4_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_static_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_static_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch4_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch4_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch4_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_static_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_static_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch4_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch4_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch4_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_static_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_static_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch4_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch4_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_static_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_static_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch4_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch4_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_static_reg4");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg4_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_static_reg4_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_static_reg4_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch4_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch4_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_restrict_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_restrict_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_restrict_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_restrict_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch4_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd1;
	covergroup ch4_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_read_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_read_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_read_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_read_offset_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch4_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd1;
	covergroup ch4_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_write_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_write_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_write_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_write_offset_reg_cg.sample();
	endfunction: sample_values
  

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch4_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch4_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_fifo_fullness_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_fifo_fullness_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_fifo_fullness_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_fifo_fullness_reg_cg.sample();
	endfunction: sample_values
   

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch4_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch4_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_cmd_outs_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_outs_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_cmd_outs_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_cmd_outs_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch4_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch4_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch4_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_ch_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_ch_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_ch_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_ch_enable_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch4_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch4_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch4_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_ch_start_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_ch_start_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_ch_start_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_ch_start_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch4_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch4_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_ch_active_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_ch_active_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_ch_active_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_ch_active_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_count_reg extends uvm_reg;
	`uvm_object_utils(ch4_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch4_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_count_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_count_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_count_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_count_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch4_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch4_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_int_rawstat_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_rawstat_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_rawstat_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_int_rawstat_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch4_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch4_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch4_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch4_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch4_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch4_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch4_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch4_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch4_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch4_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch4_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch5_cmd_reg0)
	uvm_reg_field rd_start_addr;
	covergroup ch5_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_cmd_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_cmd_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch5_cmd_reg1)
	uvm_reg_field rd_start_addr;
	covergroup ch5_cmd_reg1_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_cmd_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_cmd_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch5_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch5_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_cmd_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_cmd_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 9, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch5_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch5_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_cmd_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_cmd_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch5_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch5_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_static_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_static_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch5_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch5_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch5_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_static_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_static_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch5_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch5_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch5_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_static_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_static_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch5_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch5_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_static_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_static_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch5_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch5_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_static_reg4");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg4_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_static_reg4_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_static_reg4_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch5_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch5_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_restrict_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_restrict_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_restrict_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_restrict_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch5_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd1;
	covergroup ch5_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_read_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_read_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_read_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_read_offset_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch5_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd1;
	covergroup ch5_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_write_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_write_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_write_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_write_offset_reg_cg.sample();
	endfunction: sample_values
  

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch5_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch5_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_fifo_fullness_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_fifo_fullness_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_fifo_fullness_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_fifo_fullness_reg_cg.sample();
	endfunction: sample_values
   

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch5_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch5_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_cmd_outs_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_outs_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_cmd_outs_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_cmd_outs_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch5_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch5_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch5_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_ch_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_ch_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_ch_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_ch_enable_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch5_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch5_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch5_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_ch_start_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_ch_start_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_ch_start_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_ch_start_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch5_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch5_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_ch_active_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_ch_active_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_ch_active_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_ch_active_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_count_reg extends uvm_reg;
	`uvm_object_utils(ch5_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch5_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_count_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_count_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_count_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_count_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch5_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch5_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_int_rawstat_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_rawstat_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_rawstat_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_int_rawstat_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch5_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch5_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch5_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch5_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch5_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch5_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch5_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch5_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch5_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch5_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch5_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch6_cmd_reg0)
	uvm_reg_field rd_start_addr;
	covergroup ch6_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_cmd_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_cmd_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch6_cmd_reg1)
	uvm_reg_field rd_start_addr;
	covergroup ch6_cmd_reg1_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_cmd_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_cmd_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch6_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch6_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_cmd_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_cmd_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 9, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch6_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch6_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_cmd_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_cmd_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch6_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch6_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_static_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_static_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch6_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch6_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch6_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_static_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_static_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch6_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch6_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch6_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_static_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_static_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch6_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch6_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_static_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_static_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch6_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch6_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_static_reg4");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg4_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_static_reg4_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_static_reg4_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch6_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch6_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_restrict_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_restrict_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_restrict_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_restrict_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch6_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd1;
	covergroup ch6_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_read_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_read_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_read_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_read_offset_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch6_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd1;
	covergroup ch6_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_write_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_write_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_write_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_write_offset_reg_cg.sample();
	endfunction: sample_values
  

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch6_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch6_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_fifo_fullness_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_fifo_fullness_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_fifo_fullness_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_fifo_fullness_reg_cg.sample();
	endfunction: sample_values
   

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch6_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch6_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_cmd_outs_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_outs_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_cmd_outs_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_cmd_outs_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch6_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch6_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch6_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_ch_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_ch_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_ch_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_ch_enable_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch6_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch6_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch6_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_ch_start_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_ch_start_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_ch_start_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_ch_start_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch6_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch6_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_ch_active_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_ch_active_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_ch_active_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_ch_active_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_count_reg extends uvm_reg;
	`uvm_object_utils(ch6_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch6_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_count_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_count_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_count_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_count_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch6_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch6_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_int_rawstat_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_rawstat_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_rawstat_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_int_rawstat_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch6_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch6_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch6_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch6_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch6_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch6_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch6_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch6_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch6_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch6_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch6_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_cmd_reg0 extends uvm_reg;
	`uvm_object_utils(ch7_cmd_reg0)
	uvm_reg_field rd_start_addr;
	covergroup ch7_cmd_reg0_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_cmd_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_cmd_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_cmd_reg1 extends uvm_reg;
	`uvm_object_utils(ch7_cmd_reg1)
	uvm_reg_field rd_start_addr;
	covergroup ch7_cmd_reg1_cg;
		RD_START_ADDR_CP : coverpoint rd_start_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_cmd_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_cmd_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_start_addr = uvm_reg_field::type_id::create("rd_start_addr");
		rd_start_addr.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_cmd_reg2 extends uvm_reg;
	`uvm_object_utils(ch7_cmd_reg2)
	uvm_reg_field buffer_size;
	covergroup ch7_cmd_reg2_cg;
		BUFFER_SIZE_CP : coverpoint buffer_size.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_cmd_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_cmd_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buffer_size = uvm_reg_field::type_id::create("buffer_size");
		buffer_size.configure(this, 9, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_cmd_reg3 extends uvm_reg;
	`uvm_object_utils(ch7_cmd_reg3)
	uvm_reg_field cmd_set_int;
	uvm_reg_field cmd_last;
	uvm_reg_field rsvd;
	uvm_reg_field cmd_next_addr;
	covergroup ch7_cmd_reg3_cg;
		CMD_SET_INT_CP : coverpoint cmd_set_int.value {
			option.auto_bin_max = 1;
		}
		CMD_LAST_CP : coverpoint cmd_last.value {
			option.auto_bin_max = 1;
		}
		CMD_NEXT_ADDR_CP : coverpoint cmd_next_addr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_cmd_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_cmd_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		cmd_set_int = uvm_reg_field::type_id::create("cmd_set_int");
		cmd_set_int.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		cmd_last = uvm_reg_field::type_id::create("cmd_last");
		cmd_last.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		cmd_next_addr = uvm_reg_field::type_id::create("cmd_next_addr");
		cmd_next_addr.configure(this, 28, 4, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_static_reg0 extends uvm_reg;
	`uvm_object_utils(ch7_static_reg0)
	uvm_reg_field rd_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_allow_full_burst;
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field rd_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field rd_outstanding;
	uvm_reg_field rd_incr;
	covergroup ch7_static_reg0_cg;
		RD_BURST_MAX_SIZE_CP : coverpoint rd_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_BURST_CP : coverpoint rd_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		RD_TOKENS_CP : coverpoint rd_tokens.value {
			option.auto_bin_max = 1;
		}
		RD_OUTS_MAX_CP : coverpoint rd_outs_max.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_CP : coverpoint rd_outstanding.value {
			option.auto_bin_max = 1;
		}
		RD_INCR_CP : coverpoint rd_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_static_reg0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_static_reg0_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_burst_max_size = uvm_reg_field::type_id::create("rd_burst_max_size");
		rd_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_burst = uvm_reg_field::type_id::create("rd_allow_full_burst");
		rd_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		rd_tokens = uvm_reg_field::type_id::create("rd_tokens");
		rd_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		rd_outs_max = uvm_reg_field::type_id::create("rd_outs_max");
		rd_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		rd_outstanding = uvm_reg_field::type_id::create("rd_outstanding");
		rd_outstanding.configure(this, 1, 30, "RW", 1, 0, 1, 1, 0);
		rd_incr = uvm_reg_field::type_id::create("rd_incr");
		rd_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch7_static_reg1 extends uvm_reg;
	`uvm_object_utils(ch7_static_reg1)
	uvm_reg_field wr_burst_max_size;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_allow_full_burst;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field rsvd2;
	uvm_reg_field wr_tokens;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_outs_max;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_outstanding;
	uvm_reg_field wr_incr;
	covergroup ch7_static_reg1_cg;
		WR_BURST_MAX_SIZE_CP : coverpoint wr_burst_max_size.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_BURST_CP : coverpoint wr_allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_TOKENS_CP : coverpoint wr_tokens.value {
			option.auto_bin_max = 1;
		}
		WR_OUTS_MAX_CP : coverpoint wr_outs_max.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_CP : coverpoint wr_outstanding.value {
			option.auto_bin_max = 1;
		}
		WR_INCR_CP : coverpoint wr_incr.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_static_reg1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_static_reg1_cg.sample();
	endfunction: sample_values

	virtual function void build();
		wr_burst_max_size = uvm_reg_field::type_id::create("wr_burst_max_size");
		wr_burst_max_size.configure(this, 10, 0, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_burst = uvm_reg_field::type_id::create("wr_allow_full_burst");
		wr_allow_full_burst.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		wr_tokens = uvm_reg_field::type_id::create("wr_tokens");
		wr_tokens.configure(this, 6, 16, "RW", 1, 1, 1, 1, 0);
		wr_outs_max = uvm_reg_field::type_id::create("wr_outs_max");
		wr_outs_max.configure(this, 4, 24, "RW", 1, 4, 1, 1, 0);
		wr_outstanding = uvm_reg_field::type_id::create("wr_outstanding");
		wr_outstanding.configure(this, 1, 30, "RW", 1, 1, 1, 1, 0);
		wr_incr = uvm_reg_field::type_id::create("wr_incr");
		wr_incr.configure(this, 1, 31, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch7_static_reg2 extends uvm_reg;
	`uvm_object_utils(ch7_static_reg2)
	uvm_reg_field frame_width;
	uvm_reg_field rsvd1;
	uvm_reg_field block;
	uvm_reg_field joint;
	uvm_reg_field auto_retry;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_cmd_port_num;
	uvm_reg_field rd_port_num;
	uvm_reg_field wr_port_num;
	uvm_reg_field rsvd3;
	uvm_reg_field int_num;
	uvm_reg_field rsvd4;
	uvm_reg_field end_swap;
	uvm_reg_field rsvd5;
	covergroup ch7_static_reg2_cg;
		FRAME_WIDTH_CP : coverpoint frame_width.value {
			option.auto_bin_max = 1;
		}
		BLOCK_CP : coverpoint block.value {
			option.auto_bin_max = 1;
		}
		JOINT_CP : coverpoint joint.value {
			option.auto_bin_max = 1;
		}
		AUTO_RETRY_CP : coverpoint auto_retry.value {
			option.auto_bin_max = 1;
		}
		RD_CMD_PORT_NUM_CP : coverpoint rd_cmd_port_num.value {
			option.auto_bin_max = 1;
		}
		RD_PORT_NUM_CP : coverpoint rd_port_num.value {
			option.auto_bin_max = 1;
		}
		WR_PORT_NUM_CP : coverpoint wr_port_num.value {
			option.auto_bin_max = 1;
		}
		INT_NUM_CP : coverpoint int_num.value {
			option.auto_bin_max = 1;
		}
		END_SWAP_CP : coverpoint end_swap.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_static_reg2");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg2_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg2_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_static_reg2_cg.sample();
	endfunction: sample_values

	virtual function void build();
		frame_width = uvm_reg_field::type_id::create("frame_width");
		frame_width.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		block = uvm_reg_field::type_id::create("block");
		block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		joint = uvm_reg_field::type_id::create("joint");
		joint.configure(this, 1, 16, "RW", 1, 0, 1, 1, 0);
		auto_retry = uvm_reg_field::type_id::create("auto_retry");
		auto_retry.configure(this, 1, 17, "RW", 1, 0, 1, 1, 0);
		rd_cmd_port_num = uvm_reg_field::type_id::create("rd_cmd_port_num");
		rd_cmd_port_num.configure(this, 1, 20, "RW", 1, 0, 1, 1, 0);
		rd_port_num = uvm_reg_field::type_id::create("rd_port_num");
		rd_port_num.configure(this, 1, 21, "RW", 1, 0, 1, 1, 0);
		wr_port_num = uvm_reg_field::type_id::create("wr_port_num");
		wr_port_num.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		int_num = uvm_reg_field::type_id::create("int_num");
		int_num.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		end_swap = uvm_reg_field::type_id::create("end_swap");
		end_swap.configure(this, 2, 28, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_static_reg3 extends uvm_reg;
	`uvm_object_utils(ch7_static_reg3)
	uvm_reg_field rd_wait_limit;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_wait_limit;
	uvm_reg_field rsvd2;
	covergroup ch7_static_reg3_cg;
		RD_WAIT_LIMIT_CP : coverpoint rd_wait_limit.value {
			option.auto_bin_max = 1;
		}
		WR_WAIT_LIMIT_CP : coverpoint wr_wait_limit.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_static_reg3");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg3_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg3_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_static_reg3_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_wait_limit = uvm_reg_field::type_id::create("rd_wait_limit");
		rd_wait_limit.configure(this, 12, 0, "RW", 1, 0, 1, 1, 0);
		wr_wait_limit = uvm_reg_field::type_id::create("wr_wait_limit");
		wr_wait_limit.configure(this, 12, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_static_reg4 extends uvm_reg;
	`uvm_object_utils(ch7_static_reg4)
	uvm_reg_field rd_periph_num;
	uvm_reg_field rsvd1;
	uvm_reg_field rd_periph_delay;
	uvm_reg_field rsvd2;
	uvm_reg_field rd_periph_block;
	uvm_reg_field wr_periph_num;
	uvm_reg_field rsvd3;
	uvm_reg_field wr_periph_delay;
	uvm_reg_field rsvd4;
	uvm_reg_field wr_periph_block;
	covergroup ch7_static_reg4_cg;
		RD_PERIPH_NUM_CP : coverpoint rd_periph_num.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_DELAY_CP : coverpoint rd_periph_delay.value {
			option.auto_bin_max = 1;
		}
		RD_PERIPH_BLOCK_CP : coverpoint rd_periph_block.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_NUM_CP : coverpoint wr_periph_num.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_DELAY_CP : coverpoint wr_periph_delay.value {
			option.auto_bin_max = 1;
		}
		WR_PERIPH_BLOCK_CP : coverpoint wr_periph_block.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_static_reg4");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg4_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_static_reg4_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_static_reg4_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_periph_num = uvm_reg_field::type_id::create("rd_periph_num");
		rd_periph_num.configure(this, 5, 0, "RW", 1, 0, 1, 1, 0);
		rd_periph_delay = uvm_reg_field::type_id::create("rd_periph_delay");
		rd_periph_delay.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		rd_periph_block = uvm_reg_field::type_id::create("rd_periph_block");
		rd_periph_block.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
		wr_periph_num = uvm_reg_field::type_id::create("wr_periph_num");
		wr_periph_num.configure(this, 5, 16, "RW", 1, 0, 1, 1, 0);
		wr_periph_delay = uvm_reg_field::type_id::create("wr_periph_delay");
		wr_periph_delay.configure(this, 3, 24, "RW", 1, 0, 1, 1, 0);
		wr_periph_block = uvm_reg_field::type_id::create("wr_periph_block");
		wr_periph_block.configure(this, 1, 31, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_restrict_reg extends uvm_reg;
	`uvm_object_utils(ch7_restrict_reg)
	uvm_reg_field rd_allow_full_fifo;
	uvm_reg_field wr_allow_full_fifo;
	uvm_reg_field allow_full_fifo;
	uvm_reg_field allow_full_burst;
	uvm_reg_field allow_joint_burst;
	uvm_reg_field rd_outstanding_stat;
	uvm_reg_field wr_outstanding_stat;
	uvm_reg_field block_non_align_stat;
	uvm_reg_field simple_stat;
	uvm_reg_field rsvd1;
	covergroup ch7_restrict_reg_cg;
		RD_ALLOW_FULL_FIFO_CP : coverpoint rd_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		WR_ALLOW_FULL_FIFO_CP : coverpoint wr_allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_FIFO_CP : coverpoint allow_full_fifo.value {
			option.auto_bin_max = 1;
		}
		ALLOW_FULL_BURST_CP : coverpoint allow_full_burst.value {
			option.auto_bin_max = 1;
		}
		ALLOW_JOINT_BURST_CP : coverpoint allow_joint_burst.value {
			option.auto_bin_max = 1;
		}
		RD_OUTSTANDING_STAT_CP : coverpoint rd_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		WR_OUTSTANDING_STAT_CP : coverpoint wr_outstanding_stat.value {
			option.auto_bin_max = 1;
		}
		BLOCK_NON_ALIGN_STAT_CP : coverpoint block_non_align_stat.value {
			option.auto_bin_max = 1;
		}
		SIMPLE_STAT_CP : coverpoint simple_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_restrict_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_restrict_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_restrict_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_restrict_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_allow_full_fifo = uvm_reg_field::type_id::create("rd_allow_full_fifo");
		rd_allow_full_fifo.configure(this, 1, 0, "RO", 1, 0, 1, 1, 0);
		wr_allow_full_fifo = uvm_reg_field::type_id::create("wr_allow_full_fifo");
		wr_allow_full_fifo.configure(this, 1, 1, "RO", 1, 0, 1, 1, 0);
		allow_full_fifo = uvm_reg_field::type_id::create("allow_full_fifo");
		allow_full_fifo.configure(this, 1, 2, "RO", 1, 0, 1, 1, 0);
		allow_full_burst = uvm_reg_field::type_id::create("allow_full_burst");
		allow_full_burst.configure(this, 1, 3, "RO", 1, 0, 1, 1, 0);
		allow_joint_burst = uvm_reg_field::type_id::create("allow_joint_burst");
		allow_joint_burst.configure(this, 1, 4, "RO", 1, 0, 1, 1, 0);
		rd_outstanding_stat = uvm_reg_field::type_id::create("rd_outstanding_stat");
		rd_outstanding_stat.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		wr_outstanding_stat = uvm_reg_field::type_id::create("wr_outstanding_stat");
		wr_outstanding_stat.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		block_non_align_stat = uvm_reg_field::type_id::create("block_non_align_stat");
		block_non_align_stat.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		simple_stat = uvm_reg_field::type_id::create("simple_stat");
		simple_stat.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_read_offset_reg extends uvm_reg;
	`uvm_object_utils(ch7_read_offset_reg)
	uvm_reg_field rd_offset;
	uvm_reg_field rsvd1;
	covergroup ch7_read_offset_reg_cg;
		RD_OFFSET_CP : coverpoint rd_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_read_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_read_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_read_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_read_offset_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		rd_offset = uvm_reg_field::type_id::create("rd_offset");
		rd_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_write_offset_reg extends uvm_reg;
	`uvm_object_utils(ch7_write_offset_reg)
	uvm_reg_field wr_offset;
	uvm_reg_field rsvd1;
	covergroup ch7_write_offset_reg_cg;
		WR_OFFSET_CP : coverpoint wr_offset.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_write_offset_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_write_offset_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_write_offset_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_write_offset_reg_cg.sample();
	endfunction: sample_values
  

	virtual function void build();
		wr_offset = uvm_reg_field::type_id::create("wr_offset");
		wr_offset.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_fifo_fullness_reg extends uvm_reg;
	`uvm_object_utils(ch7_fifo_fullness_reg)
	uvm_reg_field rd_gap;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_fullness;
	uvm_reg_field rsvd2;
	covergroup ch7_fifo_fullness_reg_cg;
		RD_GAP_CP : coverpoint rd_gap.value {
			option.auto_bin_max = 1;
		}
		WR_FULLNESS_CP : coverpoint wr_fullness.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_fifo_fullness_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_fifo_fullness_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_fifo_fullness_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_fifo_fullness_reg_cg.sample();
	endfunction: sample_values
   

	virtual function void build();
		rd_gap = uvm_reg_field::type_id::create("rd_gap");
		rd_gap.configure(this, 10, 0, "RO", 1, 7'h20, 1, 1, 0);
		wr_fullness = uvm_reg_field::type_id::create("wr_fullness");
		wr_fullness.configure(this, 10, 16, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_cmd_outs_reg extends uvm_reg;
	`uvm_object_utils(ch7_cmd_outs_reg)
	uvm_reg_field rd_cmd_outs;
	uvm_reg_field rsvd1;
	uvm_reg_field wr_cmd_outs;
	uvm_reg_field rsvd2;
	covergroup ch7_cmd_outs_reg_cg;
		RD_CMD_OUTS_CP : coverpoint rd_cmd_outs.value {
			option.auto_bin_max = 1;
		}
		WR_CMD_OUTS_CP : coverpoint wr_cmd_outs.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_cmd_outs_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_outs_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_cmd_outs_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_cmd_outs_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		rd_cmd_outs = uvm_reg_field::type_id::create("rd_cmd_outs");
		rd_cmd_outs.configure(this, 6, 0, "RW", 1, 63, 1, 1, 0);
		wr_cmd_outs = uvm_reg_field::type_id::create("wr_cmd_outs");
		wr_cmd_outs.configure(this, 6, 8, "RW", 1, 63, 1, 1, 0);
	endfunction

endclass
class ch7_ch_enable_reg extends uvm_reg;
	`uvm_object_utils(ch7_ch_enable_reg)
	uvm_reg_field ch_enable;
	uvm_reg_field rsvd1;
	covergroup ch7_ch_enable_reg_cg;
		CH_ENABLE_CP : coverpoint ch_enable.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_ch_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_ch_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_ch_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_ch_enable_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_enable = uvm_reg_field::type_id::create("ch_enable");
		ch_enable.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch7_ch_start_reg extends uvm_reg;
	`uvm_object_utils(ch7_ch_start_reg)
	uvm_reg_field ch_start;
	uvm_reg_field rsvd1;
	covergroup ch7_ch_start_reg_cg;
		CH_START_CP : coverpoint ch_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_ch_start_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_ch_start_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_ch_start_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_ch_start_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_start = uvm_reg_field::type_id::create("ch_start");
		ch_start.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_ch_active_reg extends uvm_reg;
	`uvm_object_utils(ch7_ch_active_reg)
	uvm_reg_field ch_rd_active;
	uvm_reg_field ch_wr_active;
	uvm_reg_field rsvd1;
	covergroup ch7_ch_active_reg_cg;
		CH_RD_ACTIVE_CP : coverpoint ch_rd_active.value {
			option.auto_bin_max = 1;
		}
		CH_WR_ACTIVE_CP : coverpoint ch_wr_active.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_ch_active_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_ch_active_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_ch_active_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_ch_active_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		ch_rd_active = uvm_reg_field::type_id::create("ch_rd_active");
		ch_rd_active.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		ch_wr_active = uvm_reg_field::type_id::create("ch_wr_active");
		ch_wr_active.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_count_reg extends uvm_reg;
	`uvm_object_utils(ch7_count_reg)
	uvm_reg_field buff_count;
	uvm_reg_field int_count;
	uvm_reg_field rsvd1;
	covergroup ch7_count_reg_cg;
		BUFF_COUNT_CP : coverpoint buff_count.value {
			option.auto_bin_max = 1;
		}
		INT_COUNT_CP : coverpoint int_count.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_count_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_count_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_count_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_count_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		buff_count = uvm_reg_field::type_id::create("buff_count");
		buff_count.configure(this, 16, 0, "RW", 1, 0, 1, 1, 0);
		int_count = uvm_reg_field::type_id::create("int_count");
		int_count.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_int_rawstat_reg extends uvm_reg;
	`uvm_object_utils(ch7_int_rawstat_reg)
	uvm_reg_field int_rawstat_ch_end;
	uvm_reg_field int_rawstat_rd_decerr;
	uvm_reg_field int_rawstat_rd_slverr;
	uvm_reg_field int_rawstat_wr_decerr;
	uvm_reg_field int_rawstat_wr_slverr;
	uvm_reg_field int_rawstat_overflow;
	uvm_reg_field int_rawstat_underflow;
	uvm_reg_field int_rawstat_timeout_r;
	uvm_reg_field int_rawstat_timeout_ar;
	uvm_reg_field int_rawstat_timeout_b;
	uvm_reg_field int_rawstat_timeout_w;
	uvm_reg_field int_rawstat_timeout_aw;
	uvm_reg_field int_rawstat_wdt;
	uvm_reg_field rsvd;
	covergroup ch7_int_rawstat_reg_cg;
		INT_RAWSTAT_CH_END_CP : coverpoint int_rawstat_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_DECERR_CP : coverpoint int_rawstat_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_RD_SLVERR_CP : coverpoint int_rawstat_rd_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_DECERR_CP : coverpoint int_rawstat_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WR_SLVERR_CP : coverpoint int_rawstat_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_OVERFLOW_CP : coverpoint int_rawstat_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_UNDERFLOW_CP : coverpoint int_rawstat_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_R_CP : coverpoint int_rawstat_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AR_CP : coverpoint int_rawstat_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_B_CP : coverpoint int_rawstat_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_W_CP : coverpoint int_rawstat_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_TIMEOUT_AW_CP : coverpoint int_rawstat_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_RAWSTAT_WDT_CP : coverpoint int_rawstat_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_int_rawstat_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_rawstat_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_rawstat_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_int_rawstat_reg_cg.sample();
	endfunction: sample_values
 

	virtual function void build();
		int_rawstat_ch_end = uvm_reg_field::type_id::create("int_rawstat_ch_end");
		int_rawstat_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_decerr = uvm_reg_field::type_id::create("int_rawstat_rd_decerr");
		int_rawstat_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_rawstat_rd_slverr = uvm_reg_field::type_id::create("int_rawstat_rd_slverr");
		int_rawstat_rd_slverr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_decerr = uvm_reg_field::type_id::create("int_rawstat_wr_decerr");
		int_rawstat_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wr_slverr = uvm_reg_field::type_id::create("int_rawstat_wr_slverr");
		int_rawstat_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_rawstat_overflow = uvm_reg_field::type_id::create("int_rawstat_overflow");
		int_rawstat_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_rawstat_underflow = uvm_reg_field::type_id::create("int_rawstat_underflow");
		int_rawstat_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_r = uvm_reg_field::type_id::create("int_rawstat_timeout_r");
		int_rawstat_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_ar = uvm_reg_field::type_id::create("int_rawstat_timeout_ar");
		int_rawstat_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_b = uvm_reg_field::type_id::create("int_rawstat_timeout_b");
		int_rawstat_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_w = uvm_reg_field::type_id::create("int_rawstat_timeout_w");
		int_rawstat_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_rawstat_timeout_aw = uvm_reg_field::type_id::create("int_rawstat_timeout_aw");
		int_rawstat_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_rawstat_wdt = uvm_reg_field::type_id::create("int_rawstat_wdt");
		int_rawstat_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_int_clear_reg extends uvm_reg;
	`uvm_object_utils(ch7_int_clear_reg)
	uvm_reg_field int_clr_ch_end;
	uvm_reg_field int_clr_rd_decerr;
	uvm_reg_field int_clr_rd_svlerr;
	uvm_reg_field int_clr_wr_decerr;
	uvm_reg_field int_clr_wr_slverr;
	uvm_reg_field int_clr_overflow;
	uvm_reg_field int_clr_underflow;
	uvm_reg_field int_clr_timeout_r;
	uvm_reg_field int_clr_timeout_ar;
	uvm_reg_field int_clr_timeout_b;
	uvm_reg_field int_clr_timeout_w;
	uvm_reg_field int_clr_timeout_aw;
	uvm_reg_field int_clr_wdt;
	uvm_reg_field rsvd1;
	covergroup ch7_int_clear_reg_cg;
		INT_CLR_CH_END_CP : coverpoint int_clr_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_DECERR_CP : coverpoint int_clr_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_RD_SVLERR_CP : coverpoint int_clr_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_DECERR_CP : coverpoint int_clr_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WR_SLVERR_CP : coverpoint int_clr_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_OVERFLOW_CP : coverpoint int_clr_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_UNDERFLOW_CP : coverpoint int_clr_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_R_CP : coverpoint int_clr_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AR_CP : coverpoint int_clr_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_B_CP : coverpoint int_clr_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_W_CP : coverpoint int_clr_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_TIMEOUT_AW_CP : coverpoint int_clr_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_CLR_WDT_CP : coverpoint int_clr_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_int_clear_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_clear_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_clear_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_int_clear_reg_cg.sample();
	endfunction: sample_values

	virtual function void build();
		int_clr_ch_end = uvm_reg_field::type_id::create("int_clr_ch_end");
		int_clr_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_decerr = uvm_reg_field::type_id::create("int_clr_rd_decerr");
		int_clr_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_clr_rd_svlerr = uvm_reg_field::type_id::create("int_clr_rd_svlerr");
		int_clr_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_decerr = uvm_reg_field::type_id::create("int_clr_wr_decerr");
		int_clr_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_clr_wr_slverr = uvm_reg_field::type_id::create("int_clr_wr_slverr");
		int_clr_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_clr_overflow = uvm_reg_field::type_id::create("int_clr_overflow");
		int_clr_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_clr_underflow = uvm_reg_field::type_id::create("int_clr_underflow");
		int_clr_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_r = uvm_reg_field::type_id::create("int_clr_timeout_r");
		int_clr_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_ar = uvm_reg_field::type_id::create("int_clr_timeout_ar");
		int_clr_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_b = uvm_reg_field::type_id::create("int_clr_timeout_b");
		int_clr_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_w = uvm_reg_field::type_id::create("int_clr_timeout_w");
		int_clr_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_clr_timeout_aw = uvm_reg_field::type_id::create("int_clr_timeout_aw");
		int_clr_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_clr_wdt = uvm_reg_field::type_id::create("int_clr_wdt");
		int_clr_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class ch7_int_enable_reg extends uvm_reg;
	`uvm_object_utils(ch7_int_enable_reg)
	uvm_reg_field int_enable_ch_end;
	uvm_reg_field int_enable_rd_decerr;
	uvm_reg_field int_enable_rd_svlerr;
	uvm_reg_field int_enable_wr_decerr;
	uvm_reg_field int_enable_wr_slverr;
	uvm_reg_field int_enable_overflow;
	uvm_reg_field int_enable_underflow;
	uvm_reg_field int_enable_timeout_r;
	uvm_reg_field int_enable_timeout_ar;
	uvm_reg_field int_enable_timeout_b;
	uvm_reg_field int_enable_timeout_w;
	uvm_reg_field int_enable_timeout_aw;
	uvm_reg_field int_enable_wdt;
	uvm_reg_field rsvd1;
	covergroup ch7_int_enable_reg_cg;
		INT_ENABLE_CH_END_CP : coverpoint int_enable_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_DECERR_CP : coverpoint int_enable_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_RD_SVLERR_CP : coverpoint int_enable_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_DECERR_CP : coverpoint int_enable_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WR_SLVERR_CP : coverpoint int_enable_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_OVERFLOW_CP : coverpoint int_enable_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_UNDERFLOW_CP : coverpoint int_enable_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_R_CP : coverpoint int_enable_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AR_CP : coverpoint int_enable_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_B_CP : coverpoint int_enable_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_W_CP : coverpoint int_enable_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_TIMEOUT_AW_CP : coverpoint int_enable_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_ENABLE_WDT_CP : coverpoint int_enable_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_int_enable_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_enable_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_enable_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_int_enable_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_enable_ch_end = uvm_reg_field::type_id::create("int_enable_ch_end");
		int_enable_ch_end.configure(this, 1, 0, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_decerr = uvm_reg_field::type_id::create("int_enable_rd_decerr");
		int_enable_rd_decerr.configure(this, 1, 1, "RW", 1, 1, 1, 1, 0);
		int_enable_rd_svlerr = uvm_reg_field::type_id::create("int_enable_rd_svlerr");
		int_enable_rd_svlerr.configure(this, 1, 2, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_decerr = uvm_reg_field::type_id::create("int_enable_wr_decerr");
		int_enable_wr_decerr.configure(this, 1, 3, "RW", 1, 1, 1, 1, 0);
		int_enable_wr_slverr = uvm_reg_field::type_id::create("int_enable_wr_slverr");
		int_enable_wr_slverr.configure(this, 1, 4, "RW", 1, 1, 1, 1, 0);
		int_enable_overflow = uvm_reg_field::type_id::create("int_enable_overflow");
		int_enable_overflow.configure(this, 1, 5, "RW", 1, 1, 1, 1, 0);
		int_enable_underflow = uvm_reg_field::type_id::create("int_enable_underflow");
		int_enable_underflow.configure(this, 1, 6, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_r = uvm_reg_field::type_id::create("int_enable_timeout_r");
		int_enable_timeout_r.configure(this, 1, 7, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_ar = uvm_reg_field::type_id::create("int_enable_timeout_ar");
		int_enable_timeout_ar.configure(this, 1, 8, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_b = uvm_reg_field::type_id::create("int_enable_timeout_b");
		int_enable_timeout_b.configure(this, 1, 9, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_w = uvm_reg_field::type_id::create("int_enable_timeout_w");
		int_enable_timeout_w.configure(this, 1, 10, "RW", 1, 1, 1, 1, 0);
		int_enable_timeout_aw = uvm_reg_field::type_id::create("int_enable_timeout_aw");
		int_enable_timeout_aw.configure(this, 1, 11, "RW", 1, 1, 1, 1, 0);
		int_enable_wdt = uvm_reg_field::type_id::create("int_enable_wdt");
		int_enable_wdt.configure(this, 1, 12, "RW", 1, 1, 1, 1, 0);
	endfunction

endclass
class ch7_int_status_reg extends uvm_reg;
	`uvm_object_utils(ch7_int_status_reg)
	uvm_reg_field int_status_ch_end;
	uvm_reg_field int_status_rd_decerr;
	uvm_reg_field int_status_rd_svlerr;
	uvm_reg_field int_status_wr_decerr;
	uvm_reg_field int_status_wr_slverr;
	uvm_reg_field int_status_overflow;
	uvm_reg_field int_status_underflow;
	uvm_reg_field int_status_timeout_r;
	uvm_reg_field int_status_timeout_ar;
	uvm_reg_field int_status_timeout_b;
	uvm_reg_field int_status_timeout_w;
	uvm_reg_field int_status_timeout_aw;
	uvm_reg_field int_status_wdt;
	uvm_reg_field rsvd1;
	covergroup ch7_int_status_reg_cg;
		INT_STATUS_CH_END_CP : coverpoint int_status_ch_end.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_DECERR_CP : coverpoint int_status_rd_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_RD_SVLERR_CP : coverpoint int_status_rd_svlerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_DECERR_CP : coverpoint int_status_wr_decerr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WR_SLVERR_CP : coverpoint int_status_wr_slverr.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_OVERFLOW_CP : coverpoint int_status_overflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_UNDERFLOW_CP : coverpoint int_status_underflow.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_R_CP : coverpoint int_status_timeout_r.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AR_CP : coverpoint int_status_timeout_ar.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_B_CP : coverpoint int_status_timeout_b.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_W_CP : coverpoint int_status_timeout_w.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_TIMEOUT_AW_CP : coverpoint int_status_timeout_aw.value {
			option.auto_bin_max = 1;
		}
		INT_STATUS_WDT_CP : coverpoint int_status_wdt.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "ch7_int_status_reg");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_status_reg_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			ch7_int_status_reg_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			ch7_int_status_reg_cg.sample();
	endfunction: sample_values


	virtual function void build();
		int_status_ch_end = uvm_reg_field::type_id::create("int_status_ch_end");
		int_status_ch_end.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		int_status_rd_decerr = uvm_reg_field::type_id::create("int_status_rd_decerr");
		int_status_rd_decerr.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		int_status_rd_svlerr = uvm_reg_field::type_id::create("int_status_rd_svlerr");
		int_status_rd_svlerr.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		int_status_wr_decerr = uvm_reg_field::type_id::create("int_status_wr_decerr");
		int_status_wr_decerr.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		int_status_wr_slverr = uvm_reg_field::type_id::create("int_status_wr_slverr");
		int_status_wr_slverr.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		int_status_overflow = uvm_reg_field::type_id::create("int_status_overflow");
		int_status_overflow.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		int_status_underflow = uvm_reg_field::type_id::create("int_status_underflow");
		int_status_underflow.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_r = uvm_reg_field::type_id::create("int_status_timeout_r");
		int_status_timeout_r.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_ar = uvm_reg_field::type_id::create("int_status_timeout_ar");
		int_status_timeout_ar.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_b = uvm_reg_field::type_id::create("int_status_timeout_b");
		int_status_timeout_b.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_w = uvm_reg_field::type_id::create("int_status_timeout_w");
		int_status_timeout_w.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		int_status_timeout_aw = uvm_reg_field::type_id::create("int_status_timeout_aw");
		int_status_timeout_aw.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		int_status_wdt = uvm_reg_field::type_id::create("int_status_wdt");
		int_status_wdt.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int0_status extends uvm_reg;
	`uvm_object_utils(int0_status)
	uvm_reg_field core0_ch0_int0_stat;
	uvm_reg_field core0_ch1_int0_stat;
	uvm_reg_field core0_ch2_int0_stat;
	uvm_reg_field core0_ch3_int0_stat;
	uvm_reg_field core0_ch4_int0_stat;
	uvm_reg_field core0_ch5_int0_stat;
	uvm_reg_field core0_ch6_int0_stat;
	uvm_reg_field core0_ch7_int0_stat;
	uvm_reg_field core1_ch0_int0_stat;
	uvm_reg_field core1_ch1_int0_stat;
	uvm_reg_field core1_ch2_int0_stat;
	uvm_reg_field core1_ch3_int0_stat;
	uvm_reg_field core1_ch4_int0_stat;
	uvm_reg_field core1_ch5_int0_stat;
	uvm_reg_field core1_ch6_int0_stat;
	uvm_reg_field core1_ch7_int0_stat;
	uvm_reg_field rsvd;
	covergroup int0_status_cg;
		CORE0_CH0_INT0_STAT_CP : coverpoint core0_ch0_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT0_STAT_CP : coverpoint core0_ch1_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT0_STAT_CP : coverpoint core0_ch2_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT0_STAT_CP : coverpoint core0_ch3_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT0_STAT_CP : coverpoint core0_ch4_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT0_STAT_CP : coverpoint core0_ch5_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT0_STAT_CP : coverpoint core0_ch6_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT0_STAT_CP : coverpoint core0_ch7_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT0_STAT_CP : coverpoint core1_ch0_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT0_STAT_CP : coverpoint core1_ch1_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT0_STAT_CP : coverpoint core1_ch2_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT0_STAT_CP : coverpoint core1_ch3_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT0_STAT_CP : coverpoint core1_ch4_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT0_STAT_CP : coverpoint core1_ch5_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT0_STAT_CP : coverpoint core1_ch6_int0_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT0_STAT_CP : coverpoint core1_ch7_int0_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int0_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int0_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int0_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int0_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int0_stat = uvm_reg_field::type_id::create("core0_ch0_int0_stat");
		core0_ch0_int0_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int0_stat = uvm_reg_field::type_id::create("core0_ch1_int0_stat");
		core0_ch1_int0_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int0_stat = uvm_reg_field::type_id::create("core0_ch2_int0_stat");
		core0_ch2_int0_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int0_stat = uvm_reg_field::type_id::create("core0_ch3_int0_stat");
		core0_ch3_int0_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int0_stat = uvm_reg_field::type_id::create("core0_ch4_int0_stat");
		core0_ch4_int0_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int0_stat = uvm_reg_field::type_id::create("core0_ch5_int0_stat");
		core0_ch5_int0_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int0_stat = uvm_reg_field::type_id::create("core0_ch6_int0_stat");
		core0_ch6_int0_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int0_stat = uvm_reg_field::type_id::create("core0_ch7_int0_stat");
		core0_ch7_int0_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int0_stat = uvm_reg_field::type_id::create("core1_ch0_int0_stat");
		core1_ch0_int0_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int0_stat = uvm_reg_field::type_id::create("core1_ch1_int0_stat");
		core1_ch1_int0_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int0_stat = uvm_reg_field::type_id::create("core1_ch2_int0_stat");
		core1_ch2_int0_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int0_stat = uvm_reg_field::type_id::create("core1_ch3_int0_stat");
		core1_ch3_int0_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int0_stat = uvm_reg_field::type_id::create("core1_ch4_int0_stat");
		core1_ch4_int0_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int0_stat = uvm_reg_field::type_id::create("core1_ch5_int0_stat");
		core1_ch5_int0_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int0_stat = uvm_reg_field::type_id::create("core1_ch6_int0_stat");
		core1_ch6_int0_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int0_stat = uvm_reg_field::type_id::create("core1_ch7_int0_stat");
		core1_ch7_int0_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int1_status extends uvm_reg;
	`uvm_object_utils(int1_status)
	uvm_reg_field core0_ch0_int1_stat;
	uvm_reg_field core0_ch1_int1_stat;
	uvm_reg_field core0_ch2_int1_stat;
	uvm_reg_field core0_ch3_int1_stat;
	uvm_reg_field core0_ch4_int1_stat;
	uvm_reg_field core0_ch5_int1_stat;
	uvm_reg_field core0_ch6_int1_stat;
	uvm_reg_field core0_ch7_int1_stat;
	uvm_reg_field core1_ch0_int1_stat;
	uvm_reg_field core1_ch1_int1_stat;
	uvm_reg_field core1_ch2_int1_stat;
	uvm_reg_field core1_ch3_int1_stat;
	uvm_reg_field core1_ch4_int1_stat;
	uvm_reg_field core1_ch5_int1_stat;
	uvm_reg_field core1_ch6_int1_stat;
	uvm_reg_field core1_ch7_int1_stat;
	uvm_reg_field rsvd;
	covergroup int1_status_cg;
		CORE0_CH0_INT1_STAT_CP : coverpoint core0_ch0_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT1_STAT_CP : coverpoint core0_ch1_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT1_STAT_CP : coverpoint core0_ch2_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT1_STAT_CP : coverpoint core0_ch3_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT1_STAT_CP : coverpoint core0_ch4_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT1_STAT_CP : coverpoint core0_ch5_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT1_STAT_CP : coverpoint core0_ch6_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT1_STAT_CP : coverpoint core0_ch7_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT1_STAT_CP : coverpoint core1_ch0_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT1_STAT_CP : coverpoint core1_ch1_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT1_STAT_CP : coverpoint core1_ch2_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT1_STAT_CP : coverpoint core1_ch3_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT1_STAT_CP : coverpoint core1_ch4_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT1_STAT_CP : coverpoint core1_ch5_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT1_STAT_CP : coverpoint core1_ch6_int1_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT1_STAT_CP : coverpoint core1_ch7_int1_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int1_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int1_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int1_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int1_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int1_stat = uvm_reg_field::type_id::create("core0_ch0_int1_stat");
		core0_ch0_int1_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int1_stat = uvm_reg_field::type_id::create("core0_ch1_int1_stat");
		core0_ch1_int1_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int1_stat = uvm_reg_field::type_id::create("core0_ch2_int1_stat");
		core0_ch2_int1_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int1_stat = uvm_reg_field::type_id::create("core0_ch3_int1_stat");
		core0_ch3_int1_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int1_stat = uvm_reg_field::type_id::create("core0_ch4_int1_stat");
		core0_ch4_int1_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int1_stat = uvm_reg_field::type_id::create("core0_ch5_int1_stat");
		core0_ch5_int1_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int1_stat = uvm_reg_field::type_id::create("core0_ch6_int1_stat");
		core0_ch6_int1_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int1_stat = uvm_reg_field::type_id::create("core0_ch7_int1_stat");
		core0_ch7_int1_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int1_stat = uvm_reg_field::type_id::create("core1_ch0_int1_stat");
		core1_ch0_int1_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int1_stat = uvm_reg_field::type_id::create("core1_ch1_int1_stat");
		core1_ch1_int1_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int1_stat = uvm_reg_field::type_id::create("core1_ch2_int1_stat");
		core1_ch2_int1_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int1_stat = uvm_reg_field::type_id::create("core1_ch3_int1_stat");
		core1_ch3_int1_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int1_stat = uvm_reg_field::type_id::create("core1_ch4_int1_stat");
		core1_ch4_int1_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int1_stat = uvm_reg_field::type_id::create("core1_ch5_int1_stat");
		core1_ch5_int1_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int1_stat = uvm_reg_field::type_id::create("core1_ch6_int1_stat");
		core1_ch6_int1_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int1_stat = uvm_reg_field::type_id::create("core1_ch7_int1_stat");
		core1_ch7_int1_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int2_status extends uvm_reg;
	`uvm_object_utils(int2_status)
	uvm_reg_field core0_ch0_int2_stat;
	uvm_reg_field core0_ch1_int2_stat;
	uvm_reg_field core0_ch2_int2_stat;
	uvm_reg_field core0_ch3_int2_stat;
	uvm_reg_field core0_ch4_int2_stat;
	uvm_reg_field core0_ch5_int2_stat;
	uvm_reg_field core0_ch6_int2_stat;
	uvm_reg_field core0_ch7_int2_stat;
	uvm_reg_field core1_ch0_int2_stat;
	uvm_reg_field core1_ch1_int2_stat;
	uvm_reg_field core1_ch2_int2_stat;
	uvm_reg_field core1_ch3_int2_stat;
	uvm_reg_field core1_ch4_int2_stat;
	uvm_reg_field core1_ch5_int2_stat;
	uvm_reg_field core1_ch6_int2_stat;
	uvm_reg_field core1_ch7_int2_stat;
	uvm_reg_field rsvd;
	covergroup int2_status_cg;
		CORE0_CH0_INT2_STAT_CP : coverpoint core0_ch0_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT2_STAT_CP : coverpoint core0_ch1_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT2_STAT_CP : coverpoint core0_ch2_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT2_STAT_CP : coverpoint core0_ch3_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT2_STAT_CP : coverpoint core0_ch4_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT2_STAT_CP : coverpoint core0_ch5_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT2_STAT_CP : coverpoint core0_ch6_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT2_STAT_CP : coverpoint core0_ch7_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT2_STAT_CP : coverpoint core1_ch0_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT2_STAT_CP : coverpoint core1_ch1_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT2_STAT_CP : coverpoint core1_ch2_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT2_STAT_CP : coverpoint core1_ch3_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT2_STAT_CP : coverpoint core1_ch4_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT2_STAT_CP : coverpoint core1_ch5_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT2_STAT_CP : coverpoint core1_ch6_int2_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT2_STAT_CP : coverpoint core1_ch7_int2_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int2_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int2_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int2_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int2_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int2_stat = uvm_reg_field::type_id::create("core0_ch0_int2_stat");
		core0_ch0_int2_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int2_stat = uvm_reg_field::type_id::create("core0_ch1_int2_stat");
		core0_ch1_int2_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int2_stat = uvm_reg_field::type_id::create("core0_ch2_int2_stat");
		core0_ch2_int2_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int2_stat = uvm_reg_field::type_id::create("core0_ch3_int2_stat");
		core0_ch3_int2_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int2_stat = uvm_reg_field::type_id::create("core0_ch4_int2_stat");
		core0_ch4_int2_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int2_stat = uvm_reg_field::type_id::create("core0_ch5_int2_stat");
		core0_ch5_int2_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int2_stat = uvm_reg_field::type_id::create("core0_ch6_int2_stat");
		core0_ch6_int2_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int2_stat = uvm_reg_field::type_id::create("core0_ch7_int2_stat");
		core0_ch7_int2_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int2_stat = uvm_reg_field::type_id::create("core1_ch0_int2_stat");
		core1_ch0_int2_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int2_stat = uvm_reg_field::type_id::create("core1_ch1_int2_stat");
		core1_ch1_int2_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int2_stat = uvm_reg_field::type_id::create("core1_ch2_int2_stat");
		core1_ch2_int2_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int2_stat = uvm_reg_field::type_id::create("core1_ch3_int2_stat");
		core1_ch3_int2_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int2_stat = uvm_reg_field::type_id::create("core1_ch4_int2_stat");
		core1_ch4_int2_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int2_stat = uvm_reg_field::type_id::create("core1_ch5_int2_stat");
		core1_ch5_int2_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int2_stat = uvm_reg_field::type_id::create("core1_ch6_int2_stat");
		core1_ch6_int2_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int2_stat = uvm_reg_field::type_id::create("core1_ch7_int2_stat");
		core1_ch7_int2_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int3_status extends uvm_reg;
	`uvm_object_utils(int3_status)
	uvm_reg_field core0_ch0_int3_stat;
	uvm_reg_field core0_ch1_int3_stat;
	uvm_reg_field core0_ch2_int3_stat;
	uvm_reg_field core0_ch3_int3_stat;
	uvm_reg_field core0_ch4_int3_stat;
	uvm_reg_field core0_ch5_int3_stat;
	uvm_reg_field core0_ch6_int3_stat;
	uvm_reg_field core0_ch7_int3_stat;
	uvm_reg_field core1_ch0_int3_stat;
	uvm_reg_field core1_ch1_int3_stat;
	uvm_reg_field core1_ch2_int3_stat;
	uvm_reg_field core1_ch3_int3_stat;
	uvm_reg_field core1_ch4_int3_stat;
	uvm_reg_field core1_ch5_int3_stat;
	uvm_reg_field core1_ch6_int3_stat;
	uvm_reg_field core1_ch7_int3_stat;
	uvm_reg_field rsvd;
	covergroup int3_status_cg;
		CORE0_CH0_INT3_STAT_CP : coverpoint core0_ch0_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT3_STAT_CP : coverpoint core0_ch1_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT3_STAT_CP : coverpoint core0_ch2_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT3_STAT_CP : coverpoint core0_ch3_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT3_STAT_CP : coverpoint core0_ch4_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT3_STAT_CP : coverpoint core0_ch5_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT3_STAT_CP : coverpoint core0_ch6_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT3_STAT_CP : coverpoint core0_ch7_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT3_STAT_CP : coverpoint core1_ch0_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT3_STAT_CP : coverpoint core1_ch1_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT3_STAT_CP : coverpoint core1_ch2_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT3_STAT_CP : coverpoint core1_ch3_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT3_STAT_CP : coverpoint core1_ch4_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT3_STAT_CP : coverpoint core1_ch5_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT3_STAT_CP : coverpoint core1_ch6_int3_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT3_STAT_CP : coverpoint core1_ch7_int3_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int3_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int3_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int3_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int3_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int3_stat = uvm_reg_field::type_id::create("core0_ch0_int3_stat");
		core0_ch0_int3_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int3_stat = uvm_reg_field::type_id::create("core0_ch1_int3_stat");
		core0_ch1_int3_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int3_stat = uvm_reg_field::type_id::create("core0_ch2_int3_stat");
		core0_ch2_int3_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int3_stat = uvm_reg_field::type_id::create("core0_ch3_int3_stat");
		core0_ch3_int3_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int3_stat = uvm_reg_field::type_id::create("core0_ch4_int3_stat");
		core0_ch4_int3_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int3_stat = uvm_reg_field::type_id::create("core0_ch5_int3_stat");
		core0_ch5_int3_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int3_stat = uvm_reg_field::type_id::create("core0_ch6_int3_stat");
		core0_ch6_int3_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int3_stat = uvm_reg_field::type_id::create("core0_ch7_int3_stat");
		core0_ch7_int3_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int3_stat = uvm_reg_field::type_id::create("core1_ch0_int3_stat");
		core1_ch0_int3_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int3_stat = uvm_reg_field::type_id::create("core1_ch1_int3_stat");
		core1_ch1_int3_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int3_stat = uvm_reg_field::type_id::create("core1_ch2_int3_stat");
		core1_ch2_int3_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int3_stat = uvm_reg_field::type_id::create("core1_ch3_int3_stat");
		core1_ch3_int3_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int3_stat = uvm_reg_field::type_id::create("core1_ch4_int3_stat");
		core1_ch4_int3_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int3_stat = uvm_reg_field::type_id::create("core1_ch5_int3_stat");
		core1_ch5_int3_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int3_stat = uvm_reg_field::type_id::create("core1_ch6_int3_stat");
		core1_ch6_int3_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int3_stat = uvm_reg_field::type_id::create("core1_ch7_int3_stat");
		core1_ch7_int3_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int4_status extends uvm_reg;
	`uvm_object_utils(int4_status)
	uvm_reg_field core0_ch0_int4_stat;
	uvm_reg_field core0_ch1_int4_stat;
	uvm_reg_field core0_ch2_int4_stat;
	uvm_reg_field core0_ch3_int4_stat;
	uvm_reg_field core0_ch4_int4_stat;
	uvm_reg_field core0_ch5_int4_stat;
	uvm_reg_field core0_ch6_int4_stat;
	uvm_reg_field core0_ch7_int4_stat;
	uvm_reg_field core1_ch0_int4_stat;
	uvm_reg_field core1_ch1_int4_stat;
	uvm_reg_field core1_ch2_int4_stat;
	uvm_reg_field core1_ch3_int4_stat;
	uvm_reg_field core1_ch4_int4_stat;
	uvm_reg_field core1_ch5_int4_stat;
	uvm_reg_field core1_ch6_int4_stat;
	uvm_reg_field core1_ch7_int4_stat;
	uvm_reg_field rsvd;
	covergroup int4_status_cg;
		CORE0_CH0_INT4_STAT_CP : coverpoint core0_ch0_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT4_STAT_CP : coverpoint core0_ch1_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT4_STAT_CP : coverpoint core0_ch2_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT4_STAT_CP : coverpoint core0_ch3_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT4_STAT_CP : coverpoint core0_ch4_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT4_STAT_CP : coverpoint core0_ch5_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT4_STAT_CP : coverpoint core0_ch6_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT4_STAT_CP : coverpoint core0_ch7_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT4_STAT_CP : coverpoint core1_ch0_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT4_STAT_CP : coverpoint core1_ch1_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT4_STAT_CP : coverpoint core1_ch2_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT4_STAT_CP : coverpoint core1_ch3_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT4_STAT_CP : coverpoint core1_ch4_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT4_STAT_CP : coverpoint core1_ch5_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT4_STAT_CP : coverpoint core1_ch6_int4_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT4_STAT_CP : coverpoint core1_ch7_int4_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int4_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int4_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int4_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int4_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int4_stat = uvm_reg_field::type_id::create("core0_ch0_int4_stat");
		core0_ch0_int4_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int4_stat = uvm_reg_field::type_id::create("core0_ch1_int4_stat");
		core0_ch1_int4_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int4_stat = uvm_reg_field::type_id::create("core0_ch2_int4_stat");
		core0_ch2_int4_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int4_stat = uvm_reg_field::type_id::create("core0_ch3_int4_stat");
		core0_ch3_int4_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int4_stat = uvm_reg_field::type_id::create("core0_ch4_int4_stat");
		core0_ch4_int4_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int4_stat = uvm_reg_field::type_id::create("core0_ch5_int4_stat");
		core0_ch5_int4_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int4_stat = uvm_reg_field::type_id::create("core0_ch6_int4_stat");
		core0_ch6_int4_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int4_stat = uvm_reg_field::type_id::create("core0_ch7_int4_stat");
		core0_ch7_int4_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int4_stat = uvm_reg_field::type_id::create("core1_ch0_int4_stat");
		core1_ch0_int4_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int4_stat = uvm_reg_field::type_id::create("core1_ch1_int4_stat");
		core1_ch1_int4_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int4_stat = uvm_reg_field::type_id::create("core1_ch2_int4_stat");
		core1_ch2_int4_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int4_stat = uvm_reg_field::type_id::create("core1_ch3_int4_stat");
		core1_ch3_int4_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int4_stat = uvm_reg_field::type_id::create("core1_ch4_int4_stat");
		core1_ch4_int4_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int4_stat = uvm_reg_field::type_id::create("core1_ch5_int4_stat");
		core1_ch5_int4_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int4_stat = uvm_reg_field::type_id::create("core1_ch6_int4_stat");
		core1_ch6_int4_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int4_stat = uvm_reg_field::type_id::create("core1_ch7_int4_stat");
		core1_ch7_int4_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int5_status extends uvm_reg;
	`uvm_object_utils(int5_status)
	uvm_reg_field core0_ch0_int5_stat;
	uvm_reg_field core0_ch1_int5_stat;
	uvm_reg_field core0_ch2_int5_stat;
	uvm_reg_field core0_ch3_int5_stat;
	uvm_reg_field core0_ch4_int5_stat;
	uvm_reg_field core0_ch5_int5_stat;
	uvm_reg_field core0_ch6_int5_stat;
	uvm_reg_field core0_ch7_int5_stat;
	uvm_reg_field core1_ch0_int5_stat;
	uvm_reg_field core1_ch1_int5_stat;
	uvm_reg_field core1_ch2_int5_stat;
	uvm_reg_field core1_ch3_int5_stat;
	uvm_reg_field core1_ch4_int5_stat;
	uvm_reg_field core1_ch5_int5_stat;
	uvm_reg_field core1_ch6_int5_stat;
	uvm_reg_field core1_ch7_int5_stat;
	uvm_reg_field rsvd;
	covergroup int5_status_cg;
		CORE0_CH0_INT5_STAT_CP : coverpoint core0_ch0_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT5_STAT_CP : coverpoint core0_ch1_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT5_STAT_CP : coverpoint core0_ch2_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT5_STAT_CP : coverpoint core0_ch3_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT5_STAT_CP : coverpoint core0_ch4_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT5_STAT_CP : coverpoint core0_ch5_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT5_STAT_CP : coverpoint core0_ch6_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT5_STAT_CP : coverpoint core0_ch7_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT5_STAT_CP : coverpoint core1_ch0_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT5_STAT_CP : coverpoint core1_ch1_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT5_STAT_CP : coverpoint core1_ch2_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT5_STAT_CP : coverpoint core1_ch3_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT5_STAT_CP : coverpoint core1_ch4_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT5_STAT_CP : coverpoint core1_ch5_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT5_STAT_CP : coverpoint core1_ch6_int5_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT5_STAT_CP : coverpoint core1_ch7_int5_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int5_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int5_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int5_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int5_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int5_stat = uvm_reg_field::type_id::create("core0_ch0_int5_stat");
		core0_ch0_int5_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int5_stat = uvm_reg_field::type_id::create("core0_ch1_int5_stat");
		core0_ch1_int5_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int5_stat = uvm_reg_field::type_id::create("core0_ch2_int5_stat");
		core0_ch2_int5_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int5_stat = uvm_reg_field::type_id::create("core0_ch3_int5_stat");
		core0_ch3_int5_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int5_stat = uvm_reg_field::type_id::create("core0_ch4_int5_stat");
		core0_ch4_int5_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int5_stat = uvm_reg_field::type_id::create("core0_ch5_int5_stat");
		core0_ch5_int5_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int5_stat = uvm_reg_field::type_id::create("core0_ch6_int5_stat");
		core0_ch6_int5_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int5_stat = uvm_reg_field::type_id::create("core0_ch7_int5_stat");
		core0_ch7_int5_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int5_stat = uvm_reg_field::type_id::create("core1_ch0_int5_stat");
		core1_ch0_int5_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int5_stat = uvm_reg_field::type_id::create("core1_ch1_int5_stat");
		core1_ch1_int5_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int5_stat = uvm_reg_field::type_id::create("core1_ch2_int5_stat");
		core1_ch2_int5_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int5_stat = uvm_reg_field::type_id::create("core1_ch3_int5_stat");
		core1_ch3_int5_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int5_stat = uvm_reg_field::type_id::create("core1_ch4_int5_stat");
		core1_ch4_int5_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int5_stat = uvm_reg_field::type_id::create("core1_ch5_int5_stat");
		core1_ch5_int5_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int5_stat = uvm_reg_field::type_id::create("core1_ch6_int5_stat");
		core1_ch6_int5_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int5_stat = uvm_reg_field::type_id::create("core1_ch7_int5_stat");
		core1_ch7_int5_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int6_status extends uvm_reg;
	`uvm_object_utils(int6_status)
	uvm_reg_field core0_ch0_int6_stat;
	uvm_reg_field core0_ch1_int6_stat;
	uvm_reg_field core0_ch2_int6_stat;
	uvm_reg_field core0_ch3_int6_stat;
	uvm_reg_field core0_ch4_int6_stat;
	uvm_reg_field core0_ch5_int6_stat;
	uvm_reg_field core0_ch6_int6_stat;
	uvm_reg_field core0_ch7_int6_stat;
	uvm_reg_field core1_ch0_int6_stat;
	uvm_reg_field core1_ch1_int6_stat;
	uvm_reg_field core1_ch2_int6_stat;
	uvm_reg_field core1_ch3_int6_stat;
	uvm_reg_field core1_ch4_int6_stat;
	uvm_reg_field core1_ch5_int6_stat;
	uvm_reg_field core1_ch6_int6_stat;
	uvm_reg_field core1_ch7_int6_stat;
	uvm_reg_field rsvd;
	covergroup int6_status_cg;
		CORE0_CH0_INT6_STAT_CP : coverpoint core0_ch0_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT6_STAT_CP : coverpoint core0_ch1_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT6_STAT_CP : coverpoint core0_ch2_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT6_STAT_CP : coverpoint core0_ch3_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT6_STAT_CP : coverpoint core0_ch4_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT6_STAT_CP : coverpoint core0_ch5_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT6_STAT_CP : coverpoint core0_ch6_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT6_STAT_CP : coverpoint core0_ch7_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT6_STAT_CP : coverpoint core1_ch0_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT6_STAT_CP : coverpoint core1_ch1_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT6_STAT_CP : coverpoint core1_ch2_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT6_STAT_CP : coverpoint core1_ch3_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT6_STAT_CP : coverpoint core1_ch4_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT6_STAT_CP : coverpoint core1_ch5_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT6_STAT_CP : coverpoint core1_ch6_int6_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT6_STAT_CP : coverpoint core1_ch7_int6_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int6_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int6_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int6_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int6_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int6_stat = uvm_reg_field::type_id::create("core0_ch0_int6_stat");
		core0_ch0_int6_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int6_stat = uvm_reg_field::type_id::create("core0_ch1_int6_stat");
		core0_ch1_int6_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int6_stat = uvm_reg_field::type_id::create("core0_ch2_int6_stat");
		core0_ch2_int6_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int6_stat = uvm_reg_field::type_id::create("core0_ch3_int6_stat");
		core0_ch3_int6_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int6_stat = uvm_reg_field::type_id::create("core0_ch4_int6_stat");
		core0_ch4_int6_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int6_stat = uvm_reg_field::type_id::create("core0_ch5_int6_stat");
		core0_ch5_int6_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int6_stat = uvm_reg_field::type_id::create("core0_ch6_int6_stat");
		core0_ch6_int6_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int6_stat = uvm_reg_field::type_id::create("core0_ch7_int6_stat");
		core0_ch7_int6_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int6_stat = uvm_reg_field::type_id::create("core1_ch0_int6_stat");
		core1_ch0_int6_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int6_stat = uvm_reg_field::type_id::create("core1_ch1_int6_stat");
		core1_ch1_int6_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int6_stat = uvm_reg_field::type_id::create("core1_ch2_int6_stat");
		core1_ch2_int6_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int6_stat = uvm_reg_field::type_id::create("core1_ch3_int6_stat");
		core1_ch3_int6_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int6_stat = uvm_reg_field::type_id::create("core1_ch4_int6_stat");
		core1_ch4_int6_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int6_stat = uvm_reg_field::type_id::create("core1_ch5_int6_stat");
		core1_ch5_int6_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int6_stat = uvm_reg_field::type_id::create("core1_ch6_int6_stat");
		core1_ch6_int6_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int6_stat = uvm_reg_field::type_id::create("core1_ch7_int6_stat");
		core1_ch7_int6_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class int7_status extends uvm_reg;
	`uvm_object_utils(int7_status)
	uvm_reg_field core0_ch0_int7_stat;
	uvm_reg_field core0_ch1_int7_stat;
	uvm_reg_field core0_ch2_int7_stat;
	uvm_reg_field core0_ch3_int7_stat;
	uvm_reg_field core0_ch4_int7_stat;
	uvm_reg_field core0_ch5_int7_stat;
	uvm_reg_field core0_ch6_int7_stat;
	uvm_reg_field core0_ch7_int7_stat;
	uvm_reg_field core1_ch0_int7_stat;
	uvm_reg_field core1_ch1_int7_stat;
	uvm_reg_field core1_ch2_int7_stat;
	uvm_reg_field core1_ch3_int7_stat;
	uvm_reg_field core1_ch4_int7_stat;
	uvm_reg_field core1_ch5_int7_stat;
	uvm_reg_field core1_ch6_int7_stat;
	uvm_reg_field core1_ch7_int7_stat;
	uvm_reg_field rsvd;
	covergroup int7_status_cg;
		CORE0_CH0_INT7_STAT_CP : coverpoint core0_ch0_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH1_INT7_STAT_CP : coverpoint core0_ch1_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH2_INT7_STAT_CP : coverpoint core0_ch2_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH3_INT7_STAT_CP : coverpoint core0_ch3_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH4_INT7_STAT_CP : coverpoint core0_ch4_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH5_INT7_STAT_CP : coverpoint core0_ch5_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH6_INT7_STAT_CP : coverpoint core0_ch6_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE0_CH7_INT7_STAT_CP : coverpoint core0_ch7_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH0_INT7_STAT_CP : coverpoint core1_ch0_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH1_INT7_STAT_CP : coverpoint core1_ch1_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH2_INT7_STAT_CP : coverpoint core1_ch2_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH3_INT7_STAT_CP : coverpoint core1_ch3_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH4_INT7_STAT_CP : coverpoint core1_ch4_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH5_INT7_STAT_CP : coverpoint core1_ch5_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH6_INT7_STAT_CP : coverpoint core1_ch6_int7_stat.value {
			option.auto_bin_max = 1;
		}
		CORE1_CH7_INT7_STAT_CP : coverpoint core1_ch7_int7_stat.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "int7_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			int7_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			int7_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			int7_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_ch0_int7_stat = uvm_reg_field::type_id::create("core0_ch0_int7_stat");
		core0_ch0_int7_stat.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		core0_ch1_int7_stat = uvm_reg_field::type_id::create("core0_ch1_int7_stat");
		core0_ch1_int7_stat.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		core0_ch2_int7_stat = uvm_reg_field::type_id::create("core0_ch2_int7_stat");
		core0_ch2_int7_stat.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		core0_ch3_int7_stat = uvm_reg_field::type_id::create("core0_ch3_int7_stat");
		core0_ch3_int7_stat.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_ch4_int7_stat = uvm_reg_field::type_id::create("core0_ch4_int7_stat");
		core0_ch4_int7_stat.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		core0_ch5_int7_stat = uvm_reg_field::type_id::create("core0_ch5_int7_stat");
		core0_ch5_int7_stat.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		core0_ch6_int7_stat = uvm_reg_field::type_id::create("core0_ch6_int7_stat");
		core0_ch6_int7_stat.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		core0_ch7_int7_stat = uvm_reg_field::type_id::create("core0_ch7_int7_stat");
		core0_ch7_int7_stat.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_ch0_int7_stat = uvm_reg_field::type_id::create("core1_ch0_int7_stat");
		core1_ch0_int7_stat.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		core1_ch1_int7_stat = uvm_reg_field::type_id::create("core1_ch1_int7_stat");
		core1_ch1_int7_stat.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		core1_ch2_int7_stat = uvm_reg_field::type_id::create("core1_ch2_int7_stat");
		core1_ch2_int7_stat.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		core1_ch3_int7_stat = uvm_reg_field::type_id::create("core1_ch3_int7_stat");
		core1_ch3_int7_stat.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_ch4_int7_stat = uvm_reg_field::type_id::create("core1_ch4_int7_stat");
		core1_ch4_int7_stat.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
		core1_ch5_int7_stat = uvm_reg_field::type_id::create("core1_ch5_int7_stat");
		core1_ch5_int7_stat.configure(this, 1, 13, "RW", 1, 0, 1, 1, 0);
		core1_ch6_int7_stat = uvm_reg_field::type_id::create("core1_ch6_int7_stat");
		core1_ch6_int7_stat.configure(this, 1, 14, "RW", 1, 0, 1, 1, 0);
		core1_ch7_int7_stat = uvm_reg_field::type_id::create("core1_ch7_int7_stat");
		core1_ch7_int7_stat.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core0_joint_mode extends uvm_reg;
	`uvm_object_utils(core0_joint_mode)
	uvm_reg_field core0_joint_mode;
	uvm_reg_field rsvd;
	covergroup core0_joint_mode_cg;
		CORE0_JOINT_MODE_CP : coverpoint core0_joint_mode.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core0_joint_mode");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_joint_mode_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_joint_mode_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core0_joint_mode_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_joint_mode = uvm_reg_field::type_id::create("core0_joint_mode");
		core0_joint_mode.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core1_joint_mode extends uvm_reg;
	`uvm_object_utils(core1_joint_mode)
	uvm_reg_field core1_joint_mode;
	uvm_reg_field rsvd;
	covergroup core1_joint_mode_cg;
		CORE1_JOINT_MODE_CP : coverpoint core1_joint_mode.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core1_joint_mode");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_joint_mode_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_joint_mode_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core1_joint_mode_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core1_joint_mode = uvm_reg_field::type_id::create("core1_joint_mode");
		core1_joint_mode.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core0_priority extends uvm_reg;
	`uvm_object_utils(core0_priority)
	uvm_reg_field core0_rd_prio_top_num;
	uvm_reg_field core0_rd_prio_top;
	uvm_reg_field core0_rd_prio_high_num;
	uvm_reg_field core0_rd_prio_high;
	uvm_reg_field core0_wr_prio_top_num;
	uvm_reg_field core0_wr_prio_top;
	uvm_reg_field core0_wr_prio_high_num;
	uvm_reg_field core0_wr_prio_high;
	uvm_reg_field rsvd;
	covergroup core0_priority_cg;
		CORE0_RD_PRIO_TOP_NUM_CP : coverpoint core0_rd_prio_top_num.value {
			option.auto_bin_max = 1;
		}
		CORE0_RD_PRIO_TOP_CP : coverpoint core0_rd_prio_top.value {
			option.auto_bin_max = 1;
		}
		CORE0_RD_PRIO_HIGH_NUM_CP : coverpoint core0_rd_prio_high_num.value {
			option.auto_bin_max = 1;
		}
		CORE0_RD_PRIO_HIGH_CP : coverpoint core0_rd_prio_high.value {
			option.auto_bin_max = 1;
		}
		CORE0_WR_PRIO_TOP_NUM_CP : coverpoint core0_wr_prio_top_num.value {
			option.auto_bin_max = 1;
		}
		CORE0_WR_PRIO_TOP_CP : coverpoint core0_wr_prio_top.value {
			option.auto_bin_max = 1;
		}
		CORE0_WR_PRIO_HIGH_NUM_CP : coverpoint core0_wr_prio_high_num.value {
			option.auto_bin_max = 1;
		}
		CORE0_WR_PRIO_HIGH_CP : coverpoint core0_wr_prio_high.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core0_priority");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_priority_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_priority_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core0_priority_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_rd_prio_top_num = uvm_reg_field::type_id::create("core0_rd_prio_top_num");
		core0_rd_prio_top_num.configure(this, 3, 0, "RW", 1, 0, 1, 1, 0);
		core0_rd_prio_top = uvm_reg_field::type_id::create("core0_rd_prio_top");
		core0_rd_prio_top.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core0_rd_prio_high_num = uvm_reg_field::type_id::create("core0_rd_prio_high_num");
		core0_rd_prio_high_num.configure(this, 3, 4, "RW", 1, 0, 1, 1, 0);
		core0_rd_prio_high = uvm_reg_field::type_id::create("core0_rd_prio_high");
		core0_rd_prio_high.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core0_wr_prio_top_num = uvm_reg_field::type_id::create("core0_wr_prio_top_num");
		core0_wr_prio_top_num.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		core0_wr_prio_top = uvm_reg_field::type_id::create("core0_wr_prio_top");
		core0_wr_prio_top.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core0_wr_prio_high_num = uvm_reg_field::type_id::create("core0_wr_prio_high_num");
		core0_wr_prio_high_num.configure(this, 3, 12, "RW", 1, 0, 1, 1, 0);
		core0_wr_prio_high = uvm_reg_field::type_id::create("core0_wr_prio_high");
		core0_wr_prio_high.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core1_priority extends uvm_reg;
	`uvm_object_utils(core1_priority)
	uvm_reg_field core1_rd_prio_top_num;
	uvm_reg_field core1_rd_prio_top;
	uvm_reg_field core1_rd_prio_high_num;
	uvm_reg_field core1_rd_prio_high;
	uvm_reg_field core1_wr_prio_top_num;
	uvm_reg_field core1_wr_prio_top;
	uvm_reg_field core1_wr_prio_high_num;
	uvm_reg_field core1_wr_prio_high;
	uvm_reg_field rsvd;
	covergroup core1_priority_cg;
		CORE1_RD_PRIO_TOP_NUM_CP : coverpoint core1_rd_prio_top_num.value {
			option.auto_bin_max = 1;
		}
		CORE1_RD_PRIO_TOP_CP : coverpoint core1_rd_prio_top.value {
			option.auto_bin_max = 1;
		}
		CORE1_RD_PRIO_HIGH_NUM_CP : coverpoint core1_rd_prio_high_num.value {
			option.auto_bin_max = 1;
		}
		CORE1_RD_PRIO_HIGH_CP : coverpoint core1_rd_prio_high.value {
			option.auto_bin_max = 1;
		}
		CORE1_WR_PRIO_TOP_NUM_CP : coverpoint core1_wr_prio_top_num.value {
			option.auto_bin_max = 1;
		}
		CORE1_WR_PRIO_TOP_CP : coverpoint core1_wr_prio_top.value {
			option.auto_bin_max = 1;
		}
		CORE1_WR_PRIO_HIGH_NUM_CP : coverpoint core1_wr_prio_high_num.value {
			option.auto_bin_max = 1;
		}
		CORE1_WR_PRIO_HIGH_CP : coverpoint core1_wr_prio_high.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core1_priority");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_priority_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_priority_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core1_priority_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core1_rd_prio_top_num = uvm_reg_field::type_id::create("core1_rd_prio_top_num");
		core1_rd_prio_top_num.configure(this, 3, 0, "RW", 1, 0, 1, 1, 0);
		core1_rd_prio_top = uvm_reg_field::type_id::create("core1_rd_prio_top");
		core1_rd_prio_top.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		core1_rd_prio_high_num = uvm_reg_field::type_id::create("core1_rd_prio_high_num");
		core1_rd_prio_high_num.configure(this, 3, 4, "RW", 1, 0, 1, 1, 0);
		core1_rd_prio_high = uvm_reg_field::type_id::create("core1_rd_prio_high");
		core1_rd_prio_high.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		core1_wr_prio_top_num = uvm_reg_field::type_id::create("core1_wr_prio_top_num");
		core1_wr_prio_top_num.configure(this, 3, 8, "RW", 1, 0, 1, 1, 0);
		core1_wr_prio_top = uvm_reg_field::type_id::create("core1_wr_prio_top");
		core1_wr_prio_top.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		core1_wr_prio_high_num = uvm_reg_field::type_id::create("core1_wr_prio_high_num");
		core1_wr_prio_high_num.configure(this, 3, 12, "RW", 1, 0, 1, 1, 0);
		core1_wr_prio_high = uvm_reg_field::type_id::create("core1_wr_prio_high");
		core1_wr_prio_high.configure(this, 1, 15, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core0_clkdiv_r extends uvm_reg;
	`uvm_object_utils(core0_clkdiv_r)
	uvm_reg_field core0_clkdiv_r_ratio;
	uvm_reg_field rsvd;
	covergroup core0_clkdiv_r_cg;
		CORE0_CLKDIV_RATIO_CP : coverpoint core0_clkdiv_r_ratio.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core0_clkdiv_r");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_clkdiv_r_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_clkdiv_r_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core0_clkdiv_r_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_clkdiv_r_ratio = uvm_reg_field::type_id::create("core0_clkdiv_r_ratio");
		core0_clkdiv_r_ratio.configure(this, 4, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core1_clkdiv extends uvm_reg;
	`uvm_object_utils(core1_clkdiv)
	uvm_reg_field core1_clkdiv_ratio;
	uvm_reg_field rsvd;
	covergroup core1_clkdiv_cg;
		CORE1_CLKDIV_RATIO_CP : coverpoint core1_clkdiv_ratio.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core1_clkdiv");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_clkdiv_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_clkdiv_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core1_clkdiv_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core1_clkdiv_ratio = uvm_reg_field::type_id::create("core1_clkdiv_ratio");
		core1_clkdiv_ratio.configure(this, 4, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core0_ch_start_r extends uvm_reg;
	`uvm_object_utils(core0_ch_start_r)
	uvm_reg_field core0_channel_start;
	uvm_reg_field rsvd;
	covergroup core0_ch_start_r_cg;
		CORE0_CHANNEL_START_CP : coverpoint core0_channel_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core0_ch_start_r");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_ch_start_r_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core0_ch_start_r_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core0_ch_start_r_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core0_channel_start = uvm_reg_field::type_id::create("core0_channel_start");
		core0_channel_start.configure(this, 7, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class core1_ch_start extends uvm_reg;
	`uvm_object_utils(core1_ch_start)
	uvm_reg_field core1_channel_start;
	uvm_reg_field rsvd;
	covergroup core1_ch_start_cg;
		CORE1_CHANNEL_START_CP : coverpoint core1_channel_start.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "core1_ch_start");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_ch_start_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			core1_ch_start_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			core1_ch_start_cg.sample();
	endfunction: sample_values

	virtual function void build();
		core1_channel_start = uvm_reg_field::type_id::create("core1_channel_start");
		core1_channel_start.configure(this, 8, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class periph_rx_ctrl extends uvm_reg;
	`uvm_object_utils(periph_rx_ctrl)
	uvm_reg_field periph_rx_req;
	covergroup periph_rx_ctrl_cg;
		PERIPH_RX_REQ_CP : coverpoint periph_rx_req.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "periph_rx_ctrl");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			periph_rx_ctrl_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			periph_rx_ctrl_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			periph_rx_ctrl_cg.sample();
	endfunction: sample_values

	virtual function void build();
		periph_rx_req = uvm_reg_field::type_id::create("periph_rx_req");
		periph_rx_req.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class periph_tx_ctrl extends uvm_reg;
	`uvm_object_utils(periph_tx_ctrl)
	uvm_reg_field periph_tx_req;
	covergroup periph_tx_ctrl_cg;
		PERIPH_TX_REQ_CP : coverpoint periph_tx_req.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "periph_tx_ctrl");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			periph_tx_ctrl_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			periph_tx_ctrl_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			periph_tx_ctrl_cg.sample();
	endfunction: sample_values

	virtual function void build();
		periph_tx_req = uvm_reg_field::type_id::create("periph_tx_req");
		periph_tx_req.configure(this, 32, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class idle extends uvm_reg;
	`uvm_object_utils(idle)
	uvm_reg_field idle;
	uvm_reg_field rsvd;
	covergroup idle_cg;
		IDLE_CP : coverpoint idle.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "idle");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			idle_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			idle_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			idle_cg.sample();
	endfunction: sample_values

	virtual function void build();
		idle = uvm_reg_field::type_id::create("idle");
		idle.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class user_def_status extends uvm_reg;
	`uvm_object_utils(user_def_status)
	uvm_reg_field user_def_int_num;
	uvm_reg_field rsvd1;
	uvm_reg_field user_def_dual_core;
	uvm_reg_field user_def_ic;
	uvm_reg_field user_def_ic_dual_port;
	uvm_reg_field user_def_clkgate;
	uvm_reg_field rsvd2;
	covergroup user_def_status_cg;
		USER_DEF_INT_NUM_CP : coverpoint user_def_int_num.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_DUAL_CORE_CP : coverpoint user_def_dual_core.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_IC_CP : coverpoint user_def_ic.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_IC_DUAL_PORT_CP : coverpoint user_def_ic_dual_port.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CLKGATE_CP : coverpoint user_def_clkgate.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "user_def_status");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			user_def_status_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			user_def_status_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			user_def_status_cg.sample();
	endfunction: sample_values

	virtual function void build();
		user_def_int_num = uvm_reg_field::type_id::create("user_def_int_num");
		user_def_int_num.configure(this, 4, 0, "RO", 1, 0, 1, 1, 0);
		user_def_dual_core = uvm_reg_field::type_id::create("user_def_dual_core");
		user_def_dual_core.configure(this, 1, 5, "RO", 1, 0, 1, 1, 0);
		user_def_ic = uvm_reg_field::type_id::create("user_def_ic");
		user_def_ic.configure(this, 1, 6, "RO", 1, 0, 1, 1, 0);
		user_def_ic_dual_port = uvm_reg_field::type_id::create("user_def_ic_dual_port");
		user_def_ic_dual_port.configure(this, 1, 7, "RO", 1, 0, 1, 1, 0);
		user_def_clkgate = uvm_reg_field::type_id::create("user_def_clkgate");
		user_def_clkgate.configure(this, 1, 8, "RO", 1, 0, 1, 1, 0);
	endfunction

endclass
class user_core0_def_status0 extends uvm_reg;
	`uvm_object_utils(user_core0_def_status0)
	uvm_reg_field user_def_core0_ch_num;
	uvm_reg_field user_def_core0_fifo_size;
	uvm_reg_field user_def_core0_wcmd_depth;
	uvm_reg_field user_def_core0_rcmd_depth;
	uvm_reg_field user_def_core0_addr_bits;
	uvm_reg_field user_def_core0_axi_32;
	uvm_reg_field rsvd1;
	uvm_reg_field user_def_core0_buff_bits;
	uvm_reg_field rsvd2;
	covergroup user_core0_def_status0_cg;
		USER_DEF_CORE0_CH_NUM_CP : coverpoint user_def_core0_ch_num.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_FIFO_SIZE_CP : coverpoint user_def_core0_fifo_size.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_WCMD_DEPTH_CP : coverpoint user_def_core0_wcmd_depth.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_RCMD_DEPTH_CP : coverpoint user_def_core0_rcmd_depth.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_ADDR_BITS_CP : coverpoint user_def_core0_addr_bits.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_AXI_32_CP : coverpoint user_def_core0_axi_32.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_BUFF_BITS_CP : coverpoint user_def_core0_buff_bits.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "user_core0_def_status0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core0_def_status0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core0_def_status0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			user_core0_def_status0_cg.sample();
	endfunction: sample_values
    

	virtual function void build();
		user_def_core0_ch_num = uvm_reg_field::type_id::create("user_def_core0_ch_num");
		user_def_core0_ch_num.configure(this, 4, 0, "RW", 1, 0, 1, 1, 0);
		user_def_core0_fifo_size = uvm_reg_field::type_id::create("user_def_core0_fifo_size");
		user_def_core0_fifo_size.configure(this, 4, 4, "RW", 1, 0, 1, 1, 0);
		user_def_core0_wcmd_depth = uvm_reg_field::type_id::create("user_def_core0_wcmd_depth");
		user_def_core0_wcmd_depth.configure(this, 4, 8, "RW", 1, 0, 1, 1, 0);
		user_def_core0_rcmd_depth = uvm_reg_field::type_id::create("user_def_core0_rcmd_depth");
		user_def_core0_rcmd_depth.configure(this, 4, 12, "RW", 1, 0, 1, 1, 0);
		user_def_core0_addr_bits = uvm_reg_field::type_id::create("user_def_core0_addr_bits");
		user_def_core0_addr_bits.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
		user_def_core0_axi_32 = uvm_reg_field::type_id::create("user_def_core0_axi_32");
		user_def_core0_axi_32.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		user_def_core0_buff_bits = uvm_reg_field::type_id::create("user_def_core0_buff_bits");
		user_def_core0_buff_bits.configure(this, 5, 24, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class user_core0_def_status1 extends uvm_reg;
	`uvm_object_utils(user_core0_def_status1)
	uvm_reg_field user_def_core0_wdt;
	uvm_reg_field user_def_core0_timeout;
	uvm_reg_field user_def_core0_tokens;
	uvm_reg_field user_def_core0_prio;
	uvm_reg_field user_def_core0_outs;
	uvm_reg_field user_def_core0_wait;
	uvm_reg_field user_def_core0_block;
	uvm_reg_field user_def_core0_joint;
	uvm_reg_field user_def_core0_independent;
	uvm_reg_field user_def_core0_periph;
	uvm_reg_field user_def_core0_lists;
	uvm_reg_field user_def_core0_end;
	uvm_reg_field user_def_core0_clkdiv_r;
	uvm_reg_field rsvd;
	covergroup user_core0_def_status1_cg;
		USER_DEF_CORE0_WDT_CP : coverpoint user_def_core0_wdt.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_TIMEOUT_CP : coverpoint user_def_core0_timeout.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_TOKENS_CP : coverpoint user_def_core0_tokens.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_PRIO_CP : coverpoint user_def_core0_prio.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_OUTS_CP : coverpoint user_def_core0_outs.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_WAIT_CP : coverpoint user_def_core0_wait.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_BLOCK_CP : coverpoint user_def_core0_block.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_JOINT_CP : coverpoint user_def_core0_joint.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_INDEPENDENT_CP : coverpoint user_def_core0_independent.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_PERIPH_CP : coverpoint user_def_core0_periph.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_LISTS_CP : coverpoint user_def_core0_lists.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_END_CP : coverpoint user_def_core0_end.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE0_CLKDIV_CP : coverpoint user_def_core0_clkdiv_r.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "user_core0_def_status1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core0_def_status1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core0_def_status1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			user_core0_def_status1_cg.sample();
	endfunction: sample_values
    

	virtual function void build();
		user_def_core0_wdt = uvm_reg_field::type_id::create("user_def_core0_wdt");
		user_def_core0_wdt.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		user_def_core0_timeout = uvm_reg_field::type_id::create("user_def_core0_timeout");
		user_def_core0_timeout.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		user_def_core0_tokens = uvm_reg_field::type_id::create("user_def_core0_tokens");
		user_def_core0_tokens.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		user_def_core0_prio = uvm_reg_field::type_id::create("user_def_core0_prio");
		user_def_core0_prio.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		user_def_core0_outs = uvm_reg_field::type_id::create("user_def_core0_outs");
		user_def_core0_outs.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		user_def_core0_wait = uvm_reg_field::type_id::create("user_def_core0_wait");
		user_def_core0_wait.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		user_def_core0_block = uvm_reg_field::type_id::create("user_def_core0_block");
		user_def_core0_block.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		user_def_core0_joint = uvm_reg_field::type_id::create("user_def_core0_joint");
		user_def_core0_joint.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		user_def_core0_independent = uvm_reg_field::type_id::create("user_def_core0_independent");
		user_def_core0_independent.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		user_def_core0_periph = uvm_reg_field::type_id::create("user_def_core0_periph");
		user_def_core0_periph.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		user_def_core0_lists = uvm_reg_field::type_id::create("user_def_core0_lists");
		user_def_core0_lists.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		user_def_core0_end = uvm_reg_field::type_id::create("user_def_core0_end");
		user_def_core0_end.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		user_def_core0_clkdiv_r = uvm_reg_field::type_id::create("user_def_core0_clkdiv_r");
		user_def_core0_clkdiv_r.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class user_core1_def_status0 extends uvm_reg;
	`uvm_object_utils(user_core1_def_status0)
	uvm_reg_field user_def_core1_ch_num;
	uvm_reg_field user_def_core1_fifo_size;
	uvm_reg_field user_def_core1_wcmd_depth;
	uvm_reg_field user_def_core1_rcmd_depth;
	uvm_reg_field user_def_core1_addr_bits;
	uvm_reg_field user_def_core1_axi_32;
	uvm_reg_field rsvd1;
	uvm_reg_field user_def_core1_buff_bits;
	uvm_reg_field rsvd2;
	covergroup user_core1_def_status0_cg;
		USER_DEF_CORE1_CH_NUM_CP : coverpoint user_def_core1_ch_num.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_FIFO_SIZE_CP : coverpoint user_def_core1_fifo_size.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_WCMD_DEPTH_CP : coverpoint user_def_core1_wcmd_depth.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_RCMD_DEPTH_CP : coverpoint user_def_core1_rcmd_depth.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_ADDR_BITS_CP : coverpoint user_def_core1_addr_bits.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_AXI_32_CP : coverpoint user_def_core1_axi_32.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_BUFF_BITS_CP : coverpoint user_def_core1_buff_bits.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "user_core1_def_status0");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core1_def_status0_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core1_def_status0_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			user_core1_def_status0_cg.sample();
	endfunction: sample_values
    

	virtual function void build();
		user_def_core1_ch_num = uvm_reg_field::type_id::create("user_def_core1_ch_num");
		user_def_core1_ch_num.configure(this, 4, 0, "RW", 1, 0, 1, 1, 0);
		user_def_core1_fifo_size = uvm_reg_field::type_id::create("user_def_core1_fifo_size");
		user_def_core1_fifo_size.configure(this, 4, 4, "RW", 1, 0, 1, 1, 0);
		user_def_core1_wcmd_depth = uvm_reg_field::type_id::create("user_def_core1_wcmd_depth");
		user_def_core1_wcmd_depth.configure(this, 4, 8, "RW", 1, 0, 1, 1, 0);
		user_def_core1_rcmd_depth = uvm_reg_field::type_id::create("user_def_core1_rcmd_depth");
		user_def_core1_rcmd_depth.configure(this, 4, 12, "RW", 1, 0, 1, 1, 0);
		user_def_core1_addr_bits = uvm_reg_field::type_id::create("user_def_core1_addr_bits");
		user_def_core1_addr_bits.configure(this, 6, 16, "RW", 1, 0, 1, 1, 0);
		user_def_core1_axi_32 = uvm_reg_field::type_id::create("user_def_core1_axi_32");
		user_def_core1_axi_32.configure(this, 1, 22, "RW", 1, 0, 1, 1, 0);
		user_def_core1_buff_bits = uvm_reg_field::type_id::create("user_def_core1_buff_bits");
		user_def_core1_buff_bits.configure(this, 5, 24, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class user_core1_def_status1 extends uvm_reg;
	`uvm_object_utils(user_core1_def_status1)
	uvm_reg_field user_def_core1_wdt;
	uvm_reg_field user_def_core1_timeout;
	uvm_reg_field user_def_core1_tokens;
	uvm_reg_field user_def_core1_prio;
	uvm_reg_field user_def_core1_outs;
	uvm_reg_field user_def_core1_wait;
	uvm_reg_field user_def_core1_block;
	uvm_reg_field user_def_core1_joint;
	uvm_reg_field user_def_core1_independent;
	uvm_reg_field user_def_core1_periph;
	uvm_reg_field user_def_core1_lists;
	uvm_reg_field user_def_core1_end;
	uvm_reg_field user_def_core1_clkdiv;
	uvm_reg_field rsvd;
	covergroup user_core1_def_status1_cg;
		USER_DEF_CORE1_WDT_CP : coverpoint user_def_core1_wdt.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_TIMEOUT_CP : coverpoint user_def_core1_timeout.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_TOKENS_CP : coverpoint user_def_core1_tokens.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_PRIO_CP : coverpoint user_def_core1_prio.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_OUTS_CP : coverpoint user_def_core1_outs.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_WAIT_CP : coverpoint user_def_core1_wait.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_BLOCK_CP : coverpoint user_def_core1_block.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_JOINT_CP : coverpoint user_def_core1_joint.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_INDEPENDENT_CP : coverpoint user_def_core1_independent.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_PERIPH_CP : coverpoint user_def_core1_periph.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_LISTS_CP : coverpoint user_def_core1_lists.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_END_CP : coverpoint user_def_core1_end.value {
			option.auto_bin_max = 1;
		}
		USER_DEF_CORE1_CLKDIV_CP : coverpoint user_def_core1_clkdiv.value {
			option.auto_bin_max = 1;
		}
	endgroup

  function new(string name = "user_core1_def_status1");
	 super.new(name, 32, build_coverage(UVM_CVR_FIELD_VALS));
	 	if(has_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core1_def_status1_cg = new;
			set_coverage(UVM_CVR_FIELD_VALS);
		end
	endfunction

	function void sample(uvm_reg_data_t data,
						 uvm_reg_data_t byte_en,
						 bit 			is_read,
						 uvm_reg_map 	map);
		if(get_coverage(UVM_CVR_FIELD_VALS)) begin
			user_core1_def_status1_cg.sample();
		end
	endfunction: sample

	function void sample_values();
		super.sample_values();
		if(get_coverage(UVM_CVR_FIELD_VALS))
			user_core1_def_status1_cg.sample();
	endfunction: sample_values
    

	virtual function void build();
		user_def_core1_wdt = uvm_reg_field::type_id::create("user_def_core1_wdt");
		user_def_core1_wdt.configure(this, 1, 0, "RW", 1, 0, 1, 1, 0);
		user_def_core1_timeout = uvm_reg_field::type_id::create("user_def_core1_timeout");
		user_def_core1_timeout.configure(this, 1, 1, "RW", 1, 0, 1, 1, 0);
		user_def_core1_tokens = uvm_reg_field::type_id::create("user_def_core1_tokens");
		user_def_core1_tokens.configure(this, 1, 2, "RW", 1, 0, 1, 1, 0);
		user_def_core1_prio = uvm_reg_field::type_id::create("user_def_core1_prio");
		user_def_core1_prio.configure(this, 1, 3, "RW", 1, 0, 1, 1, 0);
		user_def_core1_outs = uvm_reg_field::type_id::create("user_def_core1_outs");
		user_def_core1_outs.configure(this, 1, 4, "RW", 1, 0, 1, 1, 0);
		user_def_core1_wait = uvm_reg_field::type_id::create("user_def_core1_wait");
		user_def_core1_wait.configure(this, 1, 5, "RW", 1, 0, 1, 1, 0);
		user_def_core1_block = uvm_reg_field::type_id::create("user_def_core1_block");
		user_def_core1_block.configure(this, 1, 6, "RW", 1, 0, 1, 1, 0);
		user_def_core1_joint = uvm_reg_field::type_id::create("user_def_core1_joint");
		user_def_core1_joint.configure(this, 1, 7, "RW", 1, 0, 1, 1, 0);
		user_def_core1_independent = uvm_reg_field::type_id::create("user_def_core1_independent");
		user_def_core1_independent.configure(this, 1, 8, "RW", 1, 0, 1, 1, 0);
		user_def_core1_periph = uvm_reg_field::type_id::create("user_def_core1_periph");
		user_def_core1_periph.configure(this, 1, 9, "RW", 1, 0, 1, 1, 0);
		user_def_core1_lists = uvm_reg_field::type_id::create("user_def_core1_lists");
		user_def_core1_lists.configure(this, 1, 10, "RW", 1, 0, 1, 1, 0);
		user_def_core1_end = uvm_reg_field::type_id::create("user_def_core1_end");
		user_def_core1_end.configure(this, 1, 11, "RW", 1, 0, 1, 1, 0);
		user_def_core1_clkdiv = uvm_reg_field::type_id::create("user_def_core1_clkdiv");
		user_def_core1_clkdiv.configure(this, 1, 12, "RW", 1, 0, 1, 1, 0);
	endfunction

endclass
class dma_ctrl_reg_block extends uvm_reg_block;
      `uvm_object_utils(dma_ctrl_reg_block)
//Instantiate all the registers
rand ch0_cmd_reg0 ch0_cmd_reg0_i = new();
rand ch0_cmd_reg1 ch0_cmd_reg1_i = new();
rand ch0_cmd_reg2 ch0_cmd_reg2_i = new();
rand ch0_cmd_reg3 ch0_cmd_reg3_i = new();
rand ch0_static_reg0 ch0_static_reg0_i = new();
rand ch0_static_reg1 ch0_static_reg1_i = new();
rand ch0_static_reg2 ch0_static_reg2_i = new();
rand ch0_static_reg3 ch0_static_reg3_i = new();
rand ch0_static_reg4 ch0_static_reg4_i = new();
rand ch0_restrict_reg ch0_restrict_reg_i = new();
rand ch0_read_offset_reg ch0_read_offset_reg_i = new();
rand ch0_write_offset_reg ch0_write_offset_reg_i = new();
rand ch0_fifo_fullness_reg ch0_fifo_fullness_reg_i = new();
rand ch0_cmd_outs_reg ch0_cmd_outs_reg_i = new();
rand ch0_ch_enable_reg ch0_ch_enable_reg_i = new();
rand ch0_ch_start_reg ch0_ch_start_reg_i = new();
rand ch0_ch_active_reg ch0_ch_active_reg_i = new();
rand ch0_count_reg ch0_count_reg_i = new();
rand ch0_int_rawstat_reg ch0_int_rawstat_reg_i = new();
rand ch0_int_clear_reg ch0_int_clear_reg_i = new();
rand ch0_int_enable_reg ch0_int_enable_reg_i = new();
rand ch0_int_status_reg ch0_int_status_reg_i = new();
rand ch1_cmd_reg0 ch1_cmd_reg0_i = new();
rand ch1_cmd_reg1 ch1_cmd_reg1_i = new();
rand ch1_cmd_reg2 ch1_cmd_reg2_i = new();
rand ch1_cmd_reg3 ch1_cmd_reg3_i = new();
rand ch1_static_reg0 ch1_static_reg0_i = new();
rand ch1_static_reg1 ch1_static_reg1_i = new();
rand ch1_static_reg2 ch1_static_reg2_i = new();
rand ch1_static_reg3 ch1_static_reg3_i = new();
rand ch1_restrict_reg ch1_restrict_reg_i = new();
rand ch1_read_offset_reg ch1_read_offset_reg_i = new();
rand ch1_write_offset_reg ch1_write_offset_reg_i = new();
rand ch1_fifo_fullness_reg ch1_fifo_fullness_reg_i = new();
rand ch1_cmd_outs_reg ch1_cmd_outs_reg_i = new();
rand ch1_ch_enable_reg ch1_ch_enable_reg_i = new();
rand ch1_ch_start_reg ch1_ch_start_reg_i = new();
rand ch1_ch_active_reg ch1_ch_active_reg_i = new();
rand ch1_count_reg ch1_count_reg_i = new();
rand ch1_int_rawstat_reg ch1_int_rawstat_reg_i = new();
rand ch1_int_clear_reg ch1_int_clear_reg_i = new();
rand ch1_int_enable_reg ch1_int_enable_reg_i = new();
rand ch1_int_status_reg ch1_int_status_reg_i = new();
rand ch2_cmd_reg0 ch2_cmd_reg0_i = new();
rand ch2_cmd_reg1 ch2_cmd_reg1_i = new();
rand ch2_cmd_reg2 ch2_cmd_reg2_i = new();
rand ch2_cmd_reg3 ch2_cmd_reg3_i = new();
rand ch2_static_reg0 ch2_static_reg0_i = new();
rand ch2_static_reg1 ch2_static_reg1_i = new();
rand ch2_static_reg2 ch2_static_reg2_i = new();
rand ch2_static_reg3 ch2_static_reg3_i = new();
rand ch2_restrict_reg ch2_restrict_reg_i = new();
rand ch2_read_offset_reg ch2_read_offset_reg_i = new();
rand ch2_write_offset_reg ch2_write_offset_reg_i = new();
rand ch2_fifo_fullness_reg ch2_fifo_fullness_reg_i = new();
rand ch2_cmd_outs_reg ch2_cmd_outs_reg_i = new();
rand ch2_ch_enable_reg ch2_ch_enable_reg_i = new();
rand ch2_ch_start_reg ch2_ch_start_reg_i = new();
rand ch2_ch_active_reg ch2_ch_active_reg_i = new();
rand ch2_count_reg ch2_count_reg_i = new();
rand ch2_int_rawstat_reg ch2_int_rawstat_reg_i = new();
rand ch2_int_clear_reg ch2_int_clear_reg_i = new();
rand ch2_int_enable_reg ch2_int_enable_reg_i = new();
rand ch2_int_status_reg ch2_int_status_reg_i = new();
rand ch3_cmd_reg0 ch3_cmd_reg0_i = new();
rand ch3_cmd_reg1 ch3_cmd_reg1_i = new();
rand ch3_cmd_reg2 ch3_cmd_reg2_i = new();
rand ch3_cmd_reg3 ch3_cmd_reg3_i = new();
rand ch3_static_reg0 ch3_static_reg0_i = new();
rand ch3_static_reg1 ch3_static_reg1_i = new();
rand ch3_static_reg2 ch3_static_reg2_i = new();
rand ch3_static_reg3 ch3_static_reg3_i = new();
rand ch3_restrict_reg ch3_restrict_reg_i = new();
rand ch3_read_offset_reg ch3_read_offset_reg_i = new();
rand ch3_write_offset_reg ch3_write_offset_reg_i = new();
rand ch3_fifo_fullness_reg ch3_fifo_fullness_reg_i = new();
rand ch3_cmd_outs_reg ch3_cmd_outs_reg_i = new();
rand ch3_ch_enable_reg ch3_ch_enable_reg_i = new();
rand ch3_ch_start_reg ch3_ch_start_reg_i = new();
rand ch3_ch_active_reg ch3_ch_active_reg_i = new();
rand ch3_count_reg ch3_count_reg_i = new();
rand ch3_int_rawstat_reg ch3_int_rawstat_reg_i = new();
rand ch3_int_clear_reg ch3_int_clear_reg_i = new();
rand ch3_int_enable_reg ch3_int_enable_reg_i = new();
rand ch3_int_status_reg ch3_int_status_reg_i = new();
rand ch4_cmd_reg0 ch4_cmd_reg0_i = new();
rand ch4_cmd_reg1 ch4_cmd_reg1_i = new();
rand ch4_cmd_reg2 ch4_cmd_reg2_i = new();
rand ch4_cmd_reg3 ch4_cmd_reg3_i = new();
rand ch4_static_reg0 ch4_static_reg0_i = new();
rand ch4_static_reg1 ch4_static_reg1_i = new();
rand ch4_static_reg2 ch4_static_reg2_i = new();
rand ch4_static_reg3 ch4_static_reg3_i = new();
rand ch4_restrict_reg ch4_restrict_reg_i = new();
rand ch4_read_offset_reg ch4_read_offset_reg_i = new();
rand ch4_write_offset_reg ch4_write_offset_reg_i = new();
rand ch4_fifo_fullness_reg ch4_fifo_fullness_reg_i = new();
rand ch4_cmd_outs_reg ch4_cmd_outs_reg_i = new();
rand ch4_ch_enable_reg ch4_ch_enable_reg_i = new();
rand ch4_ch_start_reg ch4_ch_start_reg_i = new();
rand ch4_ch_active_reg ch4_ch_active_reg_i = new();
rand ch4_count_reg ch4_count_reg_i = new();
rand ch4_int_rawstat_reg ch4_int_rawstat_reg_i = new();
rand ch4_int_clear_reg ch4_int_clear_reg_i = new();
rand ch4_int_enable_reg ch4_int_enable_reg_i = new();
rand ch4_int_status_reg ch4_int_status_reg_i = new();
rand ch5_cmd_reg0 ch5_cmd_reg0_i = new();
rand ch5_cmd_reg1 ch5_cmd_reg1_i = new();
rand ch5_cmd_reg2 ch5_cmd_reg2_i = new();
rand ch5_cmd_reg3 ch5_cmd_reg3_i = new();
rand ch5_static_reg0 ch5_static_reg0_i = new();
rand ch5_static_reg1 ch5_static_reg1_i = new();
rand ch5_static_reg2 ch5_static_reg2_i = new();
rand ch5_static_reg3 ch5_static_reg3_i = new();
rand ch5_restrict_reg ch5_restrict_reg_i = new();
rand ch5_read_offset_reg ch5_read_offset_reg_i = new();
rand ch5_write_offset_reg ch5_write_offset_reg_i = new();
rand ch5_fifo_fullness_reg ch5_fifo_fullness_reg_i = new();
rand ch5_cmd_outs_reg ch5_cmd_outs_reg_i = new();
rand ch5_ch_enable_reg ch5_ch_enable_reg_i = new();
rand ch5_ch_start_reg ch5_ch_start_reg_i = new();
rand ch5_ch_active_reg ch5_ch_active_reg_i = new();
rand ch5_count_reg ch5_count_reg_i = new();
rand ch5_int_rawstat_reg ch5_int_rawstat_reg_i = new();
rand ch5_int_clear_reg ch5_int_clear_reg_i = new();
rand ch5_int_enable_reg ch5_int_enable_reg_i = new();
rand ch5_int_status_reg ch5_int_status_reg_i = new();
rand ch6_cmd_reg0 ch6_cmd_reg0_i = new();
rand ch6_cmd_reg1 ch6_cmd_reg1_i = new();
rand ch6_cmd_reg2 ch6_cmd_reg2_i = new();
rand ch6_cmd_reg3 ch6_cmd_reg3_i = new();
rand ch6_static_reg0 ch6_static_reg0_i = new();
rand ch6_static_reg1 ch6_static_reg1_i = new();
rand ch6_static_reg2 ch6_static_reg2_i = new();
rand ch6_static_reg3 ch6_static_reg3_i = new();
rand ch6_restrict_reg ch6_restrict_reg_i = new();
rand ch6_read_offset_reg ch6_read_offset_reg_i = new();
rand ch6_write_offset_reg ch6_write_offset_reg_i = new();
rand ch6_fifo_fullness_reg ch6_fifo_fullness_reg_i = new();
rand ch6_cmd_outs_reg ch6_cmd_outs_reg_i = new();
rand ch6_ch_enable_reg ch6_ch_enable_reg_i = new();
rand ch6_ch_start_reg ch6_ch_start_reg_i = new();
rand ch6_ch_active_reg ch6_ch_active_reg_i = new();
rand ch6_count_reg ch6_count_reg_i = new();
rand ch6_int_rawstat_reg ch6_int_rawstat_reg_i = new();
rand ch6_int_clear_reg ch6_int_clear_reg_i = new();
rand ch6_int_enable_reg ch6_int_enable_reg_i = new();
rand ch6_int_status_reg ch6_int_status_reg_i = new();
rand ch7_cmd_reg0 ch7_cmd_reg0_i = new();
rand ch7_cmd_reg1 ch7_cmd_reg1_i = new();
rand ch7_cmd_reg2 ch7_cmd_reg2_i = new();
rand ch7_cmd_reg3 ch7_cmd_reg3_i = new();
rand ch7_static_reg0 ch7_static_reg0_i = new();
rand ch7_static_reg1 ch7_static_reg1_i = new();
rand ch7_static_reg2 ch7_static_reg2_i = new();
rand ch7_static_reg3 ch7_static_reg3_i = new();
rand ch7_restrict_reg ch7_restrict_reg_i = new();
rand ch7_read_offset_reg ch7_read_offset_reg_i = new();
rand ch7_write_offset_reg ch7_write_offset_reg_i = new();
rand ch7_fifo_fullness_reg ch7_fifo_fullness_reg_i = new();
rand ch7_cmd_outs_reg ch7_cmd_outs_reg_i = new();
rand ch7_ch_enable_reg ch7_ch_enable_reg_i = new();
rand ch7_ch_start_reg ch7_ch_start_reg_i = new();
rand ch7_ch_active_reg ch7_ch_active_reg_i = new();
rand ch7_count_reg ch7_count_reg_i = new();
rand ch7_int_rawstat_reg ch7_int_rawstat_reg_i = new();
rand ch7_int_clear_reg ch7_int_clear_reg_i = new();
rand ch7_int_enable_reg ch7_int_enable_reg_i = new();
rand ch7_int_status_reg ch7_int_status_reg_i = new();
rand int0_status int0_status_i = new();
rand int1_status int1_status_i = new();
rand int2_status int2_status_i = new();
rand int3_status int3_status_i = new();
rand int4_status int4_status_i = new();
rand int5_status int5_status_i = new();
rand int6_status int6_status_i = new();
rand int7_status int7_status_i = new();
rand core0_joint_mode core0_joint_mode_i = new();
rand core1_joint_mode core1_joint_mode_i = new();
rand core0_priority core0_priority_i = new();
rand core1_priority core1_priority_i = new();
rand core0_clkdiv_r core0_clkdiv_r_i = new();
rand core1_clkdiv core1_clkdiv_i = new();
rand core0_ch_start_r core0_ch_start_r_i = new();
rand core1_ch_start core1_ch_start_i = new();
rand periph_rx_ctrl periph_rx_ctrl_i = new();
rand periph_tx_ctrl periph_tx_ctrl_i = new();
rand idle idle_i = new();
rand user_def_status user_def_status_i = new();
rand user_core0_def_status0 user_core0_def_status0_i = new();
rand user_core0_def_status1 user_core0_def_status1_i = new();
rand user_core1_def_status0 user_core1_def_status0_i = new();
rand user_core1_def_status1 user_core1_def_status1_i = new();


      uvm_reg_map apb_map;
      function new(string name = "dma_ctrl_reg_block");
         super.new(name, build_coverage(UVM_CVR_ADDR_MAP));
      endfunction

      virtual function void build();
         string s;
           //set_coverage(UVM_CVR_ADDR_MAP);
         set_coverage(UVM_CVR_FIELD_VALS);
         ch0_cmd_reg0_i = ch0_cmd_reg0::type_id::create("ch0_cmd_reg0_i");
         ch0_cmd_reg0_i.configure(this, null, "");
         ch0_cmd_reg0_i.build();	 
		 //sim:/top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels  dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_start_addr 
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch0.dma_axi64_ch_reg.rd_start_addr[%0d]", i);
           ch0_cmd_reg0_i.add_hdl_path_slice(s, i, 1);
         end

         ch0_cmd_reg1_i = ch0_cmd_reg1::type_id::create("ch0_cmd_reg1_i");
         ch0_cmd_reg1_i.configure(this, null, "");
         ch0_cmd_reg1_i.build();	 

         ch0_cmd_reg2_i = ch0_cmd_reg2::type_id::create("ch0_cmd_reg2_i");
         ch0_cmd_reg2_i.configure(this, null, "");
         ch0_cmd_reg2_i.build();	 
         for(int i = 0; i < 10; i++) begin
           $sformat(s, "dma_axi64_core0_ch0.dma_axi64_ch_reg.buff_size[%0d]", i);
           ch0_cmd_reg2_i.add_hdl_path_slice(s, i, 1);
         end

         ch0_cmd_reg3_i = ch0_cmd_reg3::type_id::create("ch0_cmd_reg3_i");
         ch0_cmd_reg3_i.configure(this, null, "");
         ch0_cmd_reg3_i.build();	 

         for(int i = 0; i < 1; i++) begin
           $sformat(s, "dma_axi64_core0_ch0.dma_axi64_ch_reg.cmd_set_int_reg[%0d]", i);
           ch0_cmd_reg3_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 1; i < 2; i++) begin
           $sformat(s, "dma_axi64_core0_ch0.dma_axi64_ch_reg.cmd_last_reg[%0d]", i);
           ch0_cmd_reg3_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 2; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch0.dma_axi64_ch_reg.cmd_next_addr_reg[%0d]", i);
           ch0_cmd_reg3_i.add_hdl_path_slice(s, i, 1);
         end


         ch0_static_reg0_i = ch0_static_reg0::type_id::create("ch0_static_reg0_i");
         ch0_static_reg0_i.configure(this, null, "");
         ch0_static_reg0_i.build();	 
         ch0_static_reg1_i = ch0_static_reg1::type_id::create("ch0_static_reg1_i");
         ch0_static_reg1_i.configure(this, null, "");
         ch0_static_reg1_i.build();	 
         ch0_static_reg2_i = ch0_static_reg2::type_id::create("ch0_static_reg2_i");
         ch0_static_reg2_i.configure(this, null, "");
         ch0_static_reg2_i.build();	 
         ch0_static_reg3_i = ch0_static_reg3::type_id::create("ch0_static_reg3_i");
         ch0_static_reg3_i.configure(this, null, "");
         ch0_static_reg3_i.build();	 
         ch0_static_reg4_i = ch0_static_reg4::type_id::create("ch0_static_reg4_i");
         ch0_static_reg4_i.configure(this, null, "");
         ch0_static_reg4_i.build();	 
         ch0_restrict_reg_i = ch0_restrict_reg::type_id::create("ch0_restrict_reg_i");
         ch0_restrict_reg_i.configure(this, null, "");
         ch0_restrict_reg_i.build();	 
         ch0_read_offset_reg_i = ch0_read_offset_reg::type_id::create("ch0_read_offset_reg_i");
         ch0_read_offset_reg_i.configure(this, null, "");
         ch0_read_offset_reg_i.build();	 
         ch0_write_offset_reg_i = ch0_write_offset_reg::type_id::create("ch0_write_offset_reg_i");
         ch0_write_offset_reg_i.configure(this, null, "");
         ch0_write_offset_reg_i.build();	 
         ch0_fifo_fullness_reg_i = ch0_fifo_fullness_reg::type_id::create("ch0_fifo_fullness_reg_i");
         ch0_fifo_fullness_reg_i.configure(this, null, "");
         ch0_fifo_fullness_reg_i.build();	 
         ch0_cmd_outs_reg_i = ch0_cmd_outs_reg::type_id::create("ch0_cmd_outs_reg_i");
         ch0_cmd_outs_reg_i.configure(this, null, "");
         ch0_cmd_outs_reg_i.build();	 
         ch0_ch_enable_reg_i = ch0_ch_enable_reg::type_id::create("ch0_ch_enable_reg_i");
         ch0_ch_enable_reg_i.configure(this, null, "");
         ch0_ch_enable_reg_i.build();	 
         ch0_ch_start_reg_i = ch0_ch_start_reg::type_id::create("ch0_ch_start_reg_i");
         ch0_ch_start_reg_i.configure(this, null, "");
         ch0_ch_start_reg_i.build();	 
         ch0_ch_active_reg_i = ch0_ch_active_reg::type_id::create("ch0_ch_active_reg_i");
         ch0_ch_active_reg_i.configure(this, null, "");
         ch0_ch_active_reg_i.build();	 
         ch0_count_reg_i = ch0_count_reg::type_id::create("ch0_count_reg_i");
         ch0_count_reg_i.configure(this, null, "");
         ch0_count_reg_i.build();	 
         ch0_int_rawstat_reg_i = ch0_int_rawstat_reg::type_id::create("ch0_int_rawstat_reg_i");
         ch0_int_rawstat_reg_i.configure(this, null, "");
         ch0_int_rawstat_reg_i.build();	 
         ch0_int_clear_reg_i = ch0_int_clear_reg::type_id::create("ch0_int_clear_reg_i");
         ch0_int_clear_reg_i.configure(this, null, "");
         ch0_int_clear_reg_i.build();	 
         ch0_int_enable_reg_i = ch0_int_enable_reg::type_id::create("ch0_int_enable_reg_i");
         ch0_int_enable_reg_i.configure(this, null, "");
         ch0_int_enable_reg_i.build();	 
         ch0_int_status_reg_i = ch0_int_status_reg::type_id::create("ch0_int_status_reg_i");
         ch0_int_status_reg_i.configure(this, null, "");
         ch0_int_status_reg_i.build();	 
         ch1_cmd_reg0_i = ch1_cmd_reg0::type_id::create("ch1_cmd_reg0_i");
         ch1_cmd_reg0_i.configure(this, null, "");
         ch1_cmd_reg0_i.build();	 
         ch1_cmd_reg1_i = ch1_cmd_reg1::type_id::create("ch1_cmd_reg1_i");
         ch1_cmd_reg1_i.configure(this, null, "");
         ch1_cmd_reg1_i.build();	 
         ch1_cmd_reg2_i = ch1_cmd_reg2::type_id::create("ch1_cmd_reg2_i");
         ch1_cmd_reg2_i.configure(this, null, "");
         ch1_cmd_reg2_i.build();	 
         ch1_cmd_reg3_i = ch1_cmd_reg3::type_id::create("ch1_cmd_reg3_i");
         ch1_cmd_reg3_i.configure(this, null, "");
         ch1_cmd_reg3_i.build();	 
         ch1_static_reg0_i = ch1_static_reg0::type_id::create("ch1_static_reg0_i");
         ch1_static_reg0_i.configure(this, null, "");
         ch1_static_reg0_i.build();	 
         ch1_static_reg1_i = ch1_static_reg1::type_id::create("ch1_static_reg1_i");
         ch1_static_reg1_i.configure(this, null, "");
         ch1_static_reg1_i.build();	 
         ch1_static_reg2_i = ch1_static_reg2::type_id::create("ch1_static_reg2_i");
         ch1_static_reg2_i.configure(this, null, "");
         ch1_static_reg2_i.build();	 
         ch1_static_reg3_i = ch1_static_reg3::type_id::create("ch1_static_reg3_i");
         ch1_static_reg3_i.configure(this, null, "");
         ch1_static_reg3_i.build();	 
         ch1_restrict_reg_i = ch1_restrict_reg::type_id::create("ch1_restrict_reg_i");
         ch1_restrict_reg_i.configure(this, null, "");
         ch1_restrict_reg_i.build();	 
         ch1_read_offset_reg_i = ch1_read_offset_reg::type_id::create("ch1_read_offset_reg_i");
         ch1_read_offset_reg_i.configure(this, null, "");
         ch1_read_offset_reg_i.build();	 
         ch1_write_offset_reg_i = ch1_write_offset_reg::type_id::create("ch1_write_offset_reg_i");
         ch1_write_offset_reg_i.configure(this, null, "");
         ch1_write_offset_reg_i.build();	 
         ch1_fifo_fullness_reg_i = ch1_fifo_fullness_reg::type_id::create("ch1_fifo_fullness_reg_i");
         ch1_fifo_fullness_reg_i.configure(this, null, "");
         ch1_fifo_fullness_reg_i.build();	 
         ch1_cmd_outs_reg_i = ch1_cmd_outs_reg::type_id::create("ch1_cmd_outs_reg_i");
         ch1_cmd_outs_reg_i.configure(this, null, "");
         ch1_cmd_outs_reg_i.build();	 
         ch1_ch_enable_reg_i = ch1_ch_enable_reg::type_id::create("ch1_ch_enable_reg_i");
         ch1_ch_enable_reg_i.configure(this, null, "");
         ch1_ch_enable_reg_i.build();	 
         ch1_ch_start_reg_i = ch1_ch_start_reg::type_id::create("ch1_ch_start_reg_i");
         ch1_ch_start_reg_i.configure(this, null, "");
         ch1_ch_start_reg_i.build();	 
         ch1_ch_active_reg_i = ch1_ch_active_reg::type_id::create("ch1_ch_active_reg_i");
         ch1_ch_active_reg_i.configure(this, null, "");
         ch1_ch_active_reg_i.build();	 
         ch1_count_reg_i = ch1_count_reg::type_id::create("ch1_count_reg_i");
         ch1_count_reg_i.configure(this, null, "");
         ch1_count_reg_i.build();	 
         ch1_int_rawstat_reg_i = ch1_int_rawstat_reg::type_id::create("ch1_int_rawstat_reg_i");
         ch1_int_rawstat_reg_i.configure(this, null, "");
         ch1_int_rawstat_reg_i.build();	 
         ch1_int_clear_reg_i = ch1_int_clear_reg::type_id::create("ch1_int_clear_reg_i");
         ch1_int_clear_reg_i.configure(this, null, "");
         ch1_int_clear_reg_i.build();	 
         ch1_int_enable_reg_i = ch1_int_enable_reg::type_id::create("ch1_int_enable_reg_i");
         ch1_int_enable_reg_i.configure(this, null, "");
         ch1_int_enable_reg_i.build();	 
         ch1_int_status_reg_i = ch1_int_status_reg::type_id::create("ch1_int_status_reg_i");
         ch1_int_status_reg_i.configure(this, null, "");
         ch1_int_status_reg_i.build();	 
         ch2_cmd_reg0_i = ch2_cmd_reg0::type_id::create("ch2_cmd_reg0_i");
         ch2_cmd_reg0_i.configure(this, null, "");
         ch2_cmd_reg0_i.build();	 
         ch2_cmd_reg1_i = ch2_cmd_reg1::type_id::create("ch2_cmd_reg1_i");
         ch2_cmd_reg1_i.configure(this, null, "");
         ch2_cmd_reg1_i.build();	 
         ch2_cmd_reg2_i = ch2_cmd_reg2::type_id::create("ch2_cmd_reg2_i");
         ch2_cmd_reg2_i.configure(this, null, "");
         ch2_cmd_reg2_i.build();	 
         ch2_cmd_reg3_i = ch2_cmd_reg3::type_id::create("ch2_cmd_reg3_i");
         ch2_cmd_reg3_i.configure(this, null, "");
         ch2_cmd_reg3_i.build();	 
         ch2_static_reg0_i = ch2_static_reg0::type_id::create("ch2_static_reg0_i");
         ch2_static_reg0_i.configure(this, null, "");
         ch2_static_reg0_i.build();	 
         ch2_static_reg1_i = ch2_static_reg1::type_id::create("ch2_static_reg1_i");
         ch2_static_reg1_i.configure(this, null, "");
         ch2_static_reg1_i.build();	 
         ch2_static_reg2_i = ch2_static_reg2::type_id::create("ch2_static_reg2_i");
         ch2_static_reg2_i.configure(this, null, "");
         ch2_static_reg2_i.build();	 
         ch2_static_reg3_i = ch2_static_reg3::type_id::create("ch2_static_reg3_i");
         ch2_static_reg3_i.configure(this, null, "");
         ch2_static_reg3_i.build();	 
         ch2_restrict_reg_i = ch2_restrict_reg::type_id::create("ch2_restrict_reg_i");
         ch2_restrict_reg_i.configure(this, null, "");
         ch2_restrict_reg_i.build();	 
         ch2_read_offset_reg_i = ch2_read_offset_reg::type_id::create("ch2_read_offset_reg_i");
         ch2_read_offset_reg_i.configure(this, null, "");
         ch2_read_offset_reg_i.build();	 
         ch2_write_offset_reg_i = ch2_write_offset_reg::type_id::create("ch2_write_offset_reg_i");
         ch2_write_offset_reg_i.configure(this, null, "");
         ch2_write_offset_reg_i.build();	 
         ch2_fifo_fullness_reg_i = ch2_fifo_fullness_reg::type_id::create("ch2_fifo_fullness_reg_i");
         ch2_fifo_fullness_reg_i.configure(this, null, "");
         ch2_fifo_fullness_reg_i.build();	 
         ch2_cmd_outs_reg_i = ch2_cmd_outs_reg::type_id::create("ch2_cmd_outs_reg_i");
         ch2_cmd_outs_reg_i.configure(this, null, "");
         ch2_cmd_outs_reg_i.build();	 
         ch2_ch_enable_reg_i = ch2_ch_enable_reg::type_id::create("ch2_ch_enable_reg_i");
         ch2_ch_enable_reg_i.configure(this, null, "");
         ch2_ch_enable_reg_i.build();	 
         ch2_ch_start_reg_i = ch2_ch_start_reg::type_id::create("ch2_ch_start_reg_i");
         ch2_ch_start_reg_i.configure(this, null, "");
         ch2_ch_start_reg_i.build();	 
         ch2_ch_active_reg_i = ch2_ch_active_reg::type_id::create("ch2_ch_active_reg_i");
         ch2_ch_active_reg_i.configure(this, null, "");
         ch2_ch_active_reg_i.build();	 
         ch2_count_reg_i = ch2_count_reg::type_id::create("ch2_count_reg_i");
         ch2_count_reg_i.configure(this, null, "");
         ch2_count_reg_i.build();	 
         ch2_int_rawstat_reg_i = ch2_int_rawstat_reg::type_id::create("ch2_int_rawstat_reg_i");
         ch2_int_rawstat_reg_i.configure(this, null, "");
         ch2_int_rawstat_reg_i.build();	 
         ch2_int_clear_reg_i = ch2_int_clear_reg::type_id::create("ch2_int_clear_reg_i");
         ch2_int_clear_reg_i.configure(this, null, "");
         ch2_int_clear_reg_i.build();	 
         ch2_int_enable_reg_i = ch2_int_enable_reg::type_id::create("ch2_int_enable_reg_i");
         ch2_int_enable_reg_i.configure(this, null, "");
         ch2_int_enable_reg_i.build();	 
         ch2_int_status_reg_i = ch2_int_status_reg::type_id::create("ch2_int_status_reg_i");
         ch2_int_status_reg_i.configure(this, null, "");
         ch2_int_status_reg_i.build();	 
         ch3_cmd_reg0_i = ch3_cmd_reg0::type_id::create("ch3_cmd_reg0_i");
         ch3_cmd_reg0_i.configure(this, null, "");
         ch3_cmd_reg0_i.build();	 
         ch3_cmd_reg1_i = ch3_cmd_reg1::type_id::create("ch3_cmd_reg1_i");
         ch3_cmd_reg1_i.configure(this, null, "");
         ch3_cmd_reg1_i.build();	 
         ch3_cmd_reg2_i = ch3_cmd_reg2::type_id::create("ch3_cmd_reg2_i");
         ch3_cmd_reg2_i.configure(this, null, "");
         ch3_cmd_reg2_i.build();	 
         ch3_cmd_reg3_i = ch3_cmd_reg3::type_id::create("ch3_cmd_reg3_i");
         ch3_cmd_reg3_i.configure(this, null, "");
         ch3_cmd_reg3_i.build();	 
         ch3_static_reg0_i = ch3_static_reg0::type_id::create("ch3_static_reg0_i");
         ch3_static_reg0_i.configure(this, null, "");
         ch3_static_reg0_i.build();	 
         ch3_static_reg1_i = ch3_static_reg1::type_id::create("ch3_static_reg1_i");
         ch3_static_reg1_i.configure(this, null, "");
         ch3_static_reg1_i.build();	 
         ch3_static_reg2_i = ch3_static_reg2::type_id::create("ch3_static_reg2_i");
         ch3_static_reg2_i.configure(this, null, "");
         ch3_static_reg2_i.build();	 
         ch3_static_reg3_i = ch3_static_reg3::type_id::create("ch3_static_reg3_i");
         ch3_static_reg3_i.configure(this, null, "");
         ch3_static_reg3_i.build();	 
         ch3_restrict_reg_i = ch3_restrict_reg::type_id::create("ch3_restrict_reg_i");
         ch3_restrict_reg_i.configure(this, null, "");
         ch3_restrict_reg_i.build();	 
         ch3_read_offset_reg_i = ch3_read_offset_reg::type_id::create("ch3_read_offset_reg_i");
         ch3_read_offset_reg_i.configure(this, null, "");
         ch3_read_offset_reg_i.build();	 
         ch3_write_offset_reg_i = ch3_write_offset_reg::type_id::create("ch3_write_offset_reg_i");
         ch3_write_offset_reg_i.configure(this, null, "");
         ch3_write_offset_reg_i.build();	 
         ch3_fifo_fullness_reg_i = ch3_fifo_fullness_reg::type_id::create("ch3_fifo_fullness_reg_i");
         ch3_fifo_fullness_reg_i.configure(this, null, "");
         ch3_fifo_fullness_reg_i.build();	 
         ch3_cmd_outs_reg_i = ch3_cmd_outs_reg::type_id::create("ch3_cmd_outs_reg_i");
         ch3_cmd_outs_reg_i.configure(this, null, "");
         ch3_cmd_outs_reg_i.build();	 
         ch3_ch_enable_reg_i = ch3_ch_enable_reg::type_id::create("ch3_ch_enable_reg_i");
         ch3_ch_enable_reg_i.configure(this, null, "");
         ch3_ch_enable_reg_i.build();	 
         ch3_ch_start_reg_i = ch3_ch_start_reg::type_id::create("ch3_ch_start_reg_i");
         ch3_ch_start_reg_i.configure(this, null, "");
         ch3_ch_start_reg_i.build();	 
         ch3_ch_active_reg_i = ch3_ch_active_reg::type_id::create("ch3_ch_active_reg_i");
         ch3_ch_active_reg_i.configure(this, null, "");
         ch3_ch_active_reg_i.build();	 
         ch3_count_reg_i = ch3_count_reg::type_id::create("ch3_count_reg_i");
         ch3_count_reg_i.configure(this, null, "");
         ch3_count_reg_i.build();	 
         ch3_int_rawstat_reg_i = ch3_int_rawstat_reg::type_id::create("ch3_int_rawstat_reg_i");
         ch3_int_rawstat_reg_i.configure(this, null, "");
         ch3_int_rawstat_reg_i.build();	 
         ch3_int_clear_reg_i = ch3_int_clear_reg::type_id::create("ch3_int_clear_reg_i");
         ch3_int_clear_reg_i.configure(this, null, "");
         ch3_int_clear_reg_i.build();	 
         ch3_int_enable_reg_i = ch3_int_enable_reg::type_id::create("ch3_int_enable_reg_i");
         ch3_int_enable_reg_i.configure(this, null, "");
         ch3_int_enable_reg_i.build();	 
         ch3_int_status_reg_i = ch3_int_status_reg::type_id::create("ch3_int_status_reg_i");
         ch3_int_status_reg_i.configure(this, null, "");
         ch3_int_status_reg_i.build();	 
         ch4_cmd_reg0_i = ch4_cmd_reg0::type_id::create("ch4_cmd_reg0_i");
         ch4_cmd_reg0_i.configure(this, null, "");
         ch4_cmd_reg0_i.build();	 
         ch4_cmd_reg1_i = ch4_cmd_reg1::type_id::create("ch4_cmd_reg1_i");
         ch4_cmd_reg1_i.configure(this, null, "");
         ch4_cmd_reg1_i.build();	 
         ch4_cmd_reg2_i = ch4_cmd_reg2::type_id::create("ch4_cmd_reg2_i");
         ch4_cmd_reg2_i.configure(this, null, "");
         ch4_cmd_reg2_i.build();	 
         ch4_cmd_reg3_i = ch4_cmd_reg3::type_id::create("ch4_cmd_reg3_i");
         ch4_cmd_reg3_i.configure(this, null, "");
         ch4_cmd_reg3_i.build();	 
         ch4_static_reg0_i = ch4_static_reg0::type_id::create("ch4_static_reg0_i");
         ch4_static_reg0_i.configure(this, null, "");
         ch4_static_reg0_i.build();	 
         ch4_static_reg1_i = ch4_static_reg1::type_id::create("ch4_static_reg1_i");
         ch4_static_reg1_i.configure(this, null, "");
         ch4_static_reg1_i.build();	 
         ch4_static_reg2_i = ch4_static_reg2::type_id::create("ch4_static_reg2_i");
         ch4_static_reg2_i.configure(this, null, "");
         ch4_static_reg2_i.build();	 
         ch4_static_reg3_i = ch4_static_reg3::type_id::create("ch4_static_reg3_i");
         ch4_static_reg3_i.configure(this, null, "");
         ch4_static_reg3_i.build();	 
         ch4_restrict_reg_i = ch4_restrict_reg::type_id::create("ch4_restrict_reg_i");
         ch4_restrict_reg_i.configure(this, null, "");
         ch4_restrict_reg_i.build();	 
         ch4_read_offset_reg_i = ch4_read_offset_reg::type_id::create("ch4_read_offset_reg_i");
         ch4_read_offset_reg_i.configure(this, null, "");
         ch4_read_offset_reg_i.build();	 
         ch4_write_offset_reg_i = ch4_write_offset_reg::type_id::create("ch4_write_offset_reg_i");
         ch4_write_offset_reg_i.configure(this, null, "");
         ch4_write_offset_reg_i.build();	 
         ch4_fifo_fullness_reg_i = ch4_fifo_fullness_reg::type_id::create("ch4_fifo_fullness_reg_i");
         ch4_fifo_fullness_reg_i.configure(this, null, "");
         ch4_fifo_fullness_reg_i.build();	 
         ch4_cmd_outs_reg_i = ch4_cmd_outs_reg::type_id::create("ch4_cmd_outs_reg_i");
         ch4_cmd_outs_reg_i.configure(this, null, "");
         ch4_cmd_outs_reg_i.build();	 
         ch4_ch_enable_reg_i = ch4_ch_enable_reg::type_id::create("ch4_ch_enable_reg_i");
         ch4_ch_enable_reg_i.configure(this, null, "");
         ch4_ch_enable_reg_i.build();	 
         ch4_ch_start_reg_i = ch4_ch_start_reg::type_id::create("ch4_ch_start_reg_i");
         ch4_ch_start_reg_i.configure(this, null, "");
         ch4_ch_start_reg_i.build();	 
         ch4_ch_active_reg_i = ch4_ch_active_reg::type_id::create("ch4_ch_active_reg_i");
         ch4_ch_active_reg_i.configure(this, null, "");
         ch4_ch_active_reg_i.build();	 
         ch4_count_reg_i = ch4_count_reg::type_id::create("ch4_count_reg_i");
         ch4_count_reg_i.configure(this, null, "");
         ch4_count_reg_i.build();	 
         ch4_int_rawstat_reg_i = ch4_int_rawstat_reg::type_id::create("ch4_int_rawstat_reg_i");
         ch4_int_rawstat_reg_i.configure(this, null, "");
         ch4_int_rawstat_reg_i.build();	 
         ch4_int_clear_reg_i = ch4_int_clear_reg::type_id::create("ch4_int_clear_reg_i");
         ch4_int_clear_reg_i.configure(this, null, "");
         ch4_int_clear_reg_i.build();	 
         ch4_int_enable_reg_i = ch4_int_enable_reg::type_id::create("ch4_int_enable_reg_i");
         ch4_int_enable_reg_i.configure(this, null, "");
         ch4_int_enable_reg_i.build();	 
         ch4_int_status_reg_i = ch4_int_status_reg::type_id::create("ch4_int_status_reg_i");
         ch4_int_status_reg_i.configure(this, null, "");
         ch4_int_status_reg_i.build();	 
         ch5_cmd_reg0_i = ch5_cmd_reg0::type_id::create("ch5_cmd_reg0_i");
         ch5_cmd_reg0_i.configure(this, null, "");
         ch5_cmd_reg0_i.build();	 
         ch5_cmd_reg1_i = ch5_cmd_reg1::type_id::create("ch5_cmd_reg1_i");
         ch5_cmd_reg1_i.configure(this, null, "");
         ch5_cmd_reg1_i.build();	 
         ch5_cmd_reg2_i = ch5_cmd_reg2::type_id::create("ch5_cmd_reg2_i");
         ch5_cmd_reg2_i.configure(this, null, "");
         ch5_cmd_reg2_i.build();	 
         ch5_cmd_reg3_i = ch5_cmd_reg3::type_id::create("ch5_cmd_reg3_i");
         ch5_cmd_reg3_i.configure(this, null, "");
         ch5_cmd_reg3_i.build();	 
         ch5_static_reg0_i = ch5_static_reg0::type_id::create("ch5_static_reg0_i");
         ch5_static_reg0_i.configure(this, null, "");
         ch5_static_reg0_i.build();	 
         ch5_static_reg1_i = ch5_static_reg1::type_id::create("ch5_static_reg1_i");
         ch5_static_reg1_i.configure(this, null, "");
         ch5_static_reg1_i.build();	 
         ch5_static_reg2_i = ch5_static_reg2::type_id::create("ch5_static_reg2_i");
         ch5_static_reg2_i.configure(this, null, "");
         ch5_static_reg2_i.build();	 
         ch5_static_reg3_i = ch5_static_reg3::type_id::create("ch5_static_reg3_i");
         ch5_static_reg3_i.configure(this, null, "");
         ch5_static_reg3_i.build();	 
         ch5_restrict_reg_i = ch5_restrict_reg::type_id::create("ch5_restrict_reg_i");
         ch5_restrict_reg_i.configure(this, null, "");
         ch5_restrict_reg_i.build();	 
         ch5_read_offset_reg_i = ch5_read_offset_reg::type_id::create("ch5_read_offset_reg_i");
         ch5_read_offset_reg_i.configure(this, null, "");
         ch5_read_offset_reg_i.build();	 
         ch5_write_offset_reg_i = ch5_write_offset_reg::type_id::create("ch5_write_offset_reg_i");
         ch5_write_offset_reg_i.configure(this, null, "");
         ch5_write_offset_reg_i.build();	 
         ch5_fifo_fullness_reg_i = ch5_fifo_fullness_reg::type_id::create("ch5_fifo_fullness_reg_i");
         ch5_fifo_fullness_reg_i.configure(this, null, "");
         ch5_fifo_fullness_reg_i.build();	 
         ch5_cmd_outs_reg_i = ch5_cmd_outs_reg::type_id::create("ch5_cmd_outs_reg_i");
         ch5_cmd_outs_reg_i.configure(this, null, "");
         ch5_cmd_outs_reg_i.build();	 
         ch5_ch_enable_reg_i = ch5_ch_enable_reg::type_id::create("ch5_ch_enable_reg_i");
         ch5_ch_enable_reg_i.configure(this, null, "");
         ch5_ch_enable_reg_i.build();	 
         ch5_ch_start_reg_i = ch5_ch_start_reg::type_id::create("ch5_ch_start_reg_i");
         ch5_ch_start_reg_i.configure(this, null, "");
         ch5_ch_start_reg_i.build();	 
         ch5_ch_active_reg_i = ch5_ch_active_reg::type_id::create("ch5_ch_active_reg_i");
         ch5_ch_active_reg_i.configure(this, null, "");
         ch5_ch_active_reg_i.build();	 
         ch5_count_reg_i = ch5_count_reg::type_id::create("ch5_count_reg_i");
         ch5_count_reg_i.configure(this, null, "");
         ch5_count_reg_i.build();	 
         ch5_int_rawstat_reg_i = ch5_int_rawstat_reg::type_id::create("ch5_int_rawstat_reg_i");
         ch5_int_rawstat_reg_i.configure(this, null, "");
         ch5_int_rawstat_reg_i.build();	 
         ch5_int_clear_reg_i = ch5_int_clear_reg::type_id::create("ch5_int_clear_reg_i");
         ch5_int_clear_reg_i.configure(this, null, "");
         ch5_int_clear_reg_i.build();	 
         ch5_int_enable_reg_i = ch5_int_enable_reg::type_id::create("ch5_int_enable_reg_i");
         ch5_int_enable_reg_i.configure(this, null, "");
         ch5_int_enable_reg_i.build();	 
         ch5_int_status_reg_i = ch5_int_status_reg::type_id::create("ch5_int_status_reg_i");
         ch5_int_status_reg_i.configure(this, null, "");
         ch5_int_status_reg_i.build();	 
         ch6_cmd_reg0_i = ch6_cmd_reg0::type_id::create("ch6_cmd_reg0_i");
         ch6_cmd_reg0_i.configure(this, null, "");
         ch6_cmd_reg0_i.build();	 
         ch6_cmd_reg1_i = ch6_cmd_reg1::type_id::create("ch6_cmd_reg1_i");
         ch6_cmd_reg1_i.configure(this, null, "");
         ch6_cmd_reg1_i.build();	 
         ch6_cmd_reg2_i = ch6_cmd_reg2::type_id::create("ch6_cmd_reg2_i");
         ch6_cmd_reg2_i.configure(this, null, "");
         ch6_cmd_reg2_i.build();	 
         ch6_cmd_reg3_i = ch6_cmd_reg3::type_id::create("ch6_cmd_reg3_i");
         ch6_cmd_reg3_i.configure(this, null, "");
         ch6_cmd_reg3_i.build();	 
         ch6_static_reg0_i = ch6_static_reg0::type_id::create("ch6_static_reg0_i");
         ch6_static_reg0_i.configure(this, null, "");
         ch6_static_reg0_i.build();	 
         ch6_static_reg1_i = ch6_static_reg1::type_id::create("ch6_static_reg1_i");
         ch6_static_reg1_i.configure(this, null, "");
         ch6_static_reg1_i.build();	 
         ch6_static_reg2_i = ch6_static_reg2::type_id::create("ch6_static_reg2_i");
         ch6_static_reg2_i.configure(this, null, "");
         ch6_static_reg2_i.build();	 
         ch6_static_reg3_i = ch6_static_reg3::type_id::create("ch6_static_reg3_i");
         ch6_static_reg3_i.configure(this, null, "");
         ch6_static_reg3_i.build();	 
         ch6_restrict_reg_i = ch6_restrict_reg::type_id::create("ch6_restrict_reg_i");
         ch6_restrict_reg_i.configure(this, null, "");
         ch6_restrict_reg_i.build();	 
         ch6_read_offset_reg_i = ch6_read_offset_reg::type_id::create("ch6_read_offset_reg_i");
         ch6_read_offset_reg_i.configure(this, null, "");
         ch6_read_offset_reg_i.build();	 
         ch6_write_offset_reg_i = ch6_write_offset_reg::type_id::create("ch6_write_offset_reg_i");
         ch6_write_offset_reg_i.configure(this, null, "");
         ch6_write_offset_reg_i.build();	 
         ch6_fifo_fullness_reg_i = ch6_fifo_fullness_reg::type_id::create("ch6_fifo_fullness_reg_i");
         ch6_fifo_fullness_reg_i.configure(this, null, "");
         ch6_fifo_fullness_reg_i.build();	 
         ch6_cmd_outs_reg_i = ch6_cmd_outs_reg::type_id::create("ch6_cmd_outs_reg_i");
         ch6_cmd_outs_reg_i.configure(this, null, "");
         ch6_cmd_outs_reg_i.build();	 
         ch6_ch_enable_reg_i = ch6_ch_enable_reg::type_id::create("ch6_ch_enable_reg_i");
         ch6_ch_enable_reg_i.configure(this, null, "");
         ch6_ch_enable_reg_i.build();	 
         ch6_ch_start_reg_i = ch6_ch_start_reg::type_id::create("ch6_ch_start_reg_i");
         ch6_ch_start_reg_i.configure(this, null, "");
         ch6_ch_start_reg_i.build();	 
         ch6_ch_active_reg_i = ch6_ch_active_reg::type_id::create("ch6_ch_active_reg_i");
         ch6_ch_active_reg_i.configure(this, null, "");
         ch6_ch_active_reg_i.build();	 
         ch6_count_reg_i = ch6_count_reg::type_id::create("ch6_count_reg_i");
         ch6_count_reg_i.configure(this, null, "");
         ch6_count_reg_i.build();	 
         ch6_int_rawstat_reg_i = ch6_int_rawstat_reg::type_id::create("ch6_int_rawstat_reg_i");
         ch6_int_rawstat_reg_i.configure(this, null, "");
         ch6_int_rawstat_reg_i.build();	 
         ch6_int_clear_reg_i = ch6_int_clear_reg::type_id::create("ch6_int_clear_reg_i");
         ch6_int_clear_reg_i.configure(this, null, "");
         ch6_int_clear_reg_i.build();	 
         ch6_int_enable_reg_i = ch6_int_enable_reg::type_id::create("ch6_int_enable_reg_i");
         ch6_int_enable_reg_i.configure(this, null, "");
         ch6_int_enable_reg_i.build();	 
         ch6_int_status_reg_i = ch6_int_status_reg::type_id::create("ch6_int_status_reg_i");
         ch6_int_status_reg_i.configure(this, null, "");
         ch6_int_status_reg_i.build();	 
         ch7_cmd_reg0_i = ch7_cmd_reg0::type_id::create("ch7_cmd_reg0_i");
         ch7_cmd_reg0_i.configure(this, null, "");
         ch7_cmd_reg0_i.build();	 


         ch7_cmd_reg1_i = ch7_cmd_reg1::type_id::create("ch7_cmd_reg1_i");
         ch7_cmd_reg1_i.configure(this, null, "");
         ch7_cmd_reg1_i.build();	 

         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch0.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch0_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch1.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch1_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch2.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch2_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch3.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch3_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch4.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch4_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch5.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch5_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch6.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch6_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         for(int i = 0; i < 32; i++) begin
           $sformat(s, "dma_axi64_core0_ch7.dma_axi64_ch_reg.wr_start_addr[%0d]", i);
           ch7_cmd_reg1_i.add_hdl_path_slice(s, i, 1);
         end
         ch7_cmd_reg2_i = ch7_cmd_reg2::type_id::create("ch7_cmd_reg2_i");
         ch7_cmd_reg2_i.configure(this, null, "");
         ch7_cmd_reg2_i.build();	 
         ch7_cmd_reg3_i = ch7_cmd_reg3::type_id::create("ch7_cmd_reg3_i");
         ch7_cmd_reg3_i.configure(this, null, "");
         ch7_cmd_reg3_i.build();	 
         ch7_static_reg0_i = ch7_static_reg0::type_id::create("ch7_static_reg0_i");
         ch7_static_reg0_i.configure(this, null, "");
         ch7_static_reg0_i.build();	 
         ch7_static_reg1_i = ch7_static_reg1::type_id::create("ch7_static_reg1_i");
         ch7_static_reg1_i.configure(this, null, "");
         ch7_static_reg1_i.build();	 
         ch7_static_reg2_i = ch7_static_reg2::type_id::create("ch7_static_reg2_i");
         ch7_static_reg2_i.configure(this, null, "");
         ch7_static_reg2_i.build();	 
         ch7_static_reg3_i = ch7_static_reg3::type_id::create("ch7_static_reg3_i");
         ch7_static_reg3_i.configure(this, null, "");
         ch7_static_reg3_i.build();	 
         ch7_restrict_reg_i = ch7_restrict_reg::type_id::create("ch7_restrict_reg_i");
         ch7_restrict_reg_i.configure(this, null, "");
         ch7_restrict_reg_i.build();	 
         ch7_read_offset_reg_i = ch7_read_offset_reg::type_id::create("ch7_read_offset_reg_i");
         ch7_read_offset_reg_i.configure(this, null, "");
         ch7_read_offset_reg_i.build();	 
         ch7_write_offset_reg_i = ch7_write_offset_reg::type_id::create("ch7_write_offset_reg_i");
         ch7_write_offset_reg_i.configure(this, null, "");
         ch7_write_offset_reg_i.build();	 
         ch7_fifo_fullness_reg_i = ch7_fifo_fullness_reg::type_id::create("ch7_fifo_fullness_reg_i");
         ch7_fifo_fullness_reg_i.configure(this, null, "");
         ch7_fifo_fullness_reg_i.build();	 
         ch7_cmd_outs_reg_i = ch7_cmd_outs_reg::type_id::create("ch7_cmd_outs_reg_i");
         ch7_cmd_outs_reg_i.configure(this, null, "");
         ch7_cmd_outs_reg_i.build();	 
         ch7_ch_enable_reg_i = ch7_ch_enable_reg::type_id::create("ch7_ch_enable_reg_i");
         ch7_ch_enable_reg_i.configure(this, null, "");
         ch7_ch_enable_reg_i.build();	 
         ch7_ch_start_reg_i = ch7_ch_start_reg::type_id::create("ch7_ch_start_reg_i");
         ch7_ch_start_reg_i.configure(this, null, "");
         ch7_ch_start_reg_i.build();	 
         ch7_ch_active_reg_i = ch7_ch_active_reg::type_id::create("ch7_ch_active_reg_i");
         ch7_ch_active_reg_i.configure(this, null, "");
         ch7_ch_active_reg_i.build();	 
         ch7_count_reg_i = ch7_count_reg::type_id::create("ch7_count_reg_i");
         ch7_count_reg_i.configure(this, null, "");
         ch7_count_reg_i.build();	 
         ch7_int_rawstat_reg_i = ch7_int_rawstat_reg::type_id::create("ch7_int_rawstat_reg_i");
         ch7_int_rawstat_reg_i.configure(this, null, "");
         ch7_int_rawstat_reg_i.build();	 
         ch7_int_clear_reg_i = ch7_int_clear_reg::type_id::create("ch7_int_clear_reg_i");
         ch7_int_clear_reg_i.configure(this, null, "");
         ch7_int_clear_reg_i.build();	 
         ch7_int_enable_reg_i = ch7_int_enable_reg::type_id::create("ch7_int_enable_reg_i");
         ch7_int_enable_reg_i.configure(this, null, "");
         ch7_int_enable_reg_i.build();	 
         ch7_int_status_reg_i = ch7_int_status_reg::type_id::create("ch7_int_status_reg_i");
         ch7_int_status_reg_i.configure(this, null, "");
         ch7_int_status_reg_i.build();	 
         int0_status_i = int0_status::type_id::create("int0_status_i");
         int0_status_i.configure(this, null, "");
         int0_status_i.build();	 
         int1_status_i = int1_status::type_id::create("int1_status_i");
         int1_status_i.configure(this, null, "");
         int1_status_i.build();	 
         int2_status_i = int2_status::type_id::create("int2_status_i");
         int2_status_i.configure(this, null, "");
         int2_status_i.build();	 
         int3_status_i = int3_status::type_id::create("int3_status_i");
         int3_status_i.configure(this, null, "");
         int3_status_i.build();	 
         int4_status_i = int4_status::type_id::create("int4_status_i");
         int4_status_i.configure(this, null, "");
         int4_status_i.build();	 
         int5_status_i = int5_status::type_id::create("int5_status_i");
         int5_status_i.configure(this, null, "");
         int5_status_i.build();	 
         int6_status_i = int6_status::type_id::create("int6_status_i");
         int6_status_i.configure(this, null, "");
         int6_status_i.build();	 
         int7_status_i = int7_status::type_id::create("int7_status_i");
         int7_status_i.configure(this, null, "");
         int7_status_i.build();	 
         core0_joint_mode_i = core0_joint_mode::type_id::create("core0_joint_mode_i");
         core0_joint_mode_i.configure(this, null, "");
         core0_joint_mode_i.build();	 
         core1_joint_mode_i = core1_joint_mode::type_id::create("core1_joint_mode_i");
         core1_joint_mode_i.configure(this, null, "");
         core1_joint_mode_i.build();	 
         core0_priority_i = core0_priority::type_id::create("core0_priority_i");
         core0_priority_i.configure(this, null, "");
         core0_priority_i.build();	 
         core1_priority_i = core1_priority::type_id::create("core1_priority_i");
         core1_priority_i.configure(this, null, "");
         core1_priority_i.build();	 
         core0_clkdiv_r_i = core0_clkdiv_r::type_id::create("core0_clkdiv_r_i");
         core0_clkdiv_r_i.configure(this, null, "");
         core0_clkdiv_r_i.build();	 
         core1_clkdiv_i = core1_clkdiv::type_id::create("core1_clkdiv_i");
         core1_clkdiv_i.configure(this, null, "");
         core1_clkdiv_i.build();	 
         core0_ch_start_r_i = core0_ch_start_r::type_id::create("core0_ch_start_r_i");
         core0_ch_start_r_i.configure(this, null, "");
         core0_ch_start_r_i.build();	 
         core1_ch_start_i = core1_ch_start::type_id::create("core1_ch_start_i");
         core1_ch_start_i.configure(this, null, "");
         core1_ch_start_i.build();	 
         periph_rx_ctrl_i = periph_rx_ctrl::type_id::create("periph_rx_ctrl_i");
         periph_rx_ctrl_i.configure(this, null, "");
         periph_rx_ctrl_i.build();	 
         periph_tx_ctrl_i = periph_tx_ctrl::type_id::create("periph_tx_ctrl_i");
         periph_tx_ctrl_i.configure(this, null, "");
         periph_tx_ctrl_i.build();	 
         idle_i = idle::type_id::create("idle_i");
         idle_i.configure(this, null, "");
         idle_i.build();	 
         user_def_status_i = user_def_status::type_id::create("user_def_status_i");
         user_def_status_i.configure(this, null, "");
         user_def_status_i.build();	 
         user_core0_def_status0_i = user_core0_def_status0::type_id::create("user_core0_def_status0_i");
         user_core0_def_status0_i.configure(this, null, "");
         user_core0_def_status0_i.build();	 
         user_core0_def_status1_i = user_core0_def_status1::type_id::create("user_core0_def_status1_i");
         user_core0_def_status1_i.configure(this, null, "");
         user_core0_def_status1_i.build();	 
         user_core1_def_status0_i = user_core1_def_status0::type_id::create("user_core1_def_status0_i");
         user_core1_def_status0_i.configure(this, null, "");
         user_core1_def_status0_i.build();	 
         user_core1_def_status1_i = user_core1_def_status1::type_id::create("user_core1_def_status1_i");
         user_core1_def_status1_i.configure(this, null, "");
         user_core1_def_status1_i.build();	 

         apb_map = create_map("apb_map", 'h0, 4, UVM_LITTLE_ENDIAN);
         apb_map.add_reg(ch0_cmd_reg0_i, `CH0_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch0_cmd_reg1_i, `CH0_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch0_cmd_reg2_i, `CH0_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch0_cmd_reg3_i, `CH0_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch0_static_reg0_i, `CH0_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch0_static_reg1_i, `CH0_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch0_static_reg2_i, `CH0_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch0_static_reg3_i, `CH0_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch0_static_reg4_i, `CH0_STATIC_REG4_ADDR, "RW");
         apb_map.add_reg(ch0_restrict_reg_i, `CH0_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch0_read_offset_reg_i, `CH0_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch0_write_offset_reg_i, `CH0_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch0_fifo_fullness_reg_i, `CH0_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch0_cmd_outs_reg_i, `CH0_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch0_ch_enable_reg_i, `CH0_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch0_ch_start_reg_i, `CH0_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch0_ch_active_reg_i, `CH0_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch0_count_reg_i, `CH0_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch0_int_rawstat_reg_i, `CH0_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch0_int_clear_reg_i, `CH0_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch0_int_enable_reg_i, `CH0_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch0_int_status_reg_i, `CH0_INT_STATUS_REG_ADDR, "RO");

         apb_map.add_reg(ch1_cmd_reg0_i, `CH1_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch1_cmd_reg1_i, `CH1_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch1_cmd_reg2_i, `CH1_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch1_cmd_reg3_i, `CH1_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch1_static_reg0_i, `CH1_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch1_static_reg1_i, `CH1_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch1_static_reg2_i, `CH1_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch1_static_reg3_i, `CH1_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch1_restrict_reg_i, `CH1_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch1_read_offset_reg_i, `CH1_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch1_write_offset_reg_i, `CH1_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch1_fifo_fullness_reg_i, `CH1_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch1_cmd_outs_reg_i, `CH1_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch1_ch_enable_reg_i, `CH1_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch1_ch_start_reg_i, `CH1_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch1_ch_active_reg_i, `CH1_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch1_count_reg_i, `CH1_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch1_int_rawstat_reg_i, `CH1_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch1_int_clear_reg_i, `CH1_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch1_int_enable_reg_i, `CH1_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch1_int_status_reg_i, `CH1_INT_STATUS_REG_ADDR, "RO");

         apb_map.add_reg(ch2_cmd_reg0_i, `CH2_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch2_cmd_reg1_i, `CH2_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch2_cmd_reg2_i, `CH2_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch2_cmd_reg3_i, `CH2_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch2_static_reg0_i, `CH2_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch2_static_reg1_i, `CH2_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch2_static_reg2_i, `CH2_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch2_static_reg3_i, `CH2_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch2_restrict_reg_i, `CH2_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch2_read_offset_reg_i, `CH2_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch2_write_offset_reg_i, `CH2_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch2_fifo_fullness_reg_i, `CH2_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch2_cmd_outs_reg_i, `CH2_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch2_ch_enable_reg_i, `CH2_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch2_ch_start_reg_i, `CH2_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch2_ch_active_reg_i, `CH2_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch2_count_reg_i, `CH2_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch2_int_rawstat_reg_i, `CH2_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch2_int_clear_reg_i, `CH2_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch2_int_enable_reg_i, `CH2_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch2_int_status_reg_i, `CH2_INT_STATUS_REG_ADDR, "RO");

         apb_map.add_reg(ch3_cmd_reg0_i, `CH3_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch3_cmd_reg1_i, `CH3_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch3_cmd_reg2_i, `CH3_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch3_cmd_reg3_i, `CH3_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch3_static_reg0_i, `CH3_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch3_static_reg1_i, `CH3_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch3_static_reg2_i, `CH3_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch3_static_reg3_i, `CH3_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch3_restrict_reg_i, `CH3_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch3_read_offset_reg_i, `CH3_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch3_write_offset_reg_i, `CH3_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch3_fifo_fullness_reg_i, `CH3_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch3_cmd_outs_reg_i, `CH3_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch3_ch_enable_reg_i, `CH3_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch3_ch_start_reg_i, `CH3_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch3_ch_active_reg_i, `CH3_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch3_count_reg_i, `CH3_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch3_int_rawstat_reg_i, `CH3_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch3_int_clear_reg_i, `CH3_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch3_int_enable_reg_i, `CH3_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch3_int_status_reg_i, `CH3_INT_STATUS_REG_ADDR, "RO");

         apb_map.add_reg(ch4_cmd_reg0_i, `CH4_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch4_cmd_reg1_i, `CH4_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch4_cmd_reg2_i, `CH4_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch4_cmd_reg3_i, `CH4_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch4_static_reg0_i, `CH4_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch4_static_reg1_i, `CH4_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch4_static_reg2_i, `CH4_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch4_static_reg3_i, `CH4_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch4_restrict_reg_i, `CH4_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch4_read_offset_reg_i, `CH4_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch4_write_offset_reg_i, `CH4_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch4_fifo_fullness_reg_i, `CH4_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch4_cmd_outs_reg_i, `CH4_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch4_ch_enable_reg_i, `CH4_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch4_ch_start_reg_i, `CH4_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch4_ch_active_reg_i, `CH4_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch4_count_reg_i, `CH4_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch4_int_rawstat_reg_i, `CH4_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch4_int_clear_reg_i, `CH4_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch4_int_enable_reg_i, `CH4_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch4_int_status_reg_i, `CH4_INT_STATUS_REG_ADDR, "RO");

         apb_map.add_reg(ch5_cmd_reg0_i, `CH5_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch5_cmd_reg1_i, `CH5_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch5_cmd_reg2_i, `CH5_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch5_cmd_reg3_i, `CH5_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch5_static_reg0_i, `CH5_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch5_static_reg1_i, `CH5_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch5_static_reg2_i, `CH5_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch5_static_reg3_i, `CH5_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch5_restrict_reg_i, `CH5_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch5_read_offset_reg_i, `CH5_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch5_write_offset_reg_i, `CH5_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch5_fifo_fullness_reg_i, `CH5_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch5_cmd_outs_reg_i, `CH5_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch5_ch_enable_reg_i, `CH5_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch5_ch_start_reg_i, `CH5_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch5_ch_active_reg_i, `CH5_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch5_count_reg_i, `CH5_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch5_int_rawstat_reg_i, `CH5_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch5_int_clear_reg_i, `CH5_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch5_int_enable_reg_i, `CH5_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch5_int_status_reg_i, `CH5_INT_STATUS_REG_ADDR, "RO");

         apb_map.add_reg(ch6_cmd_reg0_i, `CH6_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch6_cmd_reg1_i, `CH6_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch6_cmd_reg2_i, `CH6_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch6_cmd_reg3_i, `CH6_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch6_static_reg0_i, `CH6_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch6_static_reg1_i, `CH6_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch6_static_reg2_i, `CH6_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch6_static_reg3_i, `CH6_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch6_restrict_reg_i, `CH6_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch6_read_offset_reg_i, `CH6_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch6_write_offset_reg_i, `CH6_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch6_fifo_fullness_reg_i, `CH6_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch6_cmd_outs_reg_i, `CH6_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch6_ch_enable_reg_i, `CH6_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch6_ch_start_reg_i, `CH6_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch6_ch_active_reg_i, `CH6_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch6_count_reg_i, `CH6_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch6_int_rawstat_reg_i, `CH6_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch6_int_clear_reg_i, `CH6_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch6_int_enable_reg_i, `CH6_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch6_int_status_reg_i, `CH6_INT_STATUS_REG_ADDR, "RO");

         apb_map.add_reg(ch7_cmd_reg0_i, `CH7_CMD_REG0_ADDR, "RW");
         apb_map.add_reg(ch7_cmd_reg1_i, `CH7_CMD_REG1_ADDR, "RW");
         apb_map.add_reg(ch7_cmd_reg2_i, `CH7_CMD_REG2_ADDR, "RW");
         apb_map.add_reg(ch7_cmd_reg3_i, `CH7_CMD_REG3_ADDR, "RW");
         apb_map.add_reg(ch7_static_reg0_i, `CH7_STATIC_REG0_ADDR, "RW");
         apb_map.add_reg(ch7_static_reg1_i, `CH7_STATIC_REG1_ADDR, "RW");
         apb_map.add_reg(ch7_static_reg2_i, `CH7_STATIC_REG2_ADDR, "RW");
         apb_map.add_reg(ch7_static_reg3_i, `CH7_STATIC_REG3_ADDR, "RW");
         apb_map.add_reg(ch7_restrict_reg_i, `CH7_RESTRICT_REG_ADDR, "RO");
         apb_map.add_reg(ch7_read_offset_reg_i, `CH7_READ_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch7_write_offset_reg_i, `CH7_WRITE_OFFSET_REG_ADDR, "RO");
         apb_map.add_reg(ch7_fifo_fullness_reg_i, `CH7_FIFO_FULLNESS_REG_ADDR, "RO");
         apb_map.add_reg(ch7_cmd_outs_reg_i, `CH7_CMD_OUTS_REG_ADDR, "RO");
         apb_map.add_reg(ch7_ch_enable_reg_i, `CH7_CH_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch7_ch_start_reg_i, `CH7_CH_START_REG_ADDR, "WO");
         apb_map.add_reg(ch7_ch_active_reg_i, `CH7_CH_ACTIVE_REG_ADDR, "RO");
         apb_map.add_reg(ch7_count_reg_i, `CH7_COUNT_REG_ADDR, "RO");
         apb_map.add_reg(ch7_int_rawstat_reg_i, `CH7_INT_RAWSTAT_REG_ADDR, "RW");
         apb_map.add_reg(ch7_int_clear_reg_i, `CH7_INT_CLEAR_REG_ADDR, "WO");
         apb_map.add_reg(ch7_int_enable_reg_i, `CH7_INT_ENABLE_REG_ADDR, "RW");
         apb_map.add_reg(ch7_int_status_reg_i, `CH7_INT_STATUS_REG_ADDR, "RO");
         apb_map.add_reg(int0_status_i, `INT0_STATUS_ADDR, "RW");
         apb_map.add_reg(int1_status_i, `INT1_STATUS_ADDR, "RW");
         apb_map.add_reg(int2_status_i, `INT2_STATUS_ADDR, "RW");
         apb_map.add_reg(int3_status_i, `INT3_STATUS_ADDR, "RW");
         apb_map.add_reg(int4_status_i, `INT4_STATUS_ADDR, "RW");
         apb_map.add_reg(int5_status_i, `INT5_STATUS_ADDR, "RW");
         apb_map.add_reg(int6_status_i, `INT6_STATUS_ADDR, "RW");
         apb_map.add_reg(int7_status_i, `INT7_STATUS_ADDR, "RW");
         apb_map.add_reg(core0_joint_mode_i, `CORE0_JOINT_MODE_ADDR, "RW");
         apb_map.add_reg(core1_joint_mode_i, `CORE1_JOINT_MODE_ADDR, "RW");
         apb_map.add_reg(core0_priority_i, `CORE0_PRIORITY_ADDR, "RW");
         apb_map.add_reg(core1_priority_i, `CORE1_PRIORITY_ADDR, "RW");
         apb_map.add_reg(core0_clkdiv_r_i, `CORE0_CLKDIV_ADDR, "RW");
         apb_map.add_reg(core1_clkdiv_i, `CORE1_CLKDIV_ADDR, "RW");
         apb_map.add_reg(core0_ch_start_r_i, `CORE0_CH_START_ADDR, "RW");
         apb_map.add_reg(core1_ch_start_i, `CORE1_CH_START_ADDR, "RW");
         apb_map.add_reg(periph_rx_ctrl_i, `PERIPH_RX_CTRL_ADDR, "RW");
         apb_map.add_reg(periph_tx_ctrl_i, `PERIPH_TX_CTRL_ADDR, "RW");
         apb_map.add_reg(idle_i, `IDLE_ADDR, "RW");
         apb_map.add_reg(user_def_status_i, `USER_DEF_STATUS_ADDR, "RO");
         apb_map.add_reg(user_core0_def_status0_i, `USER_CORE0_DEF_STATUS0_ADDR, "RW");
         apb_map.add_reg(user_core0_def_status1_i, `USER_CORE0_DEF_STATUS1_ADDR, "RW");
         apb_map.add_reg(user_core1_def_status0_i, `USER_CORE1_DEF_STATUS0_ADDR, "RW");
         apb_map.add_reg(user_core1_def_status1_i, `USER_CORE1_DEF_STATUS1_ADDR, "RW");
		 apb_map.set_auto_predict(.on(1));

		 //sim:/top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels  dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_start_addr 
         add_hdl_path("top.dut.dma_axi64_dual_core.dma_axi64_core0_top.dma_axi64_core0.dma_axi64_core0_channels", "RTL");

         lock_model();  //locking so that we can't change the register model anywhere else
	endfunction

endclass
