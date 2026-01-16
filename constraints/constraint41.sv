//41.	Write a constraint to generate a pattern 01020304050
//	a.	Declare an array
//	b.	For even index of array, fill 0’s
//	c.	Odd index use the i+1/2 relation in foreach loop


  class packet;
    rand int a[];

    constraint c1 {
      a.size() == 11;
      foreach(a[i]) {
        a[i] inside {[0:5]};
        if(i%2 == 0) a[i] == 0;
        if(i%2 == 1) a[i] == (i+1)/2;
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


