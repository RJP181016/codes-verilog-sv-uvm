onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top_tb/wb_clk
add wave -noupdate /top_tb/wb_rst
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_clk_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_rst_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_cyc_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_stb_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_ack_o
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_we_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_adr_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_dat_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_sel_i
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_dat_o
add wave -noupdate -expand -group wb_proc_intf /top_tb/wb_proc_pif/wb_err_o
add wave -noupdate -expand -group wb_proc_intf /top_tb/dut/int_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/wb_clk
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/wb_rst
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_adr_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_dat_i
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_dat_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_we_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_sel_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_cyc_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_stb_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_ack_i
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_err_i
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_cti_o
add wave -noupdate -expand -group wb_mem_intf /top_tb/wb_mem_pif/m_wb_bte_o
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mtx_clk_pad_i
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mtxd_pad_o
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mtxen_pad_o
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mtxerr_pad_o
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mrx_clk_pad_i
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mrxd_pad_i
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mrxdv_pad_i
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mrxerr_pad_i
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mcoll_pad_i
add wave -noupdate -expand -group phy_intf /top_tb/phy_pif/mcrs_pad_i
add wave -noupdate -group mii_intf /top_tb/mii_pif/md_pad_i
add wave -noupdate -group mii_intf /top_tb/mii_pif/mdc_pad_o
add wave -noupdate -group mii_intf /top_tb/mii_pif/md_pad_o
add wave -noupdate -group mii_intf /top_tb/mii_pif/md_padoe_o
add wave -noupdate /top_tb/dut/maccontrol1/receivecontrol1/PauseTimer
add wave -noupdate -group carrier_lost_debug /top_tb/dut/ethreg1/irq_txe
add wave -noupdate -group carrier_lost_debug /top_tb/dut/ethreg1/INT_SOURCE_Wr
add wave -noupdate -group carrier_lost_debug /top_tb/dut/wishbone/TxUnderRun
add wave -noupdate -group carrier_lost_debug /top_tb/dut/wishbone/RetryLimit
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/Loopback
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/TxStartFrm
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/CarrierSense
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/Loopback
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/Collision
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/r_FullD
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/StatePreamble
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/StateData
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/Reset
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/MTxClk
add wave -noupdate -group carrier_lost_debug /top_tb/dut/macstatus1/CarrierSenseLost
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {48246 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 232
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
WaveRestoreZoom {0 ns} {50899 ns}
