class sample;
rand int a;

constraint range_c {
	a dist {[5:10]:/5,[-15:-5]:/10};
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
