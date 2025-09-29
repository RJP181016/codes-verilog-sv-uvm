interface periph_intf(input clk,reset);
	bit [31:1]   periph_tx_req;
   	bit [31:1]   periph_tx_clr;
   	bit [31:1]   periph_rx_req;
   	bit [31:1]   periph_rx_clr;

	clocking master_cb@(posedge clk);
		default input #0 output #1;
		input    periph_tx_req;
  		output   periph_tx_clr;
   		input    periph_rx_req;
   		output   periph_rx_clr;
	endclocking

	clocking mon_cb@(posedge clk);
		default input #0;
		input    periph_tx_req;
  		input   periph_tx_clr;
   		input    periph_rx_req;
   		input   periph_rx_clr;
	endclocking
modport master_mp(clocking master_cb);
modport mon_mp(clocking mon_cb);


endinterface
