//46.	Write constraints to randomize only specific bit of a bit vector, others are all 0’s

  class packet;
    rand bit [7:0] a;

    constraint c1 {
      foreach(a[i])
        if(i!=3) a[i] == 1'b0;
    }
    
  endclass

  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("pkt = %p, a = %b",pkt, pkt.a);
      end
    end
  endmodule


