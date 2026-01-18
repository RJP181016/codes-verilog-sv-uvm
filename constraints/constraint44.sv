//44.	Write constraint to generate pattern 9-7-5-3-1-8-6-4-2-0

  class packet;
    rand int a[];

    constraint c1 {
      a.size() == 10;
      foreach(a[i]) {
        if(i<5) a[i] == 9-(i*2);
        if(i>=5) a[i] == 18-(i*2);
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


