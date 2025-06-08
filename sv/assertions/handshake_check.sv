module top;
logic clk;
logic ready,valid;
int delay;
initial begin
clk=0;
forever #5 clk=~clk;
end

property handshake_p;
	@(posedge clk) (valid==1) |-> ##[0:4] (ready==1);
endproperty
p1: assert property(handshake_p);

initial begin
repeat(20) begin
	@(posedge clk);
	valid=1;
	delay=$urandom_range(0,5);
	repeat(delay) @(posedge clk);
	//ready=$random;
	ready=1;
	@(posedge clk);
	valid=0;
	ready=0;
end
$finish;
end

endmodule

