typedef enum bit [2:0] {
	ETH_FRAME,
	COLL_DET,
	PAUSE_FRAME
} frame_type_t;

class eth_frame extends uvm_sequence_item;
rand frame_type_t frame_type;
rand int coll_det_delay;
rand int pause_frame_delay;
rand bit [55:0] preamble;
rand bit [7:0] sfd;
//current MAC, frames does not have da, sa and length fields
rand int len;
rand bit [7:0] payload[$];
bit [31:0] crc;

//pause_frame fields
rand bit [47:0] da;
rand bit [47:0] sa;
rand bit [15:0] type_len;
rand bit [15:0] opcode;
rand bit [15:0] pausetimer;

`uvm_object_utils_begin(eth_frame)
	`uvm_field_int(preamble, UVM_ALL_ON)
	`uvm_field_int(sfd, UVM_ALL_ON)
	`uvm_field_int(len, UVM_ALL_ON|UVM_NOPACK)
	`uvm_field_queue_int(payload, UVM_ALL_ON)
	`uvm_field_int(crc, UVM_ALL_ON)
	`uvm_field_int(opcode, UVM_ALL_ON)
	`uvm_field_int(pausetimer, UVM_ALL_ON)
`uvm_object_utils_end
`NEW_OBJ

function void post_randomize();
	//bit [32:0] crc_poly = 33'b1_0000_0100_1100_0001_0001_1101_1011_0111;
	//bit [32:0] remainder;
	//bit [39:0] dividend;
	//bit payload_bitvector[$];

	//payload_bitvector = {>>bit{payload}};

	//for(int i=32; i>=0; i--) begin
	//	if(remainder[i]==0) no_of_bits_to_shift++;
	//	else break;
	//end
	crc=32'h1234_5678;
	//crc = compute_crc(payload);
endfunction

constraint soft_c {
	soft preamble== 56'h55_5555_5555_5555;
	soft sfd== 8'hd5;
	soft len inside {[46:1500]};
	soft frame_type == ETH_FRAME;
	soft da == 48'h01_80_c2_00_00_01;
	soft sa == 48'h11_22_33_44_55_66;
}
constraint payload_c {
	payload.size()==len;
}
constraint opcode_c {
	(frame_type==PAUSE_FRAME) -> (opcode == 16'h0001);
	(frame_type==PAUSE_FRAME) -> (type_len == 16'h8808);
}



  function automatic bit [31:0] compute_crc(ref bit [7:0] data[$]);
    bit [31:0] crc_reg;
    int i, j;

    crc_reg = 32'hFFFF_FFFF;  // init seed

    // Process each byte
    foreach (data[i]) begin
      bit [7:0] d = data[i];
      // Process each bit LSB-first
      for (j = 0; j < 8; j++) begin
        bit fb = crc_reg[0] ^ d[j];
        crc_reg = crc_reg >> 1;
        if (fb)
          crc_reg ^= 32'hEDB88320; // reversed 0x04C11DB7
      end
    end

    compute_crc = ~crc_reg; // Final inversion
  endfunction
endclass
