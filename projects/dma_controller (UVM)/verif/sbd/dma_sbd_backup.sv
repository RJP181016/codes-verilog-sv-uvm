`uvm_analysis_imp_decl(_apb);
`uvm_analysis_imp_decl(_axi);
class dma_sbd extends uvm_scoreboard;
uvm_analysis_imp_apb#(apb_tx,dma_sbd) imp_apb;
uvm_analysis_imp_axi#(axi_tx,dma_sbd) imp_axi;
`uvm_component_utils(dma_sbd);
`NEW_COMP

bit [9:0] ch0_total_rd_size;
bit [9:0] ch0_total_wr_size;
bit ch0_rd_txs_completed_f;
bit ch0_wr_txs_completed_f;
bit [7:0] ch0_rd_bufferQ[$];
bit [7:0] ch0_wr_bufferQ[$];
byte mem[*];

int matched,mismatched;

logic [31:0] ch0_rd_start_addr;
logic [31:0] ch0_wr_start_addr;
logic [9:0] buffer_size;
logic cmd_set_int;
logic cmd_last;
logic [27:0] cmd_next_addr;
logic [9:0] rd_burst_max_size;
logic rd_allow_full_burst;
logic rd_allow_full_fifo;
logic [5:0] rd_tokens;
logic [3:0] rd_outs_max;
logic rd_outstanding;
logic rd_incr;
logic [9:0] wr_burst_max_size;
logic wr_allow_full_burst;
logic wr_allow_full_fifo;
logic [5:0] wr_tokens;
logic [3:0] wr_outs_max;
logic wr_outstanding;
logic wr_incr;
logic [11:0] frame_width;
logic block;
logic joint;
logic auto_retry;
logic rd_cmd_port_num;
logic rd_port_num;
logic wr_port_num;
logic [2:0] int_num;
logic [1:0] endswap;
logic [11:0] rd_wait_limit;
logic [11:0] wr_wait_limit;
logic [4:0] rd_periph_num;
logic [2:0] rd_periph_delay;
logic rd_periph_block;
logic [4:0] wr_periph_num;
logic [2:0] wr_periph_delay;
logic wr_periph_block;
logic core0_joint_mode;



	uvm_reg dma_regs[$];
	uvm_reg dma_regs_temp[$];
	uvm_reg dma_reg;
	uvm_reg_data_t ref_data;
	uvm_status_e status;
	dma_ctrl_reg_block dma_rm;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	imp_apb=new("imp_apb",this);
	imp_axi=new("imp_axi",this);
endfunction

