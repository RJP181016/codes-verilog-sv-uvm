interface mii_intf; 
    bit md_pad_i;   // MII data bit (from I/O cell)
	bit mdc_pad_o;  // MII Management data clock (to PHY)//input to PHY and output to DUT
	bit md_pad_o;   // MII data bit (to I/O cell)
	bit md_padoe_o; // MII data bit enable (to I/O cell)
	endinterface
