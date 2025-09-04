program axi_tb();
    axi_env env = new();
    initial begin
        wait(axi_cfg::testread_f == 1);
        env.run(); //to start the env run method //Process#2
    end
endprogram
