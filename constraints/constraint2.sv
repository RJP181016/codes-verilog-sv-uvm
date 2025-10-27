  //2. Write the constraint to generate the three unique numbers , without using "unique"?


  class packet;
    rand bit [3:0] a [3];

    constraint unique_c { 
      //unique {a};
      foreach(a[i])
        foreach(a[j])
          if(i!=j)
            a[i]!=a[j];
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
