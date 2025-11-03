//15.	Explain Inline constraints using packet type and payload length example.
typedef enum {
  pkt_type_A,
  pkt_type_B,
  pkt_type_C
} pkt_type_e;

  class packet;
    rand pkt_type_e pkt_type;
    rand int payload[];
    
    constraint c1 { 
      payload.size() inside {[1:512]};
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize with {pkt_type == pkt_type_A; payload.size() == 2;};
        $display("pkt = %p",pkt);
      end
    end
  endmodule
