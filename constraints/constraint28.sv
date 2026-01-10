//28.	write a constraint to generate unique even no. on even location & unique odd no. on odd location.

  class packet;
    rand bit [7:0] a[10];
    
    constraint c1 { 
      unique{a};
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


