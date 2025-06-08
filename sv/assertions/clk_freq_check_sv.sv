parameter FREQ=10;
parameter DELAY=50;
module top;
logic clk;
int freq;
time prev_time;

initial begin
clk=0;
forever #DELAY clk=~clk;
end

initial begin
#1000;
$finish;
end

always@(posedge clk) begin
freq=1000/($time-prev_time);
if(freq!=FREQ) $display("%t: error",$time);
else $display("%t",$time);
prev_time=$time;
end

endmodule
