//////////////////////////////////////////////////////////////
// <adder_5bits>.sv - <5-bit adder Module instantiation w/ overflow>
//
// Author: SuryaTeja Purma (<purma@pdx.edu>)
// Date: <16-01-2025>
//
// Description:
// ------------
// <Performs 5-bit addition w/ overflow >
////////////////////////////////////////////////////////////////


module adder_5bit(input logic [4:0] a_in, b_in, input logic carry_in,
 output logic [4:0] result, output logic carry_out, output logic overflow);



timeunit 1ns; timeprecision 1ns;
wire [3:0] qo;

gate_adder fa0(a_in[0],b_in[0],carry_in,result[0],qo[0]);
gate_adder fa1(a_in[1],b_in[1],qo[0],result[1],qo[1]);
gate_adder fa2(a_in[2],b_in[2],qo[1],result[2],qo[2]);
gate_adder fa3(a_in[3],b_in[3],qo[2],result[3],qo[3]);
gate_adder fa4(a_in[4],b_in[4],qo[3],result[4],carry_out);

assign overflow = qo[3]^carry_out;

endmodule :adder_5bit