function void write_apb(apb_tx tx);
	//tx.print();
	if(tx.addr==`CH0_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch0_rd_start_addr = tx.data;
			ch0_rd_start_addr = dma_rm.ch0_cmd_reg0_i.rd_start_addr.value;
		end
	end
	if(tx.addr==`CH0_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch0_wr_start_addr = tx.data;
			ch0_wr_start_addr = dma_rm.ch0_cmd_reg1_i.wr_start_addr.value;
		end
	end
	if(tx.addr==`CH0_CMD_REG2_ADDR) begin
		if(tx.wr_rd==1) begin
			buffer_size = tx.data;
		end
	end
	if(tx.addr==`CH0_CMD_REG3_ADDR) begin
		if(tx.wr_rd==1) begin
			cmd_set_int = tx.data[0];
			cmd_last = tx.data[1];
			cmd_next_addr = tx.data[31:4];
		end
	end
	if(tx.addr==`CH0_STATIC_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			rd_burst_max_size = tx.data[9:0];
			rd_allow_full_burst = tx.data[12];
			rd_allow_full_fifo = tx.data[13];
			rd_tokens = tx.data[21:16];
			rd_outs_max = tx.data[27:24];
			rd_outstanding = tx.data[30];
			rd_incr = tx.data[31];
		end
	end
	if(tx.addr==`CH0_STATIC_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			wr_burst_max_size = tx.data[9:0];
			wr_allow_full_burst = tx.data[12];
			wr_allow_full_fifo = tx.data[13];
			wr_tokens = tx.data[21:16];
			wr_outs_max = tx.data[27:24];
			wr_outstanding = tx.data[30];
			wr_incr = tx.data[31];
		end
	end

	if(tx.addr==`CH0_STATIC_REG2_ADDR) begin
		if(tx.wr_rd==1) begin
			frame_width=tx.data[11:0];
			block=tx.data[15];
			joint=tx.data[16];
			auto_retry=tx.data[17];
			rd_cmd_port_num=tx.data[20];
			rd_port_num=tx.data[21];
			wr_port_num=tx.data[22];
			int_num=tx.data[26:24];
			endswap=tx.data[29:28];
		end
	end
	if(tx.addr==`CH0_STATIC_REG3_ADDR) begin
		if(tx.wr_rd==1) begin
			rd_wait_limit=tx.data[11:0];
			wr_wait_limit=tx.data[27:16];
		end
	end
	if(tx.addr==`CH0_STATIC_REG4_ADDR) begin
		if(tx.wr_rd==1) begin
			rd_periph_num=tx.data[4:0];
			rd_periph_delay=tx.data[10:8];
			rd_periph_block=tx.data[15];
			wr_periph_num=tx.data[20:16];
			wr_periph_delay=tx.data[26:24];
			wr_periph_block=tx.data[31];
		end
	end
	if(tx.addr==`CORE0_JOINT_MODE_ADDR) begin
		if(tx.wr_rd==1) begin
			core0_joint_mode = tx.data[0];
		end
	end

endfunction

function void write_axi(axi_tx tx);
	//tx.print();
	if(tx.tx_type == 0) begin
		assert(tx.raddr==ch0_rd_start_addr) else $error("ERROR: rd_addr_mismatch, tx.raddr=%h, ch0_rd_start_addr=%h", tx.raddr,ch0_rd_start_addr);
		for(int i=0; i<=tx.rlen; i++) begin
			for(int j=0; j<2**tx.rsize; j++) begin
				ch0_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
				tx.rdataQ[i]>>=8;
			end
		end
		ch0_rd_start_addr += (tx.rlen+1)*(2**(tx.rsize));
		ch0_total_rd_size = (tx.rlen+1)*(2**(tx.rsize));
		rd_burst_max_size = dma_rm.ch0_static_reg0_i.rd_burst_max_size.value;
		if(ch0_total_rd_size == rd_burst_max_size) begin
			ch0_rd_txs_completed_f=1;
		end
	end
	if(tx.tx_type==1) begin
		assert(tx.waddr==ch0_wr_start_addr) else $error("ERROR: wr_addr_mismatch, tx.waddr=%h, ch0_wr_start_addr=%h", tx.waddr,ch0_wr_start_addr);
		for(int i=0; i<=tx.wlen; i++) begin
			for(int j=0; j<2**tx.wsize; j++) begin
				ch0_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
				tx.wdataQ[i]>>=8;
			end
		end
		ch0_wr_start_addr += (tx.wlen+1)*(2**(tx.wsize));
		ch0_total_wr_size = (tx.wlen+1)*(2**(tx.wsize));
		wr_burst_max_size = dma_rm.ch0_static_reg1_i.wr_burst_max_size.value;
		if(ch0_total_wr_size == wr_burst_max_size) begin
			ch0_wr_txs_completed_f=1;
		end	
	end
	
endfunction

task run_phase(uvm_phase phase);
	uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
	forever begin
		wait(ch0_rd_txs_completed_f && ch0_wr_txs_completed_f);
		ch0_wr_txs_completed_f=0;
		ch0_rd_txs_completed_f=0;
		if(ch0_wr_bufferQ == ch0_rd_bufferQ) matched++; //`uvm_info(get_full_name(),"PASSED: DATA MATCHED",UVM_NONE)
		else begin
			mismatched++;
			`uvm_error(get_full_name(),"FAILED: wr_data and rd_data MISMATCHED")
		end
	end
endtask

function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	if(mismatched == 0) begin
		`uvm_info(get_name(),"############################################		PASSED: DATA MATCHED		################################################",UVM_NONE)
	end
	else begin 
		`uvm_error(get_name(),"############################################		FAILED: DATA MISMATCHED		################################################")
	end
endfunction
endclass





		//uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
		//dma_rm.get_registers(dma_regs);
		//dma_regs_temp = dma_regs.find(item) with (item.addr == tx.addr);
		//foreach(dma_regs[i]) begin
		//	ref_data = dma_regs[i].get_reset();
		//	if(ref_data != tx.data)	`uvm_error(get_full_name(),$sformatf("Reg read(reset) error for %s: Expected: %0h Actual: %0h", dma_regs[i].get_name(),ref_data, tx.data))
		//	else `uvm_info(get_full_name,$sformatf("------------------------>%s: Expected: %0h Actual: %0h", dma_regs[i].get_name(),ref_data, tx.data),UVM_LOW);
		//end
