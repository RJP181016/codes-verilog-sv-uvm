class mem_tx;
rand bit [`ADDR_WIDTH-1:0] addr;
rand bit [`WIDTH-1:0] data;
rand bit wt_rd;

function void print(string name="mem_tx");
	$display("printing %s fields",name);
	$display("\taddr=%h",addr);
	$display("\tdata=%h",data);
	$display("\twt_rd=%h\n",wt_rd);
endfunction

endclass
