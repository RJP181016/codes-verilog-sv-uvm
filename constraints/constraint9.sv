//9.	Write a constraint without an inside function to generate variable value within the range of 34 to 43?

  class packet;
    rand bit [7:0] a;

    constraint c1 { 
      a >= 34;
      a <= 43;
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
