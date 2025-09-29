class axi_slave extends uvm_component;
`uvm_component_utils(axi_slave)
`NEW_COMP
virtual axi_intf vif;

byte mem[*];
bit [31:0] awaddr_t_arr[*];
bit [3:0] awlen_t_arr[*];
bit [2:0] awsize_t_arr[*];
bit [31:0] araddr_t_arr[*];
bit [3:0] arlen_t_arr[*];
bit [1:0] arsize_t_arr[*];
bit bready_f = 0;
bit [3:0] arid,awid,wid;
bit scatter;

function void build_phase(uvm_phase phase);
	super.build_phase(phase);
	uvm_resource_db#(virtual axi_intf)::read_by_name("GLOBAL","axi_pif",vif,this);
	uvm_resource_db#(bit)::read_by_name("GLOBAL","scatter",scatter,this);
endfunction

function void start_of_simulation_phase(uvm_phase phase);
	mem_populate(32'h10000,65536);
	mem_populate(32'h30000,65536);
	mem_populate(32'h50000,65536);
	mem_populate(32'h70000,65536);
endfunction

function void mem_populate(input [31:0] addr, input [31:0] num_loc);
	for(int i=0;i<num_loc;i++) begin
		mem[addr+i] = $random;
	end
endfunction

function load_command();
//COMMAND1
	//CMD_REG0
	{mem[`DMA_CMD_1_STORING_ADDR+3], mem[`DMA_CMD_1_STORING_ADDR+2], mem[`DMA_CMD_1_STORING_ADDR+1], mem[`DMA_CMD_1_STORING_ADDR]}= `DMA_CMD_1_SOURCE_ADDR;
	//CMD_REG1
	if(scatter==0) 
	{mem[`DMA_CMD_1_STORING_ADDR+7], mem[`DMA_CMD_1_STORING_ADDR+6], mem[`DMA_CMD_1_STORING_ADDR+5], mem[`DMA_CMD_1_STORING_ADDR+4]}= `DMA_CMD_1_DEST_ADDR;
	else 
	{mem[`DMA_CMD_1_STORING_ADDR+7], mem[`DMA_CMD_1_STORING_ADDR+6], mem[`DMA_CMD_1_STORING_ADDR+5], mem[`DMA_CMD_1_STORING_ADDR+4]}= `DMA_CMD_1_DEST_ADDR_S;
	//CMD_REG2
	{mem[`DMA_CMD_1_STORING_ADDR+11], mem[`DMA_CMD_1_STORING_ADDR+10], mem[`DMA_CMD_1_STORING_ADDR+9], mem[`DMA_CMD_1_STORING_ADDR+8]} = 32'h80;	//128 bytes
	//CMD_REG3
	{mem[`DMA_CMD_1_STORING_ADDR+15], mem[`DMA_CMD_1_STORING_ADDR+14], mem[`DMA_CMD_1_STORING_ADDR+13], mem[`DMA_CMD_1_STORING_ADDR+12]} = {`DMA_CMD_1_CMD_NEXT_ADDR_UPPER,2'b0,`DMA_CMD_1_CMD_LAST,`DMA_CMD_1_SET_INT};


//COMMAND2
	//CMD_REG0
	{mem[`DMA_CMD_2_STORING_ADDR+3], mem[`DMA_CMD_2_STORING_ADDR+2], mem[`DMA_CMD_2_STORING_ADDR+1], mem[`DMA_CMD_2_STORING_ADDR]}= `DMA_CMD_2_SOURCE_ADDR;
	//CMD_REG1
	if(scatter==0) 
	{mem[`DMA_CMD_2_STORING_ADDR+7], mem[`DMA_CMD_2_STORING_ADDR+6], mem[`DMA_CMD_2_STORING_ADDR+5], mem[`DMA_CMD_2_STORING_ADDR+4]}= `DMA_CMD_2_DEST_ADDR;
	else 
	{mem[`DMA_CMD_2_STORING_ADDR+7], mem[`DMA_CMD_2_STORING_ADDR+6], mem[`DMA_CMD_2_STORING_ADDR+5], mem[`DMA_CMD_2_STORING_ADDR+4]}= `DMA_CMD_2_DEST_ADDR_S;
	//CMD_REG2
	{mem[`DMA_CMD_2_STORING_ADDR+11], mem[`DMA_CMD_2_STORING_ADDR+10], mem[`DMA_CMD_2_STORING_ADDR+9], mem[`DMA_CMD_2_STORING_ADDR+8]} = 32'h80;
	//CMD_REG3
	{mem[`DMA_CMD_2_STORING_ADDR+15], mem[`DMA_CMD_2_STORING_ADDR+14], mem[`DMA_CMD_2_STORING_ADDR+13], mem[`DMA_CMD_2_STORING_ADDR+12]} = {`DMA_CMD_2_CMD_NEXT_ADDR_UPPER,2'b0,`DMA_CMD_2_CMD_LAST,`DMA_CMD_2_SET_INT};


//COMMAND3
	//CMD_REG0
	{mem[`DMA_CMD_3_STORING_ADDR+3], mem[`DMA_CMD_3_STORING_ADDR+2], mem[`DMA_CMD_3_STORING_ADDR+1], mem[`DMA_CMD_3_STORING_ADDR]}= `DMA_CMD_3_SOURCE_ADDR;
	//CMD_REG1
	if(scatter==0) 
	{mem[`DMA_CMD_3_STORING_ADDR+7], mem[`DMA_CMD_3_STORING_ADDR+6], mem[`DMA_CMD_3_STORING_ADDR+5], mem[`DMA_CMD_3_STORING_ADDR+4]}= `DMA_CMD_3_DEST_ADDR;
	else 
	{mem[`DMA_CMD_3_STORING_ADDR+7], mem[`DMA_CMD_3_STORING_ADDR+6], mem[`DMA_CMD_3_STORING_ADDR+5], mem[`DMA_CMD_3_STORING_ADDR+4]}= `DMA_CMD_3_DEST_ADDR_S;
	//CMD_REG2
	{mem[`DMA_CMD_3_STORING_ADDR+11], mem[`DMA_CMD_3_STORING_ADDR+10], mem[`DMA_CMD_3_STORING_ADDR+9], mem[`DMA_CMD_3_STORING_ADDR+8]} = 32'h80;
	//CMD_REG3
	{mem[`DMA_CMD_3_STORING_ADDR+15], mem[`DMA_CMD_3_STORING_ADDR+14], mem[`DMA_CMD_3_STORING_ADDR+13], mem[`DMA_CMD_3_STORING_ADDR+12]} = {`DMA_CMD_3_CMD_NEXT_ADDR,2'b0,`DMA_CMD_3_CMD_LAST,`DMA_CMD_3_SET_INT};

endfunction


task run_phase(uvm_phase phase);
	load_command();
	forever begin
		@(posedge vif.clk);
		//write addr phase
		if (vif.awvalid == 1) begin
		    vif.awready = 1;
		    awaddr_t_arr[awid] =vif.awaddr; 
			awlen_t_arr[awid] = vif.awlen; 
		    awsize_t_arr[awid] =vif.awsize;
		end
		else begin
		    vif.awready = 0;
		end
		
		//write data phase
		if (vif.wvalid == 1) begin
		    vif.wready = 1;
			if(awsize_t_arr[wid] == 3) begin
				for(int i=0; i<8; i++) begin
		    		mem[awaddr_t_arr[wid]+i] = vif.wdata[8*i +: 8];
				end
			end
			if(awsize_t_arr[wid] == 2) begin
				for(int i=0; i<4; i++) begin
		    		mem[awaddr_t_arr[wid]+i] = vif.wdata[8*i +: 8];
				end
			end
			if(awsize_t_arr[wid] == 1) begin
				for(int i=0; i<2; i++) begin
		    		mem[awaddr_t_arr[wid]+i] = vif.wdata[8*i +: 8];
				end
			end
			if(awsize_t_arr[wid] == 0) begin
				for(int i=0; i<1; i++) begin
		    		mem[awaddr_t_arr[wid]+i] = vif.wdata[8*i +: 8];
				end
			end
			awaddr_t_arr[wid] += 2**awsize_t_arr[wid];

			//write_resp_phase
			if (vif.wlast == 1) begin
		   		do_write_resp(wid);
			end
		end
		else begin
		    vif.wready = 0;
		end
		//read addr phase
		if (vif.arvalid == 1) begin
    	    vif.arready = 1;
    	    araddr_t_arr[arid] =vif.araddr; 
    	    arlen_t_arr[arid] = vif.arlen; 
    	    arsize_t_arr[arid] =vif.arsize;
    	   	do_read_data_phase(arid);
    	end
		else begin
    	    vif.arready = 0;
    	end
	end
endtask


task do_read_data_phase(input [31:0] arid_t);
	for (int i = 0; i <= arlen_t_arr[arid_t]; i++) begin
		if(arsize_t_arr[arid_t]==0) vif.rdata={mem[araddr_t_arr[arid_t]]};
		if(arsize_t_arr[arid_t]==1) vif.rdata={mem[araddr_t_arr[arid_t]+1],mem[araddr_t_arr[arid_t]]};
		if(arsize_t_arr[arid_t]==2) vif.rdata={mem[araddr_t_arr[arid_t]+3],mem[araddr_t_arr[arid_t]+2],mem[araddr_t_arr[arid_t]+1],mem[araddr_t_arr[arid_t]]};
		if(arsize_t_arr[arid_t]==3) vif.rdata={mem[araddr_t_arr[arid_t]+7],mem[araddr_t_arr[arid_t]+6],mem[araddr_t_arr[arid_t]+5],mem[araddr_t_arr[arid_t]+4],mem[araddr_t_arr[arid_t]+3],mem[araddr_t_arr[arid_t]+2],mem[araddr_t_arr[arid_t]+1],mem[araddr_t_arr[arid_t]]};
	    vif.rid = arid_t;
	    vif.rvalid = 1;
		vif.rresp = 2'b00;
	    if (i == arlen_t_arr[arid_t]) vif.rlast = 1;
	    @(posedge vif.clk);
	    wait(vif.rready == 1);
		araddr_t_arr[arid_t] += 2**arsize_t_arr[arid_t];
	end
    vif.rvalid = 0;
    vif.rlast = 0;
	vif.rdata=0;
	vif.rid=0;
endtask

task do_write_resp(input [3:0] bid_t);
    @(posedge vif.clk);
    vif.bid = bid_t;
	vif.bresp = 2'b00;
    vif.bvalid = 1;
    bready_f = 0;
    while (bready_f == 0) begin
        if (vif.bready == 1) bready_f = 1;
        @(posedge vif.clk);
    end
    vif.bvalid = 0;
	vif.bid = 0;
endtask
endclass
