//29.	Write a constraint for an array of numbers such that the size of array ranges from 16 to 32 elements, and even index locations should have odd numbers and odd index locations should have even numbers, numbers rage is between 16 to 127

  class packet;
    rand int a[];
    
    constraint c1 {
      a.size() inside {[16:32]};
      foreach(a[i]) {
        if(i%2 == 0) a[i]%2 == 1;
        if(i%2 == 1) a[i]%2 == 0;
        a[i] inside {[16:127]};
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


