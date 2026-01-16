//42.	Factorial of first 5 even numbers using constraints
//	a.	Write a function to calculate factorial

  class packet;
    rand int a[];
    rand int f[];

    constraint c1 {
      a.size() == 5;
      foreach(a[i])
        a[i] == (i+1)*2;
    }
    
    constraint c2 {
      f.size() == 5;
      foreach(f[i]) f[i] == factorial_calc(a[i]);
    }
        
    function automatic int factorial_calc(input int n);
      if (n <= 1) return 1;
      else return n * factorial_calc(n - 1);
    endfunction
      
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


