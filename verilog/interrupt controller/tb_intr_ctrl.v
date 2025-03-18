`include "intr_ctrl.v"
module top;

parameter CLK_CYCLE_DELAY=1;
parameter NUM_PERIPHERALS=16;
parameter DATA_WIDTH=$clog2(NUM_PERIPHERALS);
parameter ADDR_WIDTH=$clog2(NUM_PERIPHERALS);
parameter PERIPH_INDEX=$clog2(NUM_PERIPHERALS);

reg pclk,prst,pwrite,penable;
wire pready,perror;
reg [ADDR_WIDTH-1:0]paddr;
reg [DATA_WIDTH-1:0]pwdata;
wire [DATA_WIDTH-1:0]prdata;
wire intr_valid;
reg intr_serviced;
reg [NUM_PERIPHERALS-1:0]intr_active;
wire [PERIPH_INDEX-1:0]intr_to_service;

reg [DATA_WIDTH-1:0] priority_reg[NUM_PERIPHERALS-1:0];
reg [8*64-1:0]testname;
integer i,seed;

intr_ctrl #(.NUM_PERIPHERALS(NUM_PERIPHERALS)) dut (pclk,prst,paddr,pwrite,pwdata,prdata,penable,pready,perror,intr_serviced,intr_valid,intr_to_service,intr_active);

//clock generation
initial begin
	pclk=0;
	forever #CLK_CYCLE_DELAY pclk = ~pclk;
end

initial begin
	$value$plusargs("testname=%s",testname);  
	$value$plusargs("seed=%d",seed);
	reset_dut();
	write_dut();							//setting priority to peripherals
	intr_active=$random(seed);				//generating random peripheral requests
	#500;
	$finish;
end

always@(posedge intr_valid) begin
	#10;									//time taken for master to proccess the peripheral request which is selected according to its priority
	intr_active[intr_to_service]=0;			//setting respective peripheral request to 0
	intr_serviced=1;						//completed the peripheral request
	@(posedge pclk);
	intr_serviced=0;
end

//reset
task reset_dut(); begin
	prst=1;
	pwrite=0;
	paddr=0;
	pwdata=0;
	penable=0;
	intr_active=0;
	intr_serviced=0;
	@(posedge pclk);
	prst=0;
end
endtask

//write task to set priority to peripherals
task write_dut(); 
integer intA[NUM_PERIPHERALS-1:0];
integer j,k,num,exists;
begin
	for(j=0;j<NUM_PERIPHERALS;) begin			//logic to generate random unique numbers into an array
		num=$urandom_range(0,NUM_PERIPHERALS-1);
		exists=0;
		for(k=0;k<j;k=k+1) begin
			if(intA[k]==num) begin
				exists=1;
				k=j;	
			end
		end
		if(exists==0) begin
			intA[j]=num;
			j=j+1;
		end
	end
	for(i=0;i<NUM_PERIPHERALS;i=i+1) begin
		@(posedge pclk);
		paddr=i;
		case(testname)
			"test_low_peripheral_low_priority": pwdata=i;
			"test_low_periheral_high_priority": pwdata=NUM_PERIPHERALS-1-i;
			"test_random_unique_priority": pwdata=intA[i];  
		endcase
		pwrite=1;
		penable=1;
		wait(pready==1);
	end	
		@(posedge pclk);
		paddr=0;
		pwdata=0;
		pwrite=0;
		penable=0;
end
endtask

//read task to read priority of peripherals
task read_dut(); begin
	for(i=0;i<NUM_PERIPHERALS;i=i+1) begin
		@(posedge pclk);
		paddr=i;
		pwrite=0;
		penable=1;
		wait(pready==1);
	end	
		@(posedge pclk);
		paddr=0;
		pwrite=0;
		penable=0;
end
endtask
endmodule
