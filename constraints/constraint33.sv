//33.	Write a constraint for 10101010.. sequence


  class packet;
    rand bit a[];

    constraint c1 {
      a.size() == 10;
      foreach(a[i]) {
        if(i%2 == 0) a[i] == 1; 
        else a[i] == 0;
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


