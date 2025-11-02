//14.	Soft constraint using eth_pkt where constraint len is 42 to 1500 and inline constraint with 2000 len.

  class packet;
    rand int len;

    constraint c1 { 
      soft len inside {[42:1500]};
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize with {pkt.len==2000;};
        $display("pkt = %p",pkt);
      end
    end
  endmodule
