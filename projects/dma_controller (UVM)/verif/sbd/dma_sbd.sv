`uvm_analysis_imp_decl(_apb);
`uvm_analysis_imp_decl(_axi);
class dma_sbd extends uvm_scoreboard;
uvm_analysis_imp_apb#(apb_tx,dma_sbd) imp_apb;
uvm_analysis_imp_axi#(axi_tx,dma_sbd) imp_axi;
`uvm_component_utils(dma_sbd);
`NEW_COMP

bit [9:0] ch_total_rd_size[8];
bit [9:0] ch_total_wr_size[8];
bit ch_rd_txs_completed_f[8];
bit ch_wr_txs_completed_f[8];
bit [7:0] ch0_rd_bufferQ[$];
bit [7:0] ch1_rd_bufferQ[$];
bit [7:0] ch2_rd_bufferQ[$];
bit [7:0] ch3_rd_bufferQ[$];
bit [7:0] ch4_rd_bufferQ[$];
bit [7:0] ch5_rd_bufferQ[$];
bit [7:0] ch6_rd_bufferQ[$];
bit [7:0] ch7_rd_bufferQ[$];
bit [7:0] ch0_wr_bufferQ[$];
bit [7:0] ch1_wr_bufferQ[$];
bit [7:0] ch2_wr_bufferQ[$];
bit [7:0] ch3_wr_bufferQ[$];
bit [7:0] ch4_wr_bufferQ[$];
bit [7:0] ch5_wr_bufferQ[$];
bit [7:0] ch6_wr_bufferQ[$];
bit [7:0] ch7_wr_bufferQ[$];
byte mem[*];

int matched,mismatched;

logic [31:0] ch0_rd_start_addr;
logic [31:0] ch1_rd_start_addr;
logic [31:0] ch2_rd_start_addr;
logic [31:0] ch3_rd_start_addr;
logic [31:0] ch4_rd_start_addr;
logic [31:0] ch5_rd_start_addr;
logic [31:0] ch6_rd_start_addr;
logic [31:0] ch7_rd_start_addr;
logic [31:0] ch0_wr_start_addr;
logic [31:0] ch1_wr_start_addr;
logic [31:0] ch2_wr_start_addr;
logic [31:0] ch3_wr_start_addr;
logic [31:0] ch4_wr_start_addr;
logic [31:0] ch5_wr_start_addr;
logic [31:0] ch6_wr_start_addr;
logic [31:0] ch7_wr_start_addr;
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
	bit scatter;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	imp_apb=new("imp_apb",this);
	imp_axi=new("imp_axi",this);
	uvm_resource_db#(bit)::read_by_name("GLOBAL","scatter",scatter,this);
	uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
endfunction

