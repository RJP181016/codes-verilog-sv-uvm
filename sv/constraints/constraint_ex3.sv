class sample;
rand int a;
real b;

constraint range_c {
	a inside {[-235:432]};
}

function void post_randomize();
	b=a/100.0;
endfunction

endclass 


module top;
sample s=new();

initial begin
repeat(10)begin	
	assert(s.randomize());
	$display("s.b=%f",s.b);
end
end



endmodule
