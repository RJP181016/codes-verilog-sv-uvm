class fa_tb;
randc bit [3:0] a;
randc bit [3:0] b;
rand bit cin;

function void print();
	$display("a=%0d",a);
	$display("b=%0d",b);
	$display("cin=%0d\n",cin);
endfunction

endclass



module top;
fa_tb fa=new();

initial begin
repeat(10) begin 
	assert(fa.randomize());
	fa.print();
end

end
endmodule
