//1. Write a constraint for the below scenario if A<20 then b value should generate 10 to 30 and if a>20 then the B value should be 30 to 50 only


class packet;
  rand bit [4:0] a;
  rand int b;
  
  constraint ab_c { 
    if(a<20) 
      b inside {[10:30]}; 
    else if(a>20) 
      b inside {[30:50]};            
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
