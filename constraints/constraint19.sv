//19.	random number between 5 to 10 with weight of 5, -5 to -15 with weight of 10

  class packet;
    rand int a;
    
    constraint c1 { 
      a dist {[5:10] :/ 5, [-15:-5] :/ 10};
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(50) begin
        pkt.randomize();
        $display("pkt = %p",pkt);
      end
    end
  endmodule
