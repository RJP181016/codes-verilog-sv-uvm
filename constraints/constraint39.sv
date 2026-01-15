//39.	Write constraint on an array to generate values in ascending order.

  class packet;
    rand bit [7:0] a[];

    constraint c1 {
      a.size() == 10;
      foreach(a[i])
        if(i>0) a[i] > a[i-1];
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


