class sample;
rand int a,b,c,d;

constraint ex_c {
	a inside {[10:20]};
	b inside {[10:20]};
	c inside {[10:20]};
	d inside {[10:20]};
	unique{a,b,c,d};
}

endclass 


module top;
sample s=new();

initial begin
repeat(10)begin	
	assert(s.randomize());
	$display("s=%p",s);
end
end



endmodule
