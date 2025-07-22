class mem_gen;
mem_tx tx;
logic [`ADDR_WIDTH-1:0] addr_loc;
logic [`ADDR_WIDTH-1:0] addr_locQ[$];
int gen_num;

function new(int i);
	gen_num=i;
endfunction

task run();
case(mem_common::testname)
"test_1_wt_1_rd": begin
	//write a location
	tx=new();
	assert(tx.randomize() with {wt_rd==1;});
	addr_loc=tx.addr;
	mem_common::gen2bfmDA[gen_num].put(tx);
	//read a location
	tx=new();
	assert(tx.randomize() with {wt_rd==0;});
	tx.addr=addr_loc;
	mem_common::gen2bfmDA[gen_num].put(tx);
end
"test_n_wt_n_rd": begin
	repeat(mem_common::count) begin
		//write a location
		tx=new();
		assert(tx.randomize() with {wt_rd==1;});
		addr_locQ.push_back(tx.addr);
		mem_common::gen2bfmDA[gen_num].put(tx);
	end
	repeat(mem_common::count) begin
		//read a location
		tx=new();
		assert(tx.randomize() with {wt_rd==0;});
		tx.addr=addr_locQ.pop_front();
		mem_common::gen2bfmDA[gen_num].put(tx);
	end
end
endcase
endtask

endclass
