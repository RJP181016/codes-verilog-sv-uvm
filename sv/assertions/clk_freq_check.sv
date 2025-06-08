parameter FREQ=10;
parameter DELAY=50;
module top;
logic clk;

initial begin
clk=0;
forever #DELAY clk=~clk;
end

initial begin

#1000;
$finish;
end

property freq_check_p;
	time prev_time;
	@(posedge clk) (1,prev_time=$time) |=> (1000/($time-prev_time) == FREQ);
endproperty
assert property(freq_check_p);

endmodule
