class apb_tx;
rand bit [7:0]addr;
rand bit [15:0]data;
rand bit wr_rd;

//handshaking signals should not be declared.

function void print(string name="apb_tx");
	$display("printing %s fields",name);
	$display("\taddr=%h",addr);
	$display("\tdata=%h",data);
	$display("\twr_rd=%b\n",wr_rd);
endfunction

function void copy(output apb_tx tx);
	tx=new this;
endfunction

function void compare(apb_tx tx, int i=0);
	if(tx.addr==addr && tx.data==data && tx.wr_rd==wr_rd) $display("tx%0d fields are matching",i);
	else $display("tx%0d fields are not matching",i); 
endfunction

constraint addr_con{
	addr[1:0]==2'b00;
}

endclass

module top;
apb_tx tx1,tx2;

apb_tx txA1[5];
apb_tx txA2[5];

initial begin
tx1=new();
tx2=new();
foreach(txA1[i]) txA1[i]=new();
foreach(txA2[i]) txA2[i]=new();

assert(tx1.randomize());
assert(tx2.randomize());
foreach(txA1[i]) assert(txA1[i].randomize());
foreach(txA2[i]) assert(txA2[i].randomize());

tx1.print("tx1");
tx2.print("tx2");
foreach(txA1[i]) txA1[i].print("txA1");
foreach(txA2[i]) txA2[i].print("txA2");

//copy
foreach(txA1[i]) txA1[i].copy(txA2[i]);
foreach(txA1[i]) txA1[i].print("after copy: txA1");
foreach(txA2[i]) txA2[i].print("after copy: txA2");

//compare
foreach(txA1[i]) txA1[i].compare(txA2[i],i);

end
endmodule
