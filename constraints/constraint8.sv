//8.	Write a constraint for APB slave select signal?



  class packet;
    rand bit [3:0] asel;

    constraint c1 { 
      $onehot(asel);
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("pkt = %p: asel = %b",pkt,pkt.asel);
      end
    end
  endmodule
