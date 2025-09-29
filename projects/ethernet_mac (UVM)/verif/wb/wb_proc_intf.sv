interface wb_proc_intf(input wb_clk_i, wb_rst_i);  

//    bit wb_clk_i; 
//    bit wb_rst_i; // check this again

    bit [31:0] wb_dat_i;     // WISHBONE data bit
    bit [31:0] wb_dat_o;     // WISHBONE data bit
    bit        wb_err_o;     // WISHBONE error bit
    bit [11:2] wb_adr_i;     // WISHBONE address bit
    bit  [3:0] wb_sel_i;     // WISHBONE byte select bit
    bit        wb_we_i;      // WISHBONE write enable bit
    bit        wb_cyc_i;     // WISHBONE cycle bit
    bit        wb_stb_i;     // WISHBONE strobe bit
    bit        wb_ack_o;     // WISHBONE acknowledge bit
	
	bit int_o;      // Interrupt bit

clocking mon_cb@(posedge wb_clk_i);
	default input #1;
    input wb_dat_i;     // WISHBONE data bit
    input wb_dat_o;     // WISHBONE data bit
    input wb_err_o;     // WISHBONE error bit
    input wb_adr_i;     // WISHBONE address bit
    input wb_sel_i;     // WISHBONE byte select bit
    input wb_we_i;      // WISHBONE write enable bit
    input wb_cyc_i;     // WISHBONE cycle bit
    input wb_stb_i;     // WISHBONE strobe bit
    input wb_ack_o;     // WISHBONE acknowledge bit
endclocking
endinterface
