class disable_report_summary extends uvm_default_report_server;
    function void report_summarize(UVM_FILE file=0);
	`uvm_info("REPORT","Disabled UVM summary",UVM_NONE)
    endfunction

endclass

