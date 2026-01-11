//34.	Given a 16-bit address field as a class member, write a constraint to generate a random value such that it always has 9bits as 1 and 111 or 000 sequences should not occur in that address.

  class packet;
    rand bit [15:0] addr;

    constraint c1 {
      $countones(addr) == 9;
      foreach(addr[i]) {
        if(i<14) {addr[i],addr[i+1],addr[i+2]} != 3'b111;
        if(i<14) {addr[i],addr[i+1],addr[i+2]} != 3'b000;
      }
    }
  endclass

  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("addr = %b",pkt.addr);
      end
    end
  endmodule


