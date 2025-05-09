class eth_pkt;
    rand bit [55:0]  preamble;  
    rand bit [7:0]   sfd;      
    rand bit [47:0]  dest_mac;
    rand bit [47:0]  src_mac; 
    rand bit [15:0]  ethertype;
    rand bit [12000:0] payload; 
    rand bit [31:0]  fcs; 

    byte byteQ[$];   // Queue of bytes
    bit bitQ[$];     // Queue of bits
    typedef logic [3:0] nibble_t; // Define a 4-bit nibble type
    nibble_t nibbleQ[$]; // Queue of nibbles

    // Pack fields into queues
    function void pack_bytes();
        byteQ = {<<byte{preamble, sfd, dest_mac, src_mac, ethertype, payload, fcs}};
    endfunction

    function void pack_bits();
        bitQ = {<<1{preamble, sfd, dest_mac, src_mac, ethertype, payload, fcs}};
    endfunction

    function void pack_nibbles();
        nibbleQ = {<<nibble_t{preamble, sfd, dest_mac, src_mac, ethertype, payload, fcs}};
    endfunction
endclass

// Testbench
module top();
    initial begin
        eth_pkt pkt1 = new();

        if (pkt1.randomize()) begin
            $display("Randomization Successful!");
        end else begin
            $display("Randomization Failed!");
        end

        pkt1.pack_bytes();
        $display("Byte Queue: %p", pkt1.byteQ);

        pkt1.pack_bits();
        $display("Bit Queue: %p", pkt1.bitQ);

        pkt1.pack_nibbles();
        $display("Nibble Queue: %p", pkt1.nibbleQ);
    end
endmodule

