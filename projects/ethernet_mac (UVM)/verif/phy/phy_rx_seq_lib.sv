class phy_rx_base_seq extends uvm_sequence#(eth_frame);
    `uvm_object_utils(phy_rx_base_seq) 
    `NEW_OBJ
    //uvm_phase phase;
        
    task pre_body();
		//phase = get_starting_phase();
        if(starting_phase != null) begin
			starting_phase.raise_objection(this);
			starting_phase.phase_done.set_drain_time(this,100);
		end
    endtask
       
    task post_body();
    	if(starting_phase != null) starting_phase.drop_objection(this);
    endtask
endclass


class phy_rx_gen_frame_seq extends phy_rx_base_seq;
`uvm_object_utils(phy_rx_gen_frame_seq)
`NEW_OBJ

task body();
	`uvm_do_with(req,{req.len==128;})
endtask
endclass


class phy_coll_det_seq extends phy_rx_base_seq;
rand int delay;
`uvm_object_utils(phy_coll_det_seq)
`NEW_OBJ

task body();
	`uvm_do_with(req,{req.frame_type==COLL_DET;req.coll_det_delay==delay;})
endtask
endclass


class phy_pause_frame_seq extends phy_rx_base_seq;
rand int delay;
`uvm_object_utils(phy_pause_frame_seq)
`NEW_OBJ

task body();
	`uvm_do_with(req,{req.frame_type==PAUSE_FRAME;req.pausetimer==1;req.pause_frame_delay==delay;})
endtask
endclass
