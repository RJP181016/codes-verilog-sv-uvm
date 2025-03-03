`include "async_fifo1.v"
module top;

parameter DEPTH=16;
parameter PTR_WIDTH=$clog2(DEPTH);
parameter DATA_WIDTH=8;

parameter WT_CLK_CYCLE_DELAY=1;
parameter RD_CLK_CYCLE_DELAY=2;
parameter WT_MAX_DELAY=5;
parameter RD_MAX_DELAY=5;
parameter NUM_WRITES=50;
parameter NUM_READS=50;

reg wt_clk,rd_clk,rst;
reg wt_en,rd_en;
reg [DATA_WIDTH-1:0]wdata;
wire [DATA_WIDTH-1:0]rdata;
wire full,empty,overflow,underflow;
integer overflow_count,underflow_count,write_count,read_count;

integer i,j,k,w_delay,r_delay;
reg [8*64-1:0]testname;
integer seed;

async_fifo #(.DATA_WIDTH(DATA_WIDTH),.DEPTH(DEPTH),.PTR_WIDTH(PTR_WIDTH)) dut (wt_clk,rd_clk,rst,wt_en,wdata,full,overflow,rd_en,rdata,empty,underflow);

//clock generation
initial begin
	wt_clk=0;
	forever #WT_CLK_CYCLE_DELAY wt_clk = ~wt_clk;
end
initial begin
	rd_clk=0;
	forever #RD_CLK_CYCLE_DELAY rd_clk = ~rd_clk;
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
				w_delay=$urandom_range(1,WT_MAX_DELAY);
				repeat(w_delay) @(posedge wt_clk);
			end
		end
		begin
			for(j=0;j<NUM_READS;j=j+1) begin
				read_fifo(1);
				r_delay=$urandom_range(1,RD_MAX_DELAY);
				repeat(r_delay) @(posedge rd_clk);
			end
		end
		join
	  end
    endcase
	$display("\noverflow_count=%0d, underflow_count=%0d",overflow_count,underflow_count);
	$display("\nwrite_count=%0d, read_count=%0d",write_count,read_count);
	#10;
	$finish;
end

//reset
task reset_mem(); begin
	rst=1;
	wt_en=0;
	rd_en=0;
	wdata=0;
	write_count=0;
	read_count=0;
	overflow_count=0;
	underflow_count=0;
	@(posedge wt_clk);
	rst=0;
end
endtask

//write
task write_fifo(input integer num_writes); 
integer i;
begin
	for(i=0;i<num_writes;i=i+1) begin
		@(posedge wt_clk);
		wdata=$random(seed);
		wt_en=1;
		write_count=write_count+1;
	end	
		@(posedge wt_clk);
		wdata=0;
		wt_en=0;
end
endtask

//read
task read_fifo(input integer num_reads); 
integer i;
begin
	for(i=0;i<num_reads;i=i+1) begin
		@(posedge rd_clk);
		rd_en=1;
		read_count=read_count+1;
	end	
		@(posedge rd_clk);
		rd_en=0;
end
endtask

//count
always@(posedge overflow) begin
	overflow_count=overflow_count+1;
end
always@(posedge underflow) begin
	underflow_count=underflow_count+1;
end
endmodule
