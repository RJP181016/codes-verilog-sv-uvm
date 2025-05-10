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

function bit compare(apb_tx tx);
	if(addr==tx.addr && data==tx.data && sel==tx.sel && wt_rd==tx.wt_rd) 
		$display("tx fields are matching");
	else 
		$display("tx fields are not matching");
endfunction

constraint sel_con{
	$onehot0(sel)==1;
}

endclass


module top();
apb_tx tx1=new;
apb_tx tx2=new;
apb_tx tx3=new;
apb_tx tx4=new;

initial begin
	assert(tx1.randomize());
	assert(tx2.randomize());
	assert(tx3.randomize());
	assert(tx4.randomize());
	tx1.print("tx1");
	tx2.print("tx2");
	tx1.compare(tx2);
	tx3.compare(tx4);
	tx3.print("tx3");
	tx4.print("tx4");

end

endmodule
