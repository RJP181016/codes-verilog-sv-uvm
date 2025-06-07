class sample;
string name;
rand int num;

constraint C1_c {
	num inside {[1:20]};
}

function void post_randomize();
	$sformat(name,"pkt%0d",num);
endfunction

endclass 


module top;
sample s=new();

initial begin
repeat(10) begin
	assert(s.randomize());
	$display("s.name=%s",s.name);
end
end



endmodule


