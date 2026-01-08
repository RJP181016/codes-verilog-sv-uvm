//27.	Write a constraint to store odd data in even addr and even data in odd addr.


  class packet;
    rand bit [31:0] addr;
    rand int data;
    
    constraint c1 { 
      if(addr%2 == 0) data%2 == 1;
      if(addr%2 == 1) data%2 == 0;
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


