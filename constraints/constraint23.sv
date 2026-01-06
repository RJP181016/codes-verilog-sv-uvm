//23.	Write a constraint to generate a queue of random size with unique value, and each value being a power of 2, also size of queue can be 12 at maximum and minimum of 6.

  class packet;
    rand int a[$];
    
    constraint c1 { 
      unique{a};
      a.size() inside {[6:12]};
      foreach(a[i]) $onehot(a[i]); 
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        foreach(pkt.a[i]) $display("pkt.a[%0d] = %b",i,pkt.a[i]);
      end
    end
  endmodule


