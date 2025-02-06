module top();
reg clk, rst;
reg d;
wire q;

dff dut(clk,rst,d,q);

always #5 clk = ~clk;

initial begin
	clk=0;
	d=0;
	rst=1;
	#1;
	rst=0;
	repeat(10) begin
		d=$urandom_range(0,1);
		$display($time,": d=%b, q=%b",d,q);
		#($urandom_range(5,7));
	end	
	#10;
	$finish;
end
endmodule

