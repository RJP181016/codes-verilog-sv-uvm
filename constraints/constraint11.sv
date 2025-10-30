//11.	Declare a Queue, Fill with 20 random values between 200 to 300, no repetition

  class packet;
    rand int a[$];

    constraint c1 { 
      a.size() == 20;
      foreach(a[i]) {
        a[i] inside {[200:300]};
      }
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
