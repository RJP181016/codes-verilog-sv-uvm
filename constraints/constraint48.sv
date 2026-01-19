//48.	Declare 2 array (or queue) elements each of size 10, randomize in such a way that 2nd array values are 1st array value added with 5 for each element.

  class packet;
    rand int a[];
    rand int b[];

    constraint c1 {
      a.size() == 10;
      b.size() == 10;
      foreach(a[i]) a[i] inside {[1:20]};
      foreach(b[i]) {
        b[i] inside {[1:20]};
        b[i] == a[i] + 5;
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


