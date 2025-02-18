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
reg [8*64-1:0]testname;
integer seed;

memory #(.WIDTH(WIDTH), .DEPTH(DEPTH), .ADDR_WIDTH(ADDR_WIDTH)) dut(clk,rst,wt_rd,addr,wdata,rdata,valid,ready);

initial begin
	clk=0;
	forever #CLK_CYCLE_DELAY clk = ~clk;
end

initial begin
	$value$plusargs("testname=%s",testname);
	$value$plusargs("seed=%d",seed);
    reset_mem();
    
    case(testname)
      "test_write_fd_read_fd": begin
        write_mem_fd(0,DEPTH);
        read_mem_fd(0,DEPTH);
      end
      "test_write_bd_read_bd": begin
        write_mem_bd(0,DEPTH);
        read_mem_bd(0,DEPTH);
      end
      "test_write_fd_read_bd": begin
        write_mem_fd(0,DEPTH);
        read_mem_bd(0,DEPTH);
      end
      "test_write_bd_read_fd": begin
        write_mem_bd(0,DEPTH);
        read_mem_fd(0,DEPTH);
      end
    endcase
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

task write_mem_fd(input [ADDR_WIDTH-1:0]start_location,input [ADDR_WIDTH:0]num_locations); begin
	for(i=start_location;i<start_location+num_locations;i=i+1) begin
		@(posedge clk);
		addr=i;
		wdata=$random(seed);
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

task read_mem_fd(input [ADDR_WIDTH-1:0]start_location,input [ADDR_WIDTH:0]num_locations); begin
	for(i=start_location;i<start_location+num_locations;i=i+1) begin
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

task write_mem_bd(input [ADDR_WIDTH-1:0]start_location, input [ADDR_WIDTH:0]num_locations); begin
    $readmemh("image.hex",dut.mem,start_location,start_location+num_locations-1);
end
endtask
  
task read_mem_bd(input [ADDR_WIDTH-1:0]start_location, input [ADDR_WIDTH:0]num_locations); begin
    $writememh("image_out.hex",dut.mem,start_location,start_location+num_locations-1);
end
endtask
endmodule
