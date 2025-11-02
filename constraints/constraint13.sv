//13.	Generate a,b,c,d in such a way that all of them take unique values, but all of them inside 10 to 20 only.

  class packet;
    rand int a,b,c,d;

    constraint c1 { 
      a inside {[10:20]};
      b inside {[10:20]};
      c inside {[10:20]};
      d inside {[10:20]};
      unique{a,b,c,d};
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
