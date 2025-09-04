`include "mem_env_pkg.pkg"
program mem_program(memory_if pif);

import uvm_pkg::*;
import mem_env_pkg::*;

`include "base_test.sv"
`include "mem_test1.sv"
`include "ral_test.sv"

initial begin
  $timeformat(-9, 1, "ns", 10);

  uvm_config_db#(virtual memory_if.tb)::set(null,"uvm_test_top","master_if",pif.tb);
  uvm_config_db#(virtual memory_if.tb_mon_in)::set(null,"uvm_test_top","mon_in",pif.tb_mon_in);
  uvm_config_db#(virtual memory_if.tb_mon_out)::set(null,"uvm_test_top","mon_out",pif.tb_mon_out);

  run_test();

end

endprogram
