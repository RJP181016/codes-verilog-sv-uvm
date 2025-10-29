//7.	Write a constraint for 16bit addr to generate power of 2.


  class packet;
    rand bit [15:0] addr;

    constraint c1 { 
      $onehot(addr);
      //$countones(addr) == 1;
      //addr != 0;
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("pkt = %p: addr = %b",pkt,pkt.addr);
      end
    end
  endmodule
