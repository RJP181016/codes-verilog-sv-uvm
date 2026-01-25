//50.	Add “size” number of entries to a queue. The entry of queue is randomized between 0 to “size”

  class packet;
    rand int q[$];
    
    constraint c1 {
      q.size() == 8;
      foreach(q[i]) q[i] inside {[0:q.size()]};
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
