`include "sync_fifo.v"
module top;

parameter DEPTH=16;
parameter PTR_WIDTH=$clog2(DEPTH);
parameter DATA_WIDTH=8;
parameter CLK_CYCLE_DELAY=1;
parameter NUM_WRITES=100;
parameter NUM_READS=100;
parameter WT_DELAY_MAX=5;
parameter RD_DELAY_MAX=7;

reg clk,rst;
reg wt_en,rd_en;
reg [DATA_WIDTH-1:0]wdata;
wire [DATA_WIDTH-1:0]rdata;
wire full,empty,overflow,underflow;

wire [PTR_WIDTH-1:0] wt_pt,rd_pt;
wire wt_toggle,rd_toggle;

integer i,j,k,wt_delay,rd_delay;
reg [8*64-1:0]testname;
integer seed,overflow_count,underflow_count;

sync_fifo #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH),.PTR_WIDTH(PTR_WIDTH)) dut (clk,rst,wt_en,wdata,full,overflow,rd_en,rdata,empty,underflow);

initial begin
	clk=0;
	forever #CLK_CYCLE_DELAY clk = ~clk;
end

initial begin
	$value$plusargs("testname=%s",testname);
	$value$plusargs("seed=%d",seed);
    reset_mem();
    
    case(testname)
      "test_full": begin
        write_fifo(DEPTH);
      end
      "test_empty": begin
        write_fifo(DEPTH);
        read_fifo(DEPTH);
      end
      "test_overflow": begin
        write_fifo(DEPTH+1);
      end
      "test_underflow": begin
        write_fifo(DEPTH);
        read_fifo(DEPTH+1);
      end
	  "test_concurrent_wt_rd": begin
		fork
		begin
			for(k=0;k<NUM_WRITES;k=k+1) begin
				write_fifo(1);
				wt_delay=$urandom_range(1,WT_DELAY_MAX);
				repeat(wt_delay) @(posedge clk);
			end
		end
		begin
			for(j=0;j<NUM_READS;j=j+1) begin
				read_fifo(1);
				rd_delay=$urandom_range(1,RD_DELAY_MAX);
				repeat(rd_delay) @(posedge clk);
			end
		end
		join
	  end
    endcase
	$display("overflow_count=%0d",overflow_count);
	$display("underflow_count=%0d",underflow_count);
	#100;
	$finish;
end

task reset_mem(); begin
	rst=1;
	wt_en=0;
	rd_en=0;
	wdata=0;
	underflow_count=0;
	overflow_count=0;
	@(posedge clk);
	rst=0;
end
endtask

task write_fifo(input integer num_writes); 
integer i;
begin
	for(i=0;i<num_writes;i=i+1) begin
		@(posedge clk);
		wdata=$random(seed);
		wt_en=1;
	end	
		@(posedge clk);
		wdata=0;
		wt_en=0;
end
endtask

task read_fifo(input integer num_reads); 
integer i;
begin
	for(i=0;i<num_reads;i=i+1) begin
		@(posedge clk);
		rd_en=1;
	end	
		@(posedge clk);
		rd_en=0;
end
endtask

always@(posedge overflow) begin
	overflow_count=overflow_count+1;
end
always@(posedge underflow) begin
	underflow_count=underflow_count+1;
end
endmodule
