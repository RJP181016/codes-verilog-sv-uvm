class dma_ctrl_reg_adapter extends uvm_reg_adapter;
  `uvm_object_utils(dma_ctrl_reg_adapter)
   function new(string name = "dma_ctrl_reg_adapter");
      super.new(name);
   endfunction

  virtual function uvm_sequence_item reg2bus(const ref uvm_reg_bus_op rw);
    apb_tx apb = apb_tx::type_id::create("apb");
    apb.wr_rd = (rw.kind == UVM_READ) ? 0 : 1;
    apb.addr = rw.addr;
    apb.data = rw.data;
    return apb;
  endfunction: reg2bus

  virtual function void bus2reg(uvm_sequence_item bus_item,
                                ref uvm_reg_bus_op rw);
    apb_tx apb;
    if (!$cast(apb, bus_item)) begin
      `uvm_fatal("NOT_APB_TYPE","Provided bus_item is not of the correct type")
      return;
    end
    rw.kind = apb.wr_rd ? UVM_WRITE : UVM_READ;
    rw.addr = apb.addr;
    rw.data = apb.data;
    rw.status = UVM_IS_OK;
  endfunction: bus2reg
endclass: dma_ctrl_reg_adapter
