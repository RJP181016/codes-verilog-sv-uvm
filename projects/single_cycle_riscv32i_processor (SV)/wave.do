onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/clk_i
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/reset_i
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/instruction_address_o
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/instruction_data_i
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/PC
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/pc_next
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/read_data_i
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/write_enable_o
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/write_data_o
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/write_data_strobe_o
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/address_o
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/pc_update
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/instruction
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/immediate
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/reg_source_1
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/reg_source_2
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/alu_port_a
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/alu_port_b
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/comp_port_a
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/comp_port_b
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/alu_output
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/branch_enable
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/read_data_aligned
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/write_data_unaligned
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/load_store_type
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/dmem_data
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/pc_mux_sel
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/reg_write_enable
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/imm_select
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/execute_port_a_sel
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/execute_port_b_sel
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/alu_op_sel
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/comp_op_sel
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/data_memory_write_enable
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/reg_write_data_sel
add wave -noupdate -expand -group pcore /top_tb/dut/PrCore/reg_data
add wave -noupdate /top_tb/dut/PrCore/ccu/funct3_i
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {12 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 193
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {14 ns}
