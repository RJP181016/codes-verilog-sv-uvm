//30.	Write constraint for randomly generating an array of numbers with size 20, sort in ascending order without using inbuilt sort method, and sum of all array elements should be 300.

  class packet;
    rand int unsigned a[];
    
    constraint c1 {
      a.size() == 20;
      a.sum() == 300;
      foreach(a[i]) {
        if(i!=19) a[i+1] > a[i]; 
        a[i] inside {[0:1000]};
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


