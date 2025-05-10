int count=40;

class sample;
static int count=30;
endclass

module top();
int count=20;
sample s;

initial begin: L1
	int count=10;
	$display("count=%0d",count);
	$display("count=%0d",top.count);
	$display("count=%0d",s.count);
	$display("count=%0d",$unit::count);
end

endmodule
