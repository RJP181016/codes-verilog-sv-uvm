//10. Multi bit vector, generate value with only one bit in vector being ‘1’


  class packet;
    rand bit [7:0] a;

    constraint c1 { 
      $onehot(a);
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
