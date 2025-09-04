class scoreboard extends uvm_scoreboard;
`uvm_component_utils(scoreboard)

uvm_analysis_port #(packet) mon_in;
uvm_analysis_port #(packet) mon_out;
uvm_in_order_class_comparator #(packet) m_comp;

function new(string name="scoreboard",uvm_component parent=null);
    super.new(name,parent);
endfunction

virtual function void build_phase(uvm_phase phase);
super.build_phase(phase);
m_comp=uvm_in_order_class_comparator#(packet)::type_id::create("m_comp",this);
mon_in=new("mon_in",this);
mon_out=new("mon_out",this);
endfunction

virtual function void connect_phase(uvm_phase phase);
super.connect_phase(phase);
mon_in.connect(m_comp.before_export);
mon_out.connect(m_comp.after_export);
endfunction

virtual function void extract_phase(uvm_phase phase);
uvm_config_db#(int)::set(null,"uvm_test_top.env","matches",m_comp.m_matches);
uvm_config_db#(int)::set(null,"uvm_test_top.env","mis_matches",m_comp.m_mismatches);
endfunction

function void report_phase(uvm_phase phase);
    `uvm_info("SCB",$sformatf("Scoreboard completed with matches=%0d mismatches=%0d ",m_comp.m_matches,m_comp.m_mismatches),UVM_NONE);
endfunction 

endclass

