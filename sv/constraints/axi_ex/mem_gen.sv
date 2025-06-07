class mem_tx;
rand bit[31:0] addr;
rand bit[`NUM_SLAVE-1:0] target;

constraint target_c {
	target inside {mem_cfg::target_slaveQ};
}
/*
constraint addr_range_c {
	(target[0]==1) -> addr inside {[`S0_START:`S0_END]};
	(target[1]==1) -> addr inside {[`S1_START:`S1_END]};
	(target[2]==1) -> addr inside {[`S2_START:`S2_END]};
	(target[3]==1) -> addr inside {[`S3_START:`S3_END]};
	(target[4]==1) -> addr inside {[`S4_START:`S4_END]};
	(target[5]==1) -> addr inside {[`S5_START:`S5_END]};
}*/
constraint addr_range_c {
	 foreach (target[i]) {
        if (target[i] == 1) addr inside {[mem_cfg::start_addr[i] : mem_cfg::end_addr[i]]};
    }
}

endclass

class mem_gen;
mem_tx tx;

task run();
	tx=new();
	repeat(10) begin
		assert(tx.randomize());
		$display("tx.addr=%h",tx.addr);
	end
endtask
endclass
