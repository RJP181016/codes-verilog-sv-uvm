//3. write a single constraint to generate the random values for bit[8:0] variable in the below range  1-54 , 127 ,137-166,196-209 & 231-262


  class packet;
    rand bit [8:0] a;

    constraint constraint_c { 
      a inside {[1:54],127,[137:166],[196:209],[231:262]};
    }
  endclass


  module top;  
    initial begin
      packet pkt = new();
      repeat(10) begin
        pkt.randomize();
        $display("pkt = %p",pkt);
      end
    end
  endmodule
