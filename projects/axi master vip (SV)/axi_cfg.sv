class axi_cfg;
    static mailbox gen2bfm = new();
    static mailbox bfm2gen = new();
    static mailbox mon2cov = new();
    static string testname;
    static bit testread_f = 0;
    static virtual axi_intf vif;
endclass
