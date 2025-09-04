class axi_env;
    axi_bfm bfm = new();
    axi_gen gen = new();
    axi_mon mon = new();
    axi_cov cov = new();

    task run();
        $display("axi_env :: run");
        fork
            bfm.run();
            gen.run();
            mon.run();
            cov.run();
        join
    endtask
endclass
