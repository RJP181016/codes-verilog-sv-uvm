class base_sequence extends uvm_sequence#(packet);
    int unsigned item_count;

`uvm_object_utils(base_sequence)

function new (string name="base_sequence");
	super.new(name);
	set_automatic_phase_objection(1);//uvm-1.2 only
endfunction

extern virtual task pre_start();
extern virtual task body();
endclass

task base_sequence::pre_start();

//below one is for when setting item_count at agent level in test
//uvm_sequencer_base sqr=get_sequencer(); 
//if(!uvm_config_db #(int):: get(sqr.get_parent(),"","item_count",item_count))

//below one is for when setting item_count at sequencer level in test
//if(!uvm_config_db #(int):: get(this.get_sequencer(),"","item_count",item_count))

//below one is for when setting item_count at sequence level in test
if(!uvm_config_db #(int):: get(null,this.get_full_name,"item_count",item_count))
begin
    `uvm_warning(get_full_name(),"item_count is not set")
    item_count=10;
end

endtask

task base_sequence::body();
   `uvm_do(req); 
endtask