function void write_apb(apb_tx tx);
	if(tx.addr==`CH0_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch0_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH1_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch1_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH2_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch2_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH3_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch3_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH4_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch4_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH5_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch5_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH6_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch6_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH7_CMD_REG0_ADDR) begin
		if(tx.wr_rd==1) begin
			ch7_rd_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH0_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch0_wr_start_addr = tx.data;
			//ch0_wr_start_addr = dma_rm.ch0_cmd_reg1_i.wr_start_addr.value;
		end
	end
	if(tx.addr==`CH1_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch1_wr_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH2_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch2_wr_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH3_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch3_wr_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH4_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch4_wr_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH5_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch5_wr_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH6_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch6_wr_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH7_CMD_REG1_ADDR) begin
		if(tx.wr_rd==1) begin
			ch7_wr_start_addr = tx.data;
		end
	end
	if(tx.addr==`CH0_CMD_REG2_ADDR || `CH1_CMD_REG2_ADDR || `CH2_CMD_REG2_ADDR || `CH3_CMD_REG2_ADDR || `CH4_CMD_REG2_ADDR || `CH5_CMD_REG2_ADDR || `CH6_CMD_REG2_ADDR || `CH7_CMD_REG2_ADDR) begin
		if(tx.wr_rd==1) begin
			buffer_size = tx.data;
		end
	end
	if(tx.addr==`CH0_CMD_REG3_ADDR || `CH1_CMD_REG3_ADDR || `CH2_CMD_REG3_ADDR || `CH3_CMD_REG3_ADDR || `CH4_CMD_REG3_ADDR || `CH5_CMD_REG3_ADDR || `CH6_CMD_REG3_ADDR || `CH7_CMD_REG3_ADDR) begin
		if(tx.wr_rd==1) begin
			cmd_set_int = tx.data[0];
			cmd_last = tx.data[1];
			cmd_next_addr = tx.data[31:4];
		end
	end
	if(tx.addr==`CH0_STATIC_REG0_ADDR || `CH1_STATIC_REG0_ADDR || `CH2_STATIC_REG0_ADDR || `CH3_STATIC_REG0_ADDR || `CH4_STATIC_REG0_ADDR || `CH5_STATIC_REG0_ADDR || `CH6_STATIC_REG0_ADDR || `CH7_STATIC_REG0_ADDR) begin
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
	if(tx.addr==`CH0_STATIC_REG1_ADDR || `CH1_STATIC_REG1_ADDR || `CH2_STATIC_REG1_ADDR || `CH3_STATIC_REG1_ADDR || `CH4_STATIC_REG1_ADDR || `CH5_STATIC_REG1_ADDR || `CH6_STATIC_REG1_ADDR || `CH7_STATIC_REG1_ADDR) begin
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

	if(tx.addr==`CH0_STATIC_REG2_ADDR || `CH1_STATIC_REG2_ADDR || `CH2_STATIC_REG2_ADDR || `CH3_STATIC_REG2_ADDR || `CH4_STATIC_REG2_ADDR || `CH5_STATIC_REG2_ADDR || `CH6_STATIC_REG2_ADDR || `CH7_STATIC_REG2_ADDR) begin
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
	if(tx.addr==`CH0_STATIC_REG3_ADDR || `CH1_STATIC_REG3_ADDR || `CH2_STATIC_REG3_ADDR || `CH3_STATIC_REG3_ADDR || `CH4_STATIC_REG3_ADDR || `CH5_STATIC_REG3_ADDR || `CH6_STATIC_REG3_ADDR || `CH7_STATIC_REG3_ADDR) begin
		if(tx.wr_rd==1) begin
			rd_wait_limit=tx.data[11:0];
			wr_wait_limit=tx.data[27:16];
		end
	end
	if(tx.addr==`CH0_STATIC_REG4_ADDR || `CH1_STATIC_REG4_ADDR || `CH2_STATIC_REG4_ADDR || `CH3_STATIC_REG4_ADDR || `CH4_STATIC_REG4_ADDR || `CH5_STATIC_REG4_ADDR || `CH6_STATIC_REG4_ADDR || `CH7_STATIC_REG4_ADDR) begin
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
	//read
	if(tx.tx_type == 0) begin
		if(tx.raddr == `DMA_CMD_1_STORING_ADDR) begin
			ch0_rd_start_addr = `DMA_CMD_1_SOURCE_ADDR;
			if(scatter==0) ch0_wr_start_addr = `DMA_CMD_1_DEST_ADDR;
			else ch0_wr_start_addr = `DMA_CMD_1_DEST_ADDR_S;
		end
		if(tx.raddr == `DMA_CMD_2_STORING_ADDR) begin
			ch0_rd_start_addr = `DMA_CMD_2_SOURCE_ADDR;
			if(scatter==0) ch0_wr_start_addr = `DMA_CMD_2_DEST_ADDR;
			else ch0_wr_start_addr = `DMA_CMD_2_DEST_ADDR_S;
		end
		if(tx.raddr == `DMA_CMD_3_STORING_ADDR) begin
			ch0_rd_start_addr = `DMA_CMD_3_SOURCE_ADDR;
			if(scatter==0) ch0_wr_start_addr = `DMA_CMD_3_DEST_ADDR;
			else ch0_wr_start_addr = `DMA_CMD_3_DEST_ADDR_S;
		end
		if(tx.raddr == ch0_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch0_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[0] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch0_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[0] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[0]=1;
			end
		end
		if(tx.raddr == ch1_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch1_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[1] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch1_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[1] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[1]=1;
			end
		end
		if(tx.raddr == ch2_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch2_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[2] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch2_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[2] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[2]=1;
			end
		end
		if(tx.raddr == ch3_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch3_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[3] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch3_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[3] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[3]=1;
			end
		end
		if(tx.raddr == ch4_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch4_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[4] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch4_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[4] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[4]=1;
			end
		end
		if(tx.raddr == ch5_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch5_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[5] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch5_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[5] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[5]=1;
			end
		end
		if(tx.raddr == ch6_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch6_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[6] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch6_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[6] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[6]=1;
			end
		end
		if(tx.raddr == ch7_rd_start_addr) begin
			for(int i=0; i<=tx.rlen; i++) begin
				for(int j=0; j<2**tx.rsize; j++) begin
					ch7_rd_bufferQ.push_back(tx.rdataQ[i][7:0]);
					tx.rdataQ[i]>>=8;
				end
			end
			ch_total_rd_size[7] = (tx.rlen+1)*(2**(tx.rsize));
			rd_burst_max_size = dma_rm.ch7_static_reg0_i.rd_burst_max_size.value;
			if(ch_total_rd_size[7] == rd_burst_max_size) begin
				ch_rd_txs_completed_f[7]=1;
			end
		end
	end

	//write
	if(tx.tx_type==1) begin
		if(tx.waddr == ch0_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch0_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[0] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch0_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[0] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[0]=1;
			end	
		end
		if(tx.waddr == ch1_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch1_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[1] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch1_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[1] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[1]=1;
			end	
		end
		if(tx.waddr == ch2_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch2_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[2] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch2_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[2] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[2]=1;
			end	
		end
		if(tx.waddr == ch3_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch3_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[3] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch3_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[3] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[3]=1;
			end	
		end
		if(tx.waddr == ch4_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch4_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[4] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch4_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[4] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[4]=1;
			end	
		end
		if(tx.waddr == ch5_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch5_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[5] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch5_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[5] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[5]=1;
			end	
		end
		if(tx.waddr == ch6_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch6_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[6] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch6_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[6] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[6]=1;
			end	
		end
		if(tx.waddr == ch7_wr_start_addr) begin
			for(int i=0; i<=tx.wlen; i++) begin
				for(int j=0; j<2**tx.wsize; j++) begin
					ch7_wr_bufferQ.push_back(tx.wdataQ[i][7:0]);
					tx.wdataQ[i]>>=8;
				end
			end
			ch_total_wr_size[7] = (tx.wlen+1)*(2**(tx.wsize));
			wr_burst_max_size = dma_rm.ch7_static_reg1_i.wr_burst_max_size.value;
			if(ch_total_wr_size[7] == wr_burst_max_size) begin
				ch_wr_txs_completed_f[7]=1;
			end	
		end
	end
	
endfunction

task run_phase(uvm_phase phase);
	uvm_resource_db#(dma_ctrl_reg_block)::read_by_name("GLOBAL", "DMA_RM", dma_rm, this);
	fork
		begin
			forever begin
				wait(ch_rd_txs_completed_f[0] && ch_wr_txs_completed_f[0]);
				ch_wr_txs_completed_f[0]=0;
				ch_rd_txs_completed_f[0]=0;
				if(ch0_wr_bufferQ == ch0_rd_bufferQ) begin 
					matched++;
					`uvm_info(get_name,"=====> Channel 0 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 0: wr_data and rd_data MISMATCHED")
				end
			end
		end
		begin
			forever begin
				wait(ch_rd_txs_completed_f[1] && ch_wr_txs_completed_f[1]);
				ch_wr_txs_completed_f[1]=0;
				ch_rd_txs_completed_f[1]=0;
				if(ch1_wr_bufferQ == ch1_rd_bufferQ) begin
					matched++; 
					`uvm_info(get_name,"=====> Channel 1 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 1: wr_data and rd_data MISMATCHED")
				end
			end
		end

		begin
			forever begin
				wait(ch_rd_txs_completed_f[2] && ch_wr_txs_completed_f[2]);
				ch_wr_txs_completed_f[2]=0;
				ch_rd_txs_completed_f[2]=0;
				if(ch2_wr_bufferQ == ch2_rd_bufferQ) begin
					matched++; 
					`uvm_info(get_name,"=====> Channel 1 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 2: wr_data and rd_data MISMATCHED")
				end
			end
		end
				
		begin
			forever begin
				wait(ch_rd_txs_completed_f[3] && ch_wr_txs_completed_f[3]);
				ch_wr_txs_completed_f[3]=0;
				ch_rd_txs_completed_f[3]=0;
				if(ch3_wr_bufferQ == ch3_rd_bufferQ) begin
					matched++; 
					`uvm_info(get_name,"=====> Channel 1 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 3: wr_data and rd_data MISMATCHED")
				end
			end
		end
				
		begin
			forever begin
				wait(ch_rd_txs_completed_f[4] && ch_wr_txs_completed_f[4]);
				ch_wr_txs_completed_f[4]=0;
				ch_rd_txs_completed_f[4]=0;
				if(ch4_wr_bufferQ == ch4_rd_bufferQ) begin
					matched++; 
					`uvm_info(get_name,"=====> Channel 1 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 4: wr_data and rd_data MISMATCHED")
				end
			end
		end

		begin
			forever begin
				wait(ch_rd_txs_completed_f[5] && ch_wr_txs_completed_f[5]);
				ch_wr_txs_completed_f[5]=0;
				ch_rd_txs_completed_f[5]=0;
				if(ch5_wr_bufferQ == ch5_rd_bufferQ) begin
					matched++; 
					`uvm_info(get_name,"=====> Channel 1 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 5: wr_data and rd_data MISMATCHED")
				end
			end
		end
				
		begin
			forever begin
				wait(ch_rd_txs_completed_f[6] && ch_wr_txs_completed_f[6]);
				ch_wr_txs_completed_f[6]=0;
				ch_rd_txs_completed_f[6]=0;
				if(ch6_wr_bufferQ == ch6_rd_bufferQ) begin
					matched++; 
					`uvm_info(get_name,"=====> Channel 6 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 6: wr_data and rd_data MISMATCHED")
				end
			end
		end
				
		begin
			forever begin
				wait(ch_rd_txs_completed_f[7] && ch_wr_txs_completed_f[7]);
				ch_wr_txs_completed_f[7]=0;
				ch_rd_txs_completed_f[7]=0;
				if(ch7_wr_bufferQ == ch7_rd_bufferQ) begin
					matched++; 
					`uvm_info(get_name,"=====> Channel 7 data matched",UVM_LOW) 
				end
				else begin
					mismatched++;
					`uvm_error(get_full_name(),"Channel 7: wr_data and rd_data MISMATCHED")
				end
			end
		end
	join
endtask


function void extract_phase(uvm_phase phase);
	super.extract_phase(phase);
	uvm_resource_db#(int)::read_by_name("GLOBAL", "reg_mismatches", mismatched, this);
endfunction

function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	if(mismatched == 0) begin
		`uvm_info(get_name(),"############################################		TEST PASSED		################################################",UVM_NONE)
	end
	else begin 
		`uvm_error(get_name(),"############################################		TEST FAILED		################################################")
	end
endfunction
endclass





