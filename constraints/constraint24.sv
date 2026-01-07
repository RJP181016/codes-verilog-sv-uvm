//24.	Write a constraint to generate a queue of random size with unique value, and each value being divisible by 3 and 7 both, also size of queue can be 15 at maximum and minimum of 5. range 0 to 200


  class packet;
    rand int a[$];
    
    constraint c1 { 
      unique{a};
      foreach(a[i]) a[i]%21 == 0;
      foreach(a[i]) a[i] inside {[0:200]};
      a.size() inside {[5:15]};
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


