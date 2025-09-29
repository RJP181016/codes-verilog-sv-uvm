class memory extends uvm_component;
`uvm_component_utils(memory);
`NEW_COMP

bit [31:0] mem[int];
virtual wb_mem_intf vif;


function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_resource_db#(virtual wb_mem_intf)::read_by_name("GLOBAL", "MEM_VIF", vif, this );
endfunction

function void start_of_simulation_phase(uvm_phase phase);
	//pre-load the mem
	for (int i=0; i<512/4; i++) begin
		mem[32'h1000_0000+ 4*i] = $random;
	end
endfunction

task run_phase(uvm_phase phase);
	forever begin
		@(vif.slave_cb);
		if(vif.slave_cb.m_wb_cyc_o && vif.slave_cb.m_wb_stb_o) begin
			vif.slave_cb.m_wb_ack_i <= 1'b1;
			if(vif.slave_cb.m_wb_we_o == 1'b1) begin
				mem[vif.slave_cb.m_wb_adr_o] = vif.slave_cb.m_wb_dat_o;
			end
			else begin
				vif.slave_cb.m_wb_dat_i <= mem[vif.slave_cb.m_wb_adr_o];
			end
		end
		else begin
			vif.slave_cb.m_wb_ack_i <= 1'b0;
			vif.slave_cb.m_wb_dat_i <= 0;
		end
	end
endtask
endclass
