//37.	Generate unique elements in an array without using the keyword unique.

  class packet;
    rand bit [7:0] a[];

    constraint c1 {
      a.size() == 10;
      foreach(a[i])
        foreach(a[j]) if(i != j) a[i] != a[j];
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


