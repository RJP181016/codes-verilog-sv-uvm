class apb_tx;
rand bit wt_rd;
rand bit [7:0]addr;
rand bit [31:0]data;
rand bit [3:0]sel;

function void print(string name="apb_tx");
	$display("Printing %s fields",name);
	$display("\twt_rd=%b",wt_rd);
	$display("\taddr=%h",addr);
	$display("\tdata=%0d",data);
	$display("\tsel=%b\n",sel);
endfunction

constraint sel_con{
	//sel inside{4'b0000,4'b0001,4'b0010,4'b0100,4'b1000};
	$onehot0(sel)==1;
}

endclass


module top();
apb_tx tx=new();

initial begin
	tx.print();
	tx.addr.rand_mode(0);
	tx.addr=8'h12;
	tx.sel_con.constraint_mode(0);
	assert(tx.randomize());
	tx.print();

	repeat(10) begin
		tx=new();
		assert(tx.randomize());
		tx.print("tx");
	end
end

endmodule
