module top;
logic clk;
logic ready,valid;
logic wt_rd;
logic [31:0] wdata,rdata;
initial begin
clk=0;
forever #5 clk=~clk;
end

property wt_p;
	@(posedge clk) (valid==1) ##0 (wt_rd==1) |-> (~$isunknown(wdata));
endproperty
property rd_p;
	logic wt_rd_t;
	//@(posedge clk) (valid==1,wt_rd_t=wt_rd) ##1 (wt_rd_t==0) |=> (~$isunknown(rdata));
	@(posedge clk) (valid==1) ##0 (wt_rd==0) |=> (~$isunknown(rdata));
endproperty
p1: assert property(wt_p);
p2: assert property(rd_p);

initial begin
repeat(20) begin
	valid=1;
	wt_rd=$random;
	#1;
	@(posedge clk);
	#1;
	wdata=($random%2)?$random:32'hz;
	rdata=($random%2)?$random:32'hz;
end
$finish;
end

endmodule


