onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -group apb_intf /top/apb_pif/clk
add wave -noupdate -group apb_intf /top/apb_pif/reset
add wave -noupdate -group apb_intf /top/apb_pif/pclken
add wave -noupdate -group apb_intf /top/apb_pif/psel
add wave -noupdate -group apb_intf /top/apb_pif/penable
add wave -noupdate -group apb_intf /top/apb_pif/paddr
add wave -noupdate -group apb_intf /top/apb_pif/pwrite
add wave -noupdate -group apb_intf /top/apb_pif/pwdata
add wave -noupdate -group apb_intf /top/apb_pif/prdata
add wave -noupdate -group apb_intf /top/apb_pif/pslverr
add wave -noupdate -group apb_intf /top/apb_pif/pready
add wave -noupdate -group apb_intf /top/apb_pif/scan_en
add wave -noupdate -group apb_intf /top/apb_pif/idle
add wave -noupdate -group apb_intf /top/apb_pif/INT
add wave -noupdate -expand -group axi_intf /top/axi_pif/clk
add wave -noupdate -expand -group axi_intf /top/axi_pif/reset
add wave -noupdate -expand -group axi_intf -expand -group wr_addr_channel /top/axi_pif/awid
add wave -noupdate -expand -group axi_intf -expand -group wr_addr_channel /top/axi_pif/awaddr
add wave -noupdate -expand -group axi_intf -expand -group wr_addr_channel /top/axi_pif/awlen
add wave -noupdate -expand -group axi_intf -expand -group wr_addr_channel /top/axi_pif/awsize
add wave -noupdate -expand -group axi_intf -expand -group wr_addr_channel /top/axi_pif/awvalid
add wave -noupdate -expand -group axi_intf -expand -group wr_addr_channel /top/axi_pif/awready
add wave -noupdate -expand -group axi_intf -expand -group wr_data_channel /top/axi_pif/wid
add wave -noupdate -expand -group axi_intf -expand -group wr_data_channel /top/axi_pif/wdata
add wave -noupdate -expand -group axi_intf -expand -group wr_data_channel /top/axi_pif/wstrb
add wave -noupdate -expand -group axi_intf -expand -group wr_data_channel /top/axi_pif/wlast
add wave -noupdate -expand -group axi_intf -expand -group wr_data_channel /top/axi_pif/wvalid
add wave -noupdate -expand -group axi_intf -expand -group wr_data_channel /top/axi_pif/wready
add wave -noupdate -expand -group axi_intf -group wr_resp_channel /top/axi_pif/bid
add wave -noupdate -expand -group axi_intf -group wr_resp_channel /top/axi_pif/bresp
add wave -noupdate -expand -group axi_intf -group wr_resp_channel /top/axi_pif/bvalid
add wave -noupdate -expand -group axi_intf -group wr_resp_channel /top/axi_pif/bready
add wave -noupdate -expand -group axi_intf -expand -group rd_addr_channel /top/axi_pif/arid
add wave -noupdate -expand -group axi_intf -expand -group rd_addr_channel /top/axi_pif/araddr
add wave -noupdate -expand -group axi_intf -expand -group rd_addr_channel /top/axi_pif/arlen
add wave -noupdate -expand -group axi_intf -expand -group rd_addr_channel /top/axi_pif/arsize
add wave -noupdate -expand -group axi_intf -expand -group rd_addr_channel /top/axi_pif/arvalid
add wave -noupdate -expand -group axi_intf -expand -group rd_addr_channel /top/axi_pif/arready
add wave -noupdate -expand -group axi_intf -expand -group rd_data_channel /top/axi_pif/rid
add wave -noupdate -expand -group axi_intf -expand -group rd_data_channel /top/axi_pif/rdata
add wave -noupdate -expand -group axi_intf -expand -group rd_data_channel /top/axi_pif/rresp
add wave -noupdate -expand -group axi_intf -expand -group rd_data_channel /top/axi_pif/rlast
add wave -noupdate -expand -group axi_intf -expand -group rd_data_channel /top/axi_pif/rvalid
add wave -noupdate -expand -group axi_intf -expand -group rd_data_channel /top/axi_pif/rready
add wave -noupdate -expand -group periph_intf /top/periph_pif/clk
add wave -noupdate -expand -group periph_intf /top/periph_pif/reset
add wave -noupdate -expand -group periph_intf /top/periph_pif/periph_tx_req
add wave -noupdate -expand -group periph_intf /top/periph_pif/periph_tx_clr
add wave -noupdate -expand -group periph_intf /top/periph_pif/periph_rx_req
add wave -noupdate -expand -group periph_intf /top/periph_pif/periph_rx_clr
add wave -noupdate -group AADDR_DEBUG /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_axim_rd/dma_axi64_axim_rcmd/AADDR_pre
add wave -noupdate -group AADDR_DEBUG /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_axim_rd/dma_axi64_axim_rcmd/burst_start
add wave -noupdate -group AADDR_DEBUG /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_axim_rd/dma_axi64_axim_rcmd/next_burst_start
add wave -noupdate -group ch_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_ctrl_rd/ch_ready
add wave -noupdate -group ch_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/rd_ready
add wave -noupdate -group ch_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/wr_ready
add wave -noupdate -group ch_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/joint_mode
add wave -noupdate -group ch_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/joint_req
add wave -noupdate -group ch_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/rd_ready_joint
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/rd_stall
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/rd_clr_stall
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/ch_rd_active
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/rd_periph_ready
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/load_req_in_prog
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/rd_wait_ready
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/rd_burst_ready
add wave -noupdate -group rd_ready_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/rd_ready
add wave -noupdate -group rd_burst_max_size_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_burst_max_size_reg
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_apb_mux/prdata0
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_apb_mux/prdata_reg
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_channels_apb_mux/mux_prdata/sel
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_channels_apb_mux/mux_prdata/x
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_channels_apb_mux/mux_prdata/ch_x
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/prdata_pre
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/gpread
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/pclken
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_static_line1
add wave -noupdate -group reg_debug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch1/dma_axi64_ch_reg/gpread
add wave -noupdate -group static_reg0_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_static_line0
add wave -noupdate -group static_reg0_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_outs_max
add wave -noupdate -group static_reg1_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_static_line1
add wave -noupdate -group static_reg1_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/wr_outstanding
add wave -noupdate -group static_reg1_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/wr_outs_max
add wave -noupdate -group static_reg2_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_static_line2
add wave -noupdate -group static_reg2_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/joint_reg
add wave -noupdate -group restrict_reg_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_restrict
add wave -noupdate -group restrict_reg_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_allow_full_fifo
add wave -noupdate -group restrict_reg_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/wr_allow_full_fifo
add wave -noupdate -group restrict_reg_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/allow_full_fifo
add wave -noupdate -group cmd_out_reg_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_cmd_outs
add wave -noupdate -group cmd_out_reg_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/rd_outs
add wave -noupdate -group cmd_out_reg_bug /top/dut/dma_axi64_dual_core/dma_axi64_core0_top/dma_axi64_core0/dma_axi64_core0_channels/dma_axi64_core0_ch0/dma_axi64_ch_reg/wr_outs
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {49967 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 177
configure wave -valuecolwidth 111
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {662568 ps}
