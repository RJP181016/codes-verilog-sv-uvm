//6.	Write a constraint for 16bit addr which should contain 9th bit as 1 but should not have constitutive 1



  class packet;
    rand bit [15:0] addr;

    constraint c1 { 
      addr[8] == 1;
      foreach(addr[i]) {
        if(i<15) {
          !(addr[i] && addr[i+1]);
        }
      }
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
