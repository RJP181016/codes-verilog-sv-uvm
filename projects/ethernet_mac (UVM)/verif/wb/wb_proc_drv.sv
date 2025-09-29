class wb_proc_drv extends uvm_driver #(wb_tx); 
    `uvm_component_utils(wb_proc_drv); 
    `NEW_COMP

    virtual wb_proc_intf vif; 
    wb_tx tx;

    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
        if (!uvm_resource_db#(virtual wb_proc_intf)::read_by_name("GLOBAL", "PROC_VIF", vif, this)) begin
            `uvm_error("wb_proc_drv", "Failed to capture PROC_VIF virtual interface from resource database.")
        end
    endfunction 

    task run_phase(uvm_phase phase); 
		fork
    	    forever begin 
    	        seq_item_port.get_next_item(req); 
    	        //req.print(); 
    	        drive_tx(req);
    	        seq_item_port.item_done();
    	    end
			forever begin
				@(posedge vif.int_o);
				ethmac_common::int_o_generated = 1;
				ethmac_common::int_o_generated_sbd = 1;
			end
		join
    endtask 

    task drive_tx(wb_tx tx);
        @(posedge vif.wb_clk_i);
        vif.wb_adr_i = tx.addr; 
        vif.wb_we_i = tx.wr_rd; 
        if(tx.wr_rd == 1) vif.wb_dat_i = tx.data; 
        vif.wb_sel_i = 4'hF; 
        vif.wb_cyc_i = 1'b1; 
        vif.wb_stb_i = 1'b1; 
        wait(vif.wb_ack_o == 1 ); 
        if(tx.wr_rd == 0) tx.data = vif.wb_dat_o;
		//`uvm_info("reg_test", $psprintf("%s : addr=%h, data=%h",tx.wr_rd ? "WRITE":"READ",tx.addr,tx.data),UVM_LOW);
        @(posedge vif.wb_clk_i);
        reset_signals();
    endtask

	task reset_signals();
        vif.wb_adr_i = 0; 
        vif.wb_we_i = 0; 
        vif.wb_dat_i = 0; 
        vif.wb_sel_i = 0; 
        vif.wb_cyc_i = 0; 
        vif.wb_stb_i = 0;
	endtask
endclass



