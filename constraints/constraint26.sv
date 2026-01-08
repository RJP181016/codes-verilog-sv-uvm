//26.	The constraint for an array of 10 elements in which the first 5 elements are in increment in nature and the next 5 elements are in decrement nature.
//	a.	All elements in range of 50 to 100.
//	b.	All elements should be multiple of 5


  class packet;
    rand int a[10];
    
    constraint c1 { 
      foreach(a[i]) {
        if(i < 5) a[i] < a[i+1];
        if((i > 4) & (i!=9)) a[i] > a[i+1];
        a[i] inside {[50:100]};
        a[i]%5 ==0;
      }
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


