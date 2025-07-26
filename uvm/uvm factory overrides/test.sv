class test extends uvm_test;
  `uvm_component_utils(test)
   packet pkt1,pkt2;  
  
    function new (string name="",uvm_component parent=null);
      super.new(name,parent);
    endfunction
    
  virtual function void build_phase(uvm_phase phase);
  	// Get handle to the singleton factory instance
    uvm_factory factory = uvm_factory::get();
    super.build_phase(phase);
    set_type_override_by_type(packet::get_type(),new_packet::get_type());
    //factory.set_type_override_by_name("packet","new_packet");
  endfunction
    
    virtual task run_phase(uvm_phase phase);
      phase.raise_objection(this);

      $display("******* pkt1.print method (factory override) ***********");
      pkt1=packet::type_id::create("pkt1"); //with factory registraion we can override the pkt with new pkt
      void'(pkt1.randomize());
      pkt1.print();
      
      $display("******* pkt2.print method (without factory registration) ***********");
      pkt2=new("pkt2");
      void'(pkt2.randomize());
      pkt2.print();       
      
      phase.drop_objection(this);
    endtask
  endclass      