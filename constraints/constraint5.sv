//5.	Write a constraint for 16-bit addr which should contain 9th bit as 1


  class packet;
    rand bit [15:0] addr;

    constraint c1 { 
      addr[8] == 1;
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("pkt = %p: addr = %b",pkt,pkt.addr);
      end
    end
  endmodule
