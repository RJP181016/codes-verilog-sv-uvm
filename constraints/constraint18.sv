//18.	randomize only one variable in a class
//	a.	use rand_mode(0) to disable
//	b.	randomize(variable_to_randomize)
//	c.	We can print rand_mode() of variable also using $display

  class packet;
    rand int a;
    rand int b;
    
    constraint c1 { 
        a inside {[10:20]};
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      pkt.a = 1;
      pkt.b = 2;
      repeat(10) begin
        pkt.b.rand_mode(0);
        pkt.randomize();
        $display("pkt = %p",pkt);
        $display("pkt.a.rand_mode() = %0d",pkt.a.rand_mode());
        $display("pkt.b.rand_mode() = %0d",pkt.b.rand_mode());
      end
    end
  endmodule
