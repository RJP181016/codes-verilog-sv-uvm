//49.	Implement randc behavior using rand
parameter MAX = 3;
  class packet;
    bit [MAX-1:0] x;
    rand int rand_index;
    bit [MAX-1:0] q[$];
    
    constraint c1 {
      rand_index >= 0;
      rand_index < q.size();
    }
    
    function void pre_randomize();
      if(q.size() == 0) begin
        bit [MAX-1:0] d;
        for(int i;i<2**MAX;i++) begin
          d=i;
          q.push_back(d);
        end
      end
    endfunction
    
    function void post_randomize();
      x = q[rand_index];
      q[rand_index] = q[q.size()-1];
      q.delete(q.size()-1);
    endfunction
  endclass

  module top;  
    initial begin
      packet pkt = new();
      repeat(16) begin
        pkt.randomize();
        $display("pkt = %p",pkt);
      end
    end
  endmodule

/*
//standard approch
//49.	Implement randc behavior using rand

  class packet;
    rand bit [2:0] a;
    bit [2:0] q[$];
    
    function void post_randomize();
      q.push_back(a);
      if(q.size() == 8) q.delete();
    endfunction
    
    constraint c1 {
      !(a inside {q});
    }
    
  endclass

  module top;  
    initial begin
      packet pkt = new();
      repeat(16) begin
        pkt.randomize();
        $display("pkt = %p",pkt);
      end
    end
  endmodule
  */
