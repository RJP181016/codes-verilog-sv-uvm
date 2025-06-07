`define NUM_SLAVE 6
`define S0_START 32'h1000_0000
`define S0_END 32'h2000_0000
`define S1_START 32'h2000_0000
`define S1_END 32'h3000_0000
`define S2_START 32'h3000_0000
`define S2_END 32'h4000_0000
`define S3_START 32'h4000_0000
`define S3_END 32'h5000_0000
`define S4_START 32'h5000_0000
`define S4_END 32'h6000_0000
`define S5_START 32'h6000_0000
`define S5_END 32'h7000_0000

class mem_cfg;
static bit [`NUM_SLAVE-1:0] target_slave;
static bit [`NUM_SLAVE-1:0] target_slaveQ[$:`NUM_SLAVE-1];
static bit [31:0] start_addr[`NUM_SLAVE] = '{`S0_START, `S1_START, `S2_START, `S3_START, `S4_START, `S5_START};
static bit [31:0] end_addr[`NUM_SLAVE] = '{`S0_END, `S1_END, `S2_END, `S3_END, `S4_END, `S5_END};

endclass
