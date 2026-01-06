//17.	Populate a queue with 10 elements, each element inside 100 to 200 and must also be a multiple of 5.

  class packet;
    rand int a[$];
    
    constraint c1 { 
      a.size() == 10;
      foreach(a[i]) {
        a[i] inside {[100:200]};
        a[i]%5 == 0;
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