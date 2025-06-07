class sample;
rand int a;

constraint range_c {
	//a inside {[5:10]};
	a>=5;a<=10;
}

endclass 


module top;
sample s=new();

initial begin
	assert(s.randomize());
	$display("s=%p",s);
end



endmodule
