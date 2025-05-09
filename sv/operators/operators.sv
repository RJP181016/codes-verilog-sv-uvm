module top();
int a=52;//164;
int intA[100];
int intA1[200];
bit exists_f;

//2. set membership operator
initial begin
for(int i=0;i<100;i++) intA[i]=$urandom_range(1,1000);
for(int i=0;i<200;i++) intA1[i]=$urandom_range(1,2000);
$display("a=%0d,\nintA=%p,\nintA1=%p",a,intA,intA1);

for(int i=0;i<100;i++) if(intA[i]==a || intA1[i]==a) exists_f=1;
$display("exists_f=%b",exists_f);

exists_f={a inside{intA,intA1}};
$display("exists_f(smo)=%b",exists_f);
end


initial begin $display("\n%s\n",{230{"#"}}); end
//3. Use streaming operators to pack eth_pkt fields in to queue of bytes and queue of bits
class eth_pkt;
rand bit [55:0]  preamble;  
rand bit [7:0]   sfd;      
rand bit [47:0]  dest_mac;
rand bit [47:0]  src_mac; 
rand bit [15:0]  ethertype;
rand bit [12000:0] payload;
rand bit [31:0]  fcs; 
byte byteQ[$];
bit bitQ[$];
typedef logic [3:0] nibble_t;
bit [3:0] nibbleQ[$];

function int pack1();
nibbleQ={<<nibble_t{preamble,sfd,dest_mac,src_mac,ethertype,payload,fcs}};
endfunction
function int pack2();
bitQ={<<bit{preamble,sfd,dest_mac,src_mac,ethertype,payload,fcs}};
endfunction
function int pack3();
byteQ={<<byte{preamble,sfd,dest_mac,src_mac,ethertype,payload,fcs}};
endfunction
endclass

initial begin
eth_pkt pkt1=new();
pkt1.randomize();
pkt1.pack1();
pkt1.pack2();
pkt1.pack3();
$display("nibbleQ=%p",pkt1.nibbleQ);
$display("bitQ=%p",pkt1.bitQ);
$display("byteQ=%p",pkt1.byteQ);
end


initial begin $display("\n%s\n",{230{"#"}}); end
//4. Write simple way(minimal hardware) to multiply a number by 4
int n1;
int m;
assign m=(n1<<2);
initial begin
n1=7;
$display("number=%0d, mul=%0d",n1,m);
end


initial begin $display("\n%s\n",{230{"#"}}); end
//5. Write an example to show the difference between >>= and >>>= operators?
initial begin
int signed num1, num2;        
num1 = -8;
num2 = -8;  
num1 >>= 2;  
$display("Logical Right Shift (>>=) on num1: %d", num1);
num2 >>>= 2;
$display("Arithmetic Right Shift (>>>=) on num2: %d", num2);
end


initial begin $display("\n%s\n",{230{"#"}}); end
//12.	 Write an example of array concatenation
initial begin
int arr1[3] = '{1, 2, 3};
int arr2[2] = '{4, 5};
int arr_concat[5]; 
arr_concat = {arr1, arr2}; 
$display("Concatenated Array: %p", arr_concat);
end

initial begin $display("\n%s\n",{230{"#"}}); end

endmodule
