module sync_fifo(
	clk,rst,
	wt_en,wdata,full,overflow,
	rd_en,rdata,empty,underflow
	);

	parameter DEPTH=16;
	parameter PTR_WIDTH=$clog2(DEPTH);
	parameter DATA_WIDTH=8;

	input clk,rst;
	input wt_en,rd_en;
	input [DATA_WIDTH-1:0] wdata;
	output reg [DATA_WIDTH-1:0] rdata;
	output reg overflow,underflow;
	output reg full,empty;


	reg [DATA_WIDTH-1:0] fifo [DEPTH-1:0];
	reg [PTR_WIDTH:0] wt_pt,rd_pt;
	integer i;
	reg wrap_around;

	always@(posedge clk) begin
		if(rst) begin
			rdata=0;
			overflow=0;
			underflow=0;
		    wt_pt=0;
			rd_pt=0;
			wrap_around=0;
			for(i=0;i<DEPTH;i=i+1) begin
				fifo[i]=0;
			end
		end
		else begin
			overflow=0;
			underflow=0;
			if(wt_en==1) begin
				if(full==1) begin
					overflow=1;
				end
				else begin
					fifo[wt_pt[PTR_WIDTH-1:0]]=wdata;
					wt_pt=wt_pt+1;
				end
			end
			if(rd_en==1) begin
				if(empty==1) begin
					underflow=1;
				end
				else begin
					rdata=fifo[rd_pt[PTR_WIDTH-1:0]];
					rd_pt=rd_pt+1;
				end
			end
		end
	end

	always@(*) begin
		wrap_around = wt_pt[PTR_WIDTH]^rd_pt[PTR_WIDTH];
		full=wrap_around & (wt_pt[PTR_WIDTH-1:0]==rd_pt[PTR_WIDTH-1:0]);
		empty=(wt_pt==rd_pt);
	end
	endmodule















