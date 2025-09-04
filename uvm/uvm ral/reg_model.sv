class  csr2_CHIP_EN extends uvm_reg;
    `uvm_object_utils(csr2_CHIP_EN)

    uvm_reg_field F;

    function new(string name="csr2_CHIP_EN");
	super.new(name,8,UVM_NO_COVERAGE);
    endfunction

    virtual function void build ();
	this.F=uvm_reg_field::type_id::create("F");
	this.F.configure(this,8,0,"RW",0,0,1,0,1);
    endfunction

endclass

class csr1_wr_count extends uvm_reg;
    `uvm_object_utils(csr1_wr_count)

    uvm_reg_field wr_count;
    uvm_reg_field rd_count;
    uvm_reg_field unused;

    function new(string name="csr1_wr_count");
	super.new(name,32,UVM_NO_COVERAGE);
    endfunction

     virtual function void build ();
	wr_count = uvm_reg_field::type_id::create("wr_count");
	wr_count.configure(this,8,0,"RO",0,8'h0,1,0,1);
	rd_count = uvm_reg_field::type_id::create("rd_count");
	rd_count.configure(this,8,8,"RO",0,8'h0,1,0,1);
	unused= uvm_reg_field::type_id::create("unused");
	unused.configure(this,16,16,"RO",0,16'h0,1,0,1);
    endfunction

endclass

class reg_model_block extends uvm_reg_block;
    `uvm_object_utils(reg_model_block)

csr2_CHIP_EN  csr2_chip_en;
csr1_wr_count csr1_wr_count_reg;

  function new(string name="reg_model_block");
	super.new(name,UVM_NO_COVERAGE);
  endfunction

    virtual function void build ();
	csr2_chip_en=csr2_CHIP_EN::type_id::create("csr2_chip_en");
	csr2_chip_en.configure(this,null,"csr2_CHIP_EN");
	csr2_chip_en.build();
	default_map=create_map("default_map",.base_addr('h0),.n_bytes(4),.endian(UVM_LITTLE_ENDIAN),.byte_addressing(1));
	default_map.add_reg(csr2_chip_en,'h20,"RW");

	csr1_wr_count_reg=csr1_wr_count::type_id::create("csr1_wr_count_reg");
	csr1_wr_count_reg.configure(this,null,"csr1_wr_count");
	csr1_wr_count_reg.build();
	default_map.add_reg(csr1_wr_count_reg,'h18,"RO");
    endfunction
endclass

/*
base_addr : The base address for the map. 
All registers, memories, and sub-blocks within the map will be at offsets to this address

n_bytes : The byte-width of the bus on which this map is used

endian : The endian format. See uvm_endianness_e for possible values
byte_addressing : Specifies whether consecutive addresses refer are 1 byte
apart (TRUE) or n_bytes apart (FALSE). Default is TRUE.
*/





