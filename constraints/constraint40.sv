//40.	Write constraint on an array such that even indexed elements are even values, odd indexed are odd values.

  class packet;
    rand bit [7:0] a[];

    constraint c1 {
      a.size() == 10;
      foreach(a[i]) {
        if(i%2 == 0) a[i]%2 == 0;
        if(i%2 == 1) a[i]%2 == 1;
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


