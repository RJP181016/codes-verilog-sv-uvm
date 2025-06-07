class sample;
rand int a;

constraint range_c {
	a inside {[-15:-5]};
}

endclass 


module top;
sample s=new();

initial begin
	assert(s.randomize());
	$display("s=%p",s);
end



endmodule
