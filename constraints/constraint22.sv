//22. Write a constraint to generate two queues of random sizes with unique values, also total number of elements in each queue should be less than or equal to 10. Queue element values should be in range of 50 to 200.

  class packet;
    rand int a[$], b[$];
    
    constraint c1 { 
      a.size() <= 10;
      b.size() <= 10;
      foreach(a[i]) a[i] inside {[50:200]};
      foreach(b[i]) b[i] inside {[50:200]};
      unique{a,b};
      //foreach (a[i]) foreach (b[j]) a[i] != b[j];	// Unique across the two queues
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
