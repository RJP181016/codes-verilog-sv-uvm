module top;
logic clk;
logic addr,wdata,reset;

initial begin
clk=0;
forever #5 clk=~clk;
end

property reset_p;
	@(posedge clk) (reset==1) |-> (addr==0 && wdata==0);
endproperty
p1: assert property(reset_p);

initial begin
repeat(20) begin
	#1;
	@(posedge clk);
	#1;
	reset=1;
	addr=$random;
	wdata=$random;
end
$finish;
end

endmodule


