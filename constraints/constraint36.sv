//36.	Without using randomization or rand keyword, generates array of random values.

  module top;  
    int a;
    
    initial begin
      repeat(10) begin
        a = $urandom_range(0,99);
        $display("a = %0d",a);
      end
    end
  endmodule


