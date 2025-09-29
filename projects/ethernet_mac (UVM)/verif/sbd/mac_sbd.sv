`uvm_analysis_imp_decl(_proc)
`uvm_analysis_imp_decl(_mem)
`uvm_analysis_imp_decl(_tx)
`uvm_analysis_imp_decl(_rx)

class mac_sbd extends uvm_scoreboard;
uvm_analysis_imp_proc#(wb_tx,mac_sbd) imp_proc;
uvm_analysis_imp_mem#(wb_tx,mac_sbd) imp_mem;
uvm_analysis_imp_tx#(eth_frame,mac_sbd) imp_tx;
uvm_analysis_imp_rx#(eth_frame,mac_sbd) imp_rx;
`uvm_component_utils(mac_sbd)
`NEW_COMP

eth_frame rx_frame;
eth_frame tx_frame;
byte memwrdataQ[$];
byte memrddataQ[$];

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	imp_proc=new("imp_proc",this);
	imp_mem=new("imp_mem",this);
	imp_tx=new("imp_tx",this);
	imp_rx=new("imp_rx",this);
endfunction

function void write_proc(wb_tx tx);
	//tx.print();	
endfunction

function void write_mem(wb_tx tx);
	//tx.print();	
	if(tx.wr_rd==1) begin
		memwrdataQ.push_back(tx.data[31:24]);
		memwrdataQ.push_back(tx.data[23:16]);
		memwrdataQ.push_back(tx.data[15:8]);
		memwrdataQ.push_back(tx.data[7:0]);
	end
	else begin
		memrddataQ.push_back(tx.data[31:24]);
		memrddataQ.push_back(tx.data[23:16]);
		memrddataQ.push_back(tx.data[15:8]);
		memrddataQ.push_back(tx.data[7:0]);
	end
endfunction

function void write_tx(eth_frame frame);
	//frame.print();	
	$cast(tx_frame,frame);
endfunction

function void write_rx(eth_frame frame);
	//frame.print();	
	$cast(rx_frame,frame);
endfunction

task run_phase(uvm_phase phase);
	forever begin
		wait(ethmac_common::int_o_generated_sbd == 1'b1 && (tx_frame != null && memrddataQ.size()>1) || (rx_frame != null && memwrdataQ.size()>1));
		ethmac_common::int_o_generated_sbd=0;
		if(tx_frame != null) begin
			foreach(tx_frame.payload[i]) begin
				if(tx_frame.payload[i] == memrddataQ[i]) begin
					ethmac_common::matched++;
				end
				else begin
					`uvm_error(get_name(),$psprintf("transmit data mismatch: mem_rd_data=%h, frame_data=%h",memrddataQ[i],tx_frame.payload[i]));
					ethmac_common::mismatched++;
				end
			end
			tx_frame = null;
			memrddataQ.delete();
		end
		if(rx_frame != null) begin
			foreach(rx_frame.payload[i]) begin
				if(rx_frame.payload[i] == memwrdataQ[i]) begin
					ethmac_common::matched++;
				end
				else begin
					`uvm_error(get_name(),$psprintf("recieve data mismatch: mem_wr_data=%h, frame_data=%h",memwrdataQ[i],rx_frame.payload[i]));
					ethmac_common::mismatched++;
				end
			end
			rx_frame = null;
			memwrdataQ.delete();
		end
	end
endtask

function void report_phase(uvm_phase phase);
	super.report_phase(phase);
	if(ethmac_common::mismatched==0) `uvm_info(get_name(),$psprintf("TEST PASSED: matched=%d, mismatched=%d",ethmac_common::matched,ethmac_common::mismatched),UVM_NONE)	
	else `uvm_info(get_name(),$psprintf("TEST FAILED: matched=%d, mismatched=%d",ethmac_common::matched,ethmac_common::mismatched),UVM_NONE)
endfunction
endclass
