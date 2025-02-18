`include "memory.v"
module top;
parameter WIDTH=16;
parameter DEPTH=64;
parameter ADDR_WIDTH=$clog2(DEPTH);
parameter CLK_CYCLE_DELAY=5;

reg clk,rst;
reg wt_rd;
reg [ADDR_WIDTH-1:0]addr;
reg [WIDTH-1:0]wdata;
wire [WIDTH-1:0]rdata;
reg valid;
wire ready;
integer i;

memory #(.WIDTH(WIDTH), .DEPTH(DEPTH), .ADDR_WIDTH(ADDR_WIDTH)) dut(clk,rst,wt_rd,addr,wdata,rdata,valid,ready);

initial begin
	clk=0;
	forever #CLK_CYCLE_DELAY clk = ~clk;
end

initial begin
	reset_mem();
	write_mem();
	read_mem();
	#100;
	$finish;
end

task reset_mem(); begin
	rst=1;
	wt_rd=0;
	addr=0;
	wdata=0;
	valid=0;
	@(posedge clk);
	rst=0;
end
endtask

task write_mem(); begin
	for(i=0;i<DEPTH;i=i+1) begin
		@(posedge clk);
		addr=i;
		wdata=$random;
		wt_rd=1;
		valid=1;
		wait(ready==1);
	end	
		@(posedge clk);
		addr=0;
		wdata=0;
		wt_rd=0;
		valid=0;
end
endtask

task read_mem(); begin
	for(i=0;i<DEPTH;i=i+1) begin
		@(posedge clk);
		addr=i;
		wt_rd=0;
		valid=1;
		wait(ready==1);
	end	
		@(posedge clk);
		addr=0;
		wt_rd=0;
		valid=0;
end
endtask
endmodule
