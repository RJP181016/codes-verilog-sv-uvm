//35.	Randomize a value with even and odd values alternatively.

  class packet;
    rand int a[];

    constraint c1 {
      a.size() == 10;
      foreach(a[i]) {
        a[i] inside {[0:99]};
        if(i%2 == 0) a[i]%2 == 1;
        if(i%2 == 1) a[i]%2 == 0;
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


