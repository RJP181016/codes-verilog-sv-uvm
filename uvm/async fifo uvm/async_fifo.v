module async_fifo(
	wt_clk,rd_clk,rst,
	wt_en,wdata,full,overflow,
	rd_en,rdata,empty,underflow
	);

	parameter DEPTH=16;
	parameter PTR_WIDTH=$clog2(DEPTH);
	parameter DATA_WIDTH=8;

	input wt_clk,rd_clk,rst;
	input wt_en,rd_en;
	input [DATA_WIDTH-1:0] wdata;
	output reg [DATA_WIDTH-1:0] rdata;
	output reg full,empty,overflow,underflow;

	reg [DATA_WIDTH-1:0] fifo [DEPTH-1:0];
	reg [PTR_WIDTH-1:0] wt_pt,rd_pt;
	reg [PTR_WIDTH-1:0]wt_pt_gray,rd_pt_gray;
  	reg [PTR_WIDTH-1:0]wt_pt_gray_rd_clk,rd_pt_gray_wt_clk;
	reg wt_toggle,rd_toggle;
	reg wt_toggle_rd_clk,rd_toggle_wt_clk;
	integer i;


	//write logic
	always@(posedge wt_clk) begin
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
			wt_pt_gray=0;
			rd_pt_gray=0;
			wt_pt_gray_rd_clk=0;
			rd_pt_gray_wt_clk=0;
			for(i=0;i<DEPTH;i=i+1) begin
				fifo[i]=0;
			end
		end
		else begin
			overflow=0;
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
					wt_pt_gray={wt_pt[PTR_WIDTH-1],wt_pt[PTR_WIDTH-1:1]^wt_pt[PTR_WIDTH-2:0]};
				end
			end
		end
	end
	

	//read logic
	always@(posedge rd_clk) begin
		if(rst==0) begin
			underflow=0;
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
					rd_pt_gray={rd_pt[PTR_WIDTH-1],rd_pt[PTR_WIDTH-1:1]^rd_pt[PTR_WIDTH-2:0]};
				end
			end
		end
	end


	//synchronizer
	always@(posedge wt_clk) begin
		rd_pt_gray_wt_clk <= rd_pt_gray; 
		rd_toggle_wt_clk <= rd_toggle; 
	end
	always@(posedge rd_clk) begin
		wt_pt_gray_rd_clk <= wt_pt_gray;
		wt_toggle_rd_clk <= wt_toggle;
	end


	//full and empty condition
	always@(*) begin
		empty=0;
		if(wt_pt_gray_rd_clk==rd_pt_gray && wt_toggle_rd_clk==rd_toggle) begin
			empty=1;
		end
	end
	always@(*) begin
		full=0;
		if(wt_pt_gray==rd_pt_gray_wt_clk && wt_toggle!=rd_toggle_wt_clk) begin
			full=1;
		end
	end
	endmodule





























