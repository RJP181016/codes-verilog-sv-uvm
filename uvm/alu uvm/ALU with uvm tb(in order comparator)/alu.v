module alu(clk,reset,op_code,inp1,inp2,outp);
parameter N = 4;
input clk,reset;
input [N-1:0] inp1,inp2;
  input [1:0] op_code;
output reg [(2*N)-1:0] outp;

parameter  ADD=2'b00, SUB=2'b01,MUL=2'b10,DIV=2'b11;

always @ (posedge clk or posedge reset) begin
  if(reset) outp='0;
   else begin
    case (op_code)
	ADD :  outp= inp1 +  inp2;
	MUL :  outp= inp1 *  inp2;
	SUB :  outp= inp1 -  inp2;
    DIV :  outp= inp1 /  inp2;
	default outp = 'bz;
    endcase
   end
end


endmodule