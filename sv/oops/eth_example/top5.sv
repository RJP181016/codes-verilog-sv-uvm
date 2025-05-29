`include "eth_pkt5.sv"
`include "eth_good_pkt5.sv"
module top;
eth_good_pkt pkt=new();
initial begin
assert(pkt.randomize());
pkt.print("pkt");
end
endmodule
