module fa(clk,a,b,c_in,s,c_out);
input clk;
input [1:0]a,b;
input c_in;
output reg [1:0]s;
output reg c_out;

reg [1:0] s1;
reg c_out1;
reg [1:0] s2;
reg c_out2;

assign {c_out2,s2}=a+b+c_in;

always@(posedge clk) begin
	s1<=s2;
	s<=s1;
end
always@(posedge clk) begin
	c_out1<=c_out2;
	c_out<=c_out1;
end

endmodule

module top;
reg clk;
reg [1:0]a,b;
reg c_in;
wire [1:0]s;
wire c_out;

fa dut(clk,a,b,c_in,s,c_out);

initial begin
	clk=0;
	forever #5 clk=~clk;
end

initial begin
	repeat(10) begin
		@(posedge clk);
		{a,b,c_in}=$random;
	end
	$finish;
end

property fa_p;
	reg [1:0] a1,b1;
	reg c_in1;
	@(posedge clk) (1,a1=a,b1=b,c_in1=c_in) |-> ##2 ({c_out,s}==a1+b1+c_in1);
endproperty
assert property(fa_p);

endmodule
