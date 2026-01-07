//25.	Write a constraint to generate a queue of random size with unique value, and value at index with odd values are even and for index with even value having odd values stored in them, also size of queue can be even value between 10 and 16.

  class packet;
    rand int a[$];
    
    constraint c1 { 
      unique{a};
      foreach(a[i])
        if(i%2 == 0)
          a[i]%2 == 1;
      	else
          a[i]%2 == 0;
      foreach(a[i]) a[i] inside {[0:100]};
      a.size() inside {[10:16]};
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("pkt = %p",pkt);
      end
    end
  endmodule


