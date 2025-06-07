class sample;
rand int a[$];
rand int b[$];

constraint C1_c {
	a.size()==10;
	b.size()==10;
}
constraint C2_c {
	foreach(a[i]) {
		a[i] inside {[100:200]}; 
		b[i]==a[i]+5;}
}

endclass 


module top;
sample s=new();

initial begin
	assert(s.randomize());
	$display("s=%p",s);
end



endmodule

