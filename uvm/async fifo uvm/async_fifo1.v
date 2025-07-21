module async_fifo(
  wt_clk,rd_clk,rst,
  wt_en,wdata,full,overflow,
  rd_en,rdata,empty,underflow
);
  
  parameter DEPTH = 16;
  parameter DATA_WIDTH = 8;
  parameter PTR_WIDTH = $clog2(DEPTH);
  
  input wt_clk,rd_clk,rst;
  input wt_en,rd_en;
  input [DATA_WIDTH-1:0]wdata;
  output reg full,empty,overflow,underflow;
  output reg [DATA_WIDTH-1:0]rdata;
  
  reg [DATA_WIDTH-1:0]mem[DEPTH-1:0];
  reg [PTR_WIDTH:0]wp,rp;
  reg [PTR_WIDTH:0]wp_r_clk,rp_w_clk;
  integer i;
  reg wrap_around;
  
  //write logic
  always@(posedge wt_clk)
    begin
      if(rst==1)
        begin
          full=0;
          empty=0;
          overflow=0;
          rdata=0;
          wp=0;
          rp=0;
          for(i=0;i<DEPTH;i=i+1)
            begin
              mem[i]=0;
            end
        end
      else begin
        overflow=0;
        if(wt_en==1) begin
          if(full==1) begin
            overflow=1;
          end
          else begin
            mem[wp] = wdata;
            wp=wp+1;
          end
        end
      end
    end
  
  //read logic
  always@(posedge rd_clk)
    begin
      if(rst==0) begin
        underflow=0;
        if(rd_en==1) begin
          if(empty==1) begin
            underflow=1;
          end
          else begin
            rdata=mem[rp];
            rp=rp+1;
          end 
        end
      end
    end
  
  //synchronizer
  always@(posedge wt_clk)
    begin
      rp_w_clk<=rp;
    end
  always@(posedge rd_clk)
    begin
      wp_r_clk<=wp;
    end
  
  //full condition
  always@(*)
    begin;
      full=0;
      wrap_around = wp[PTR_WIDTH] ^ rp_w_clk[PTR_WIDTH]; 
      full = wrap_around & (wp[PTR_WIDTH-1:0] == rp_w_clk[PTR_WIDTH-1:0]);
    end
  
  //empty condition
  always@(*)
    begin
      empty=0;
      empty = (wp_r_clk == rp);
    end
    
  
endmodule