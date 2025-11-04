//16.	generate random number between 100, 200, which is a multiple of 5

  class packet;
    rand int a;
    
    constraint c1 { 
      a inside {[100:200]};
      a%5 == 0;
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
