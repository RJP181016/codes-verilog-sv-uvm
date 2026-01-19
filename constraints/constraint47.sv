//47.	Generate a random string whose name is between “pkt1” to “pkt20”

  class packet;
    rand int a;

    constraint c1 {
      a inside {[1:20]};
    }
    
  endclass

  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("pkt name = %s",$sformatf("pkt%0d", pkt.a));
      end
    end
  endmodule


