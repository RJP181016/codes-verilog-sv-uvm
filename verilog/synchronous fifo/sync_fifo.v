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
	output reg full,empty,overflow,underflow;

	reg [DATA_WIDTH-1:0] fifo [DEPTH-1:0];
	reg [PTR_WIDTH-1:0] wt_pt,rd_pt;
	reg wt_toggle,rd_toggle;
	integer i;

	always@(posedge clk) begin
		if(rst) begin
			rdata=0;
			full=0;
			empty=1;
			overflow=0;
			underflow=0;
			wt_toggle=0;
			rd_toggle=0;
		    wt_pt=0;
			rd_pt=0;
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
					fifo[wt_pt]=wdata;
					if(wt_pt==DEPTH-1) begin
						wt_toggle = ~wt_toggle;
					end
					wt_pt=wt_pt+1;
				end
			end
			if(rd_en==1) begin
				if(empty==1) begin
					underflow=1;
				end
				else begin
					rdata=fifo[rd_pt];
					if(rd_pt==DEPTH-1) begin
						rd_toggle = ~rd_toggle;
					end
					rd_pt=rd_pt+1;
				end
			end
		end
	end

	//full and empty condition
	always@(*) begin
		empty=0;
		full=0;
		if(wt_pt==rd_pt && wt_toggle==rd_toggle) begin
			empty=1;
		end
		if(wt_pt==rd_pt && wt_toggle!=rd_toggle) begin
			full=1;
		end
	end
	endmodule















