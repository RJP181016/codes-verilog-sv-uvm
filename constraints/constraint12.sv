//12.	Generate a random number between -5 to -15 using system tasks.

  class packet;
    rand int a;

    constraint c1 { 
      a == $urandom_range(-5,-15);
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
