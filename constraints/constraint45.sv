//45.	Write constraint to fill array with value in ascending order

  class packet;
    rand int a[10];

    constraint c1 {
      foreach(a[i]) {
        a[i] inside {[0:99]};
        if(i>0) a[i] > a[i-1];
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


