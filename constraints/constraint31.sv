//31.	write the constraint to gen. this seq. 0 1 0 2 0 3 0 4 0 5 0  6  0  7  0  8  0  9  0 1 0 2 0 3 0 4 0 5 ... in array the same for a vector variable. 	
// 			a.	0 0 1 0 0 2 0 0 3 0 0 4 …. 0 0 9 0 0 1 0 0 2…


  class packet;
    rand int a[];
    
   /* constraint c1 {
      a.size() == 18;
      foreach(a[i]) {
        if(i%2 == 0) a[i] == 0; 
        else a[i] == (i+1)/2;
      }
    } */
    constraint c2 {
      a.size() == 27;
      foreach(a[i]) {
        if((i+1)%3 == 0) a[i] == (i+1)/3; 
        else a[i] == 0;
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


