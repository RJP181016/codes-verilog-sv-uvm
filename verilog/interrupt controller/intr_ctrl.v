module intr_ctrl(pclk,prst,paddr,pwrite,pwdata,prdata,penable,pready,perror,intr_serviced,intr_valid,intr_to_service,intr_active);

parameter NUM_PERIPHERALS=16;
parameter DATA_WIDTH=$clog2(NUM_PERIPHERALS);
parameter ADDR_WIDTH=$clog2(NUM_PERIPHERALS);
parameter PERIPH_INDEX=$clog2(NUM_PERIPHERALS);

parameter IDLE=3'b001;
parameter INTERRUPT=3'b010;
parameter WAIT=3'b100;

input pclk,prst,pwrite,penable;
output reg pready,perror;
input [ADDR_WIDTH-1:0]paddr;
input [DATA_WIDTH-1:0]pwdata;
output reg [DATA_WIDTH-1:0]prdata;
input intr_serviced;
output reg intr_valid;
output reg [PERIPH_INDEX-1:0]intr_to_service;
input [NUM_PERIPHERALS-1:0]intr_active; 

reg [DATA_WIDTH-1:0] priority_reg[NUM_PERIPHERALS-1:0];
integer i;
reg [2:0] ps,ns;
reg firstmatch;
reg [PERIPH_INDEX-1:0] current_highest_priority;
reg [PERIPH_INDEX-1:0] intr_with_highest_priority;


always@(posedge pclk) begin
if(prst) begin
	pready=0;
	perror=0;
	prdata=0;
	intr_valid=0;
	intr_to_service=0;
	firstmatch=1;
	current_highest_priority=0;
	intr_with_highest_priority=0;
	ps=IDLE;
	ns=IDLE;
	for(i=0;i<NUM_PERIPHERALS;i=i+1) begin
		priority_reg[i]=0;
	end
end
else begin
	if(penable) begin
		pready=1;
		if(pwrite) begin
			priority_reg[paddr]=pwdata;		//write to the registers
		end
		else begin
			prdata=priority_reg[paddr];
		end
	end
	else begin
		pready=0;
	end
end
end

//FSM to proccess(send) the requests of peripherals (to master) according to their priority
always@(posedge pclk) begin
if(prst==0) begin
case(ps) 
	IDLE: begin
		if(intr_active!=0) begin
			ns = INTERRUPT;
			firstmatch=1;
			current_highest_priority=0;
		end
	end
	INTERRUPT: begin
		for(i=0;i<NUM_PERIPHERALS;i=i+1) begin	//for loop to check the highest priority
			if(intr_active[i]==1) begin
				if(firstmatch==1) begin
					firstmatch=0;
					current_highest_priority=priority_reg[i];
					intr_with_highest_priority=i;
				end
				else begin
					if(current_highest_priority < priority_reg[i]) begin
						current_highest_priority=priority_reg[i];
						intr_with_highest_priority=i;
					end
				end
			end
		end
		intr_to_service=intr_with_highest_priority;
		intr_valid=1;
		ns = WAIT;
	end
	WAIT: begin
		if(intr_serviced==1) begin
			current_highest_priority=0;
			intr_to_service=0;
			intr_valid=0;
			if(intr_active!=0) begin
				ns = INTERRUPT;
				firstmatch=1;
			end
			else begin
				ns = IDLE;
			end
		end
		else ns = WAIT;
	end
endcase
end
end
always@(ns) ps=ns;
endmodule


