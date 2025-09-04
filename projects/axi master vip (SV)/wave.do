onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/rst
add wave -noupdate /top/clk
add wave -noupdate /top/dut/aclk
add wave -noupdate /top/dut/arstn
add wave -noupdate -expand -group write_addr_phase /top/dut/awid
add wave -noupdate -expand -group write_addr_phase /top/dut/awaddr
add wave -noupdate -expand -group write_addr_phase /top/dut/awsize
add wave -noupdate -expand -group write_addr_phase /top/dut/awlen
add wave -noupdate -expand -group write_addr_phase /top/dut/awlock
add wave -noupdate -expand -group write_addr_phase /top/dut/awburst
add wave -noupdate -expand -group write_addr_phase /top/dut/awcache
add wave -noupdate -expand -group write_addr_phase /top/dut/awprot
add wave -noupdate -expand -group write_addr_phase /top/dut/awvalid
add wave -noupdate -expand -group write_addr_phase /top/dut/awready
add wave -noupdate -expand -group write_data_phase /top/dut/wdata
add wave -noupdate -expand -group write_data_phase /top/dut/wstrb
add wave -noupdate -expand -group write_data_phase /top/dut/wid
add wave -noupdate -expand -group write_data_phase /top/dut/wvalid
add wave -noupdate -expand -group write_data_phase /top/dut/wready
add wave -noupdate -expand -group write_data_phase /top/dut/wlast
add wave -noupdate -expand -group write_resp__phase /top/dut/bid
add wave -noupdate -expand -group write_resp__phase /top/dut/bresp
add wave -noupdate -expand -group write_resp__phase /top/dut/bvalid
add wave -noupdate -expand -group write_resp__phase /top/dut/bready
add wave -noupdate -expand -group read_addr_phase /top/dut/arid
add wave -noupdate -expand -group read_addr_phase /top/dut/araddr
add wave -noupdate -expand -group read_addr_phase /top/dut/arsize
add wave -noupdate -expand -group read_addr_phase /top/dut/arlen
add wave -noupdate -expand -group read_addr_phase /top/dut/arlock
add wave -noupdate -expand -group read_addr_phase /top/dut/arburst
add wave -noupdate -expand -group read_addr_phase /top/dut/arcache
add wave -noupdate -expand -group read_addr_phase /top/dut/arprot
add wave -noupdate -expand -group read_addr_phase /top/dut/arvalid
add wave -noupdate -expand -group read_addr_phase /top/dut/arready
add wave -noupdate -expand -group read_data_phase /top/dut/rdata
add wave -noupdate -expand -group read_data_phase /top/dut/rid
add wave -noupdate -expand -group read_data_phase /top/dut/rvalid
add wave -noupdate -expand -group read_data_phase /top/dut/rready
add wave -noupdate -expand -group read_data_phase /top/dut/rlast
add wave -noupdate -expand -group read_data_phase /top/dut/rresp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {15 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 178
configure wave -valuecolwidth 75
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {0 ns} {100 ns}
