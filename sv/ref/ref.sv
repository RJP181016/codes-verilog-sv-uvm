function void double_value(ref int num);
  num *= 2;
endfunction

module test;
  initial begin
    int x = 4;
    double_value(x);
    $display("\nDoubled value: %d\n", x);
  end
endmodule
