typedef enum bit [1:0] {
	FIXED,
	INCR,
	WRAP
} brust_type_t;

class axi_tx;
rand bit wr_rd;
rand bit[31:0] addr;
rand bit[31:0] data;
rand bit[1:0] lock;
//2'b00 : Normal
//2'b01 : Locked
//2'b10 : Exclusive
//2'b11 : Reserved

rand brust_type_t brust_type;
//2'b00 : Fixed
//2'b01 : Incr
//2'b10 : Wrap
//2'b11 : Reserved

constraint lock_c {
	lock!=2'b11;
}

//without enum, we need a constraint same as lock

endclass 


module top;
axi_tx tx=new();
axi_tx txA[4:0];
initial begin
	for (int i=0;i<5;i++) begin
		assert(tx.randomize() with {wr_rd==1;});
		txA[i]=new tx;
		$display("tx=%p",tx);
	end
	//read same 5 locations
	for (int i=0;i<5;i++) begin
		//assert(tx.randomize() with {wr_rd==0; addr==txA[i].addr; lock==txA[i].lock; brust_type==txA[i].brust_type;});
		tx=txA[i];
		tx.wr_rd=0;
		$display("tx=%p",tx);
	end
end



endmodule



