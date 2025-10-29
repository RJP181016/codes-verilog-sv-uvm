//4. Constraints to have Unique elements in an Array with Size in {5 - 10}


  class packet;
    rand bit [3:0] a [];

    constraint c1 { 
      a.size inside {[5:10]};
      unique{a};
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
