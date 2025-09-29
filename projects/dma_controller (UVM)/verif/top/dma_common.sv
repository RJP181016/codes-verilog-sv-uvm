`define NEW_COMP \
   function new(string name = "", uvm_component parent = null); \
    super.new(name,parent);\
 endfunction 
 
 `define NEW_OBJ\
 function new(string name = ""); \
    super.new(name); \
 endfunction 

`define DMA_CMD_1_STORING_ADDR 			32'h90000
`define DMA_CMD_1_STORING_ADDR_UPPER	32'h9000
`define DMA_CMD_2_STORING_ADDR 			32'h90010
`define DMA_CMD_2_STORING_ADDR_UPPER	32'h9001
`define DMA_CMD_3_STORING_ADDR 			32'h90020
`define DMA_CMD_3_STORING_ADDR_UPPER	32'h9002

`define DMA_CMD_1_SOURCE_ADDR 			32'h30000
`define DMA_CMD_1_DEST_ADDR 			32'h40000
`define DMA_CMD_1_DEST_ADDR_S 			32'h43000
`define DMA_CMD_1_SET_INT 				1'b0
`define DMA_CMD_1_CMD_LAST 				1'b0
`define DMA_CMD_1_CMD_NEXT_ADDR 		`DMA_CMD_2_STORING_ADDR
`define DMA_CMD_1_CMD_NEXT_ADDR_UPPER 	`DMA_CMD_2_STORING_ADDR_UPPER

`define DMA_CMD_2_SOURCE_ADDR 			32'h50000
`define DMA_CMD_2_DEST_ADDR 			32'h60000
`define DMA_CMD_2_DEST_ADDR_S			32'h65000
`define DMA_CMD_2_SET_INT 				1'b0
`define DMA_CMD_2_CMD_LAST 				1'b0
`define DMA_CMD_2_CMD_NEXT_ADDR 		`DMA_CMD_3_STORING_ADDR
`define DMA_CMD_2_CMD_NEXT_ADDR_UPPER 	`DMA_CMD_3_STORING_ADDR_UPPER

`define DMA_CMD_3_SOURCE_ADDR 			32'h70000
`define DMA_CMD_3_DEST_ADDR 			32'h80000
`define DMA_CMD_3_DEST_ADDR_S			32'h82000
`define DMA_CMD_3_SET_INT 				1'b0
`define DMA_CMD_3_CMD_LAST 				1'b1
`define DMA_CMD_3_CMD_NEXT_ADDR 		28'b0

//CH0 registers
`define CH0_CMD_REG0_ADDR            	13'h0
`define CH0_CMD_REG1_ADDR            	13'h4
`define CH0_CMD_REG2_ADDR            	13'h8
`define CH0_CMD_REG3_ADDR            	13'hC
`define CH0_STATIC_REG0_ADDR         	13'h10
`define CH0_STATIC_REG1_ADDR         	13'h14
`define CH0_STATIC_REG2_ADDR         	13'h18
`define CH0_STATIC_REG3_ADDR         	13'h1C
`define CH0_STATIC_REG4_ADDR     	 	13'h20
//24, 28 are reserved
`define CH0_RESTRICT_REG_ADDR        	13'h2C
`define CH0_READ_OFFSET_REG_ADDR		13'h30
`define CH0_WRITE_OFFSET_REG_ADDR   	13'h34
`define CH0_FIFO_FULLNESS_REG_ADDR    	13'h38
`define CH0_CMD_OUTS_REG_ADDR        	13'h3C
`define CH0_CH_ENABLE_REG_ADDR        	13'h40
`define CH0_CH_START_REG_ADDR        	13'h44
`define CH0_CH_ACTIVE_REG_ADDR        	13'h48
//4C is reserved
`define CH0_COUNT_REG_ADDR            	13'h50
`define CH0_INT_RAWSTAT_REG_ADDR    	13'hA0
`define CH0_INT_CLEAR_REG_ADDR        	13'hA4
`define CH0_INT_ENABLE_REG_ADDR        	13'hA8
`define CH0_INT_STATUS_REG_ADDR        	13'hAC

//CH1 registers
`define CH1_CMD_REG0_ADDR             	13'h100 + 13'h0
`define CH1_CMD_REG1_ADDR             	13'h100 + 13'h4
`define CH1_CMD_REG2_ADDR             	13'h100 + 13'h8
`define CH1_CMD_REG3_ADDR             	13'h100 + 13'hC
`define CH1_STATIC_REG0_ADDR         	13'h100 + 13'h10
`define CH1_STATIC_REG1_ADDR         	13'h100 + 13'h14
`define CH1_STATIC_REG2_ADDR         	13'h100 + 13'h18
`define CH1_STATIC_REG3_ADDR         	13'h100 + 13'h1C
`define CH1_STATIC_REG4_ADDR         	13'h100 + 13'h20
//24, 28 are reserved
`define CH1_RESTRICT_REG_ADDR       	13'h100 + 13'h2C
`define CH1_READ_OFFSET_REG_ADDR    	13'h100 + 13'h30
`define CH1_WRITE_OFFSET_REG_ADDR   	13'h100 + 13'h34
`define CH1_FIFO_FULLNESS_REG_ADDR  	13'h100 + 13'h38
`define CH1_CMD_OUTS_REG_ADDR       	13'h100 + 13'h3C
`define CH1_CH_ENABLE_REG_ADDR      	13'h100 + 13'h40
`define CH1_CH_START_REG_ADDR       	13'h100 + 13'h44
`define CH1_CH_ACTIVE_REG_ADDR      	13'h100 + 13'h48
//4C is reserved
`define CH1_COUNT_REG_ADDR          	13'h100 + 13'h50
`define CH1_INT_RAWSTAT_REG_ADDR    	13'h100 + 13'hA0
`define CH1_INT_CLEAR_REG_ADDR      	13'h100 + 13'hA4
`define CH1_INT_ENABLE_REG_ADDR     	13'h100 + 13'hA8
`define CH1_INT_STATUS_REG_ADDR     	13'h100 + 13'hAC

//CH2 registers
`define CH2_CMD_REG0_ADDR           	13'h200 + 13'h0
`define CH2_CMD_REG1_ADDR           	13'h200 + 13'h4
`define CH2_CMD_REG2_ADDR           	13'h200 + 13'h8
`define CH2_CMD_REG3_ADDR           	13'h200 + 13'hC
`define CH2_STATIC_REG0_ADDR        	13'h200 + 13'h10
`define CH2_STATIC_REG1_ADDR        	13'h200 + 13'h14
`define CH2_STATIC_REG2_ADDR        	13'h200 + 13'h18
`define CH2_STATIC_REG3_ADDR        	13'h200 + 13'h1C
`define CH2_STATIC_REG4_ADDR        	13'h200 + 13'h20
//24, 28 are reserved
`define CH2_RESTRICT_REG_ADDR       	13'h200 + 13'h2C
`define CH2_READ_OFFSET_REG_ADDR    	13'h200 + 13'h30
`define CH2_WRITE_OFFSET_REG_ADDR   	13'h200 + 13'h34
`define CH2_FIFO_FULLNESS_REG_ADDR  	13'h200 + 13'h38
`define CH2_CMD_OUTS_REG_ADDR       	13'h200 + 13'h3C
`define CH2_CH_ENABLE_REG_ADDR      	13'h200 + 13'h40
`define CH2_CH_START_REG_ADDR       	13'h200 + 13'h44
`define CH2_CH_ACTIVE_REG_ADDR      	13'h200 + 13'h48
//4C is reserved
`define CH2_COUNT_REG_ADDR          	13'h200 + 13'h50
`define CH2_INT_RAWSTAT_REG_ADDR    	13'h200 + 13'hA0
`define CH2_INT_CLEAR_REG_ADDR      	13'h200 + 13'hA4
`define CH2_INT_ENABLE_REG_ADDR     	13'h200 + 13'hA8
`define CH2_INT_STATUS_REG_ADDR     	13'h200 + 13'hAC

//CH3 registers
`define CH3_CMD_REG0_ADDR           	13'h300 + 13'h0
`define CH3_CMD_REG1_ADDR           	13'h300 + 13'h4
`define CH3_CMD_REG2_ADDR           	13'h300 + 13'h8
`define CH3_CMD_REG3_ADDR           	13'h300 + 13'hC
`define CH3_STATIC_REG0_ADDR        	13'h300 + 13'h10
`define CH3_STATIC_REG1_ADDR        	13'h300 + 13'h14
`define CH3_STATIC_REG2_ADDR        	13'h300 + 13'h18
`define CH3_STATIC_REG3_ADDR        	13'h300 + 13'h1C
`define CH3_STATIC_REG4_ADDR        	13'h300 + 13'h20
`define CH3_RESTRICT_REG_ADDR       	13'h300 + 13'h2C
`define CH3_READ_OFFSET_REG_ADDR    	13'h300 + 13'h30
`define CH3_WRITE_OFFSET_REG_ADDR   	13'h300 + 13'h34
`define CH3_FIFO_FULLNESS_REG_ADDR  	13'h300 + 13'h38
`define CH3_CMD_OUTS_REG_ADDR       	13'h300 + 13'h3C
`define CH3_CH_ENABLE_REG_ADDR      	13'h300 + 13'h40
`define CH3_CH_START_REG_ADDR       	13'h300 + 13'h44
`define CH3_CH_ACTIVE_REG_ADDR      	13'h300 + 13'h48
//4C is re3erved
`define CH3_COUNT_REG_ADDR          	13'h300 + 13'h50
`define CH3_INT_RAWSTAT_REG_ADDR    	13'h300 + 13'hA0
`define CH3_INT_CLEAR_REG_ADDR      	13'h300 + 13'hA4
`define CH3_INT_ENABLE_REG_ADDR     	13'h300 + 13'hA8
`define CH3_INT_STATUS_REG_ADDR     	13'h300 + 13'hAC

//CH4 registers
`define CH4_CMD_REG0_ADDR           	13'h400 + 13'h0
`define CH4_CMD_REG1_ADDR           	13'h400 + 13'h4
`define CH4_CMD_REG2_ADDR           	13'h400 + 13'h8
`define CH4_CMD_REG3_ADDR           	13'h400 + 13'hC
`define CH4_STATIC_REG0_ADDR        	13'h400 + 13'h10
`define CH4_STATIC_REG1_ADDR        	13'h400 + 13'h14
`define CH4_STATIC_REG2_ADDR        	13'h400 + 13'h18
`define CH4_STATIC_REG3_ADDR        	13'h400 + 13'h1C
`define CH4_STATIC_REG4_ADDR        	13'h400 + 13'h20
`define CH4_RESTRICT_REG_ADDR       	13'h400 + 13'h2C
`define CH4_READ_OFFSET_REG_ADDR    	13'h400 + 13'h30
`define CH4_WRITE_OFFSET_REG_ADDR   	13'h400 + 13'h34
`define CH4_FIFO_FULLNESS_REG_ADDR  	13'h400 + 13'h38
`define CH4_CMD_OUTS_REG_ADDR       	13'h400 + 13'h3C
`define CH4_CH_ENABLE_REG_ADDR      	13'h400 + 13'h40
`define CH4_CH_START_REG_ADDR       	13'h400 + 13'h44
`define CH4_CH_ACTIVE_REG_ADDR      	13'h400 + 13'h48
//4C is re4erved
`define CH4_COUNT_REG_ADDR          	13'h400 + 13'h50
`define CH4_INT_RAWSTAT_REG_ADDR    	13'h400 + 13'hA0
`define CH4_INT_CLEAR_REG_ADDR      	13'h400 + 13'hA4
`define CH4_INT_ENABLE_REG_ADDR     	13'h400 + 13'hA8
`define CH4_INT_STATUS_REG_ADDR     	13'h400 + 13'hAC

//CH5 registers
`define CH5_CMD_REG0_ADDR           	13'h500 + 13'h0
`define CH5_CMD_REG1_ADDR           	13'h500 + 13'h4
`define CH5_CMD_REG2_ADDR           	13'h500 + 13'h8
`define CH5_CMD_REG3_ADDR           	13'h500 + 13'hC
`define CH5_STATIC_REG0_ADDR        	13'h500 + 13'h10
`define CH5_STATIC_REG1_ADDR        	13'h500 + 13'h14
`define CH5_STATIC_REG2_ADDR        	13'h500 + 13'h18
`define CH5_STATIC_REG3_ADDR        	13'h500 + 13'h1C
`define CH5_STATIC_REG4_ADDR        	13'h500 + 13'h20
`define CH5_RESTRICT_REG_ADDR       	13'h500 + 13'h2C
`define CH5_READ_OFFSET_REG_ADDR    	13'h500 + 13'h30
`define CH5_WRITE_OFFSET_REG_ADDR   	13'h500 + 13'h34
`define CH5_FIFO_FULLNESS_REG_ADDR  	13'h500 + 13'h38
`define CH5_CMD_OUTS_REG_ADDR       	13'h500 + 13'h3C
`define CH5_CH_ENABLE_REG_ADDR      	13'h500 + 13'h40
`define CH5_CH_START_REG_ADDR       	13'h500 + 13'h44
`define CH5_CH_ACTIVE_REG_ADDR      	13'h500 + 13'h48
//4C is re5erved
`define CH5_COUNT_REG_ADDR          	13'h500 + 13'h50
`define CH5_INT_RAWSTAT_REG_ADDR    	13'h500 + 13'hA0
`define CH5_INT_CLEAR_REG_ADDR      	13'h500 + 13'hA4
`define CH5_INT_ENABLE_REG_ADDR     	13'h500 + 13'hA8
`define CH5_INT_STATUS_REG_ADDR     	13'h500 + 13'hAC

//CH6 registers
`define CH6_CMD_REG0_ADDR           	13'h600 + 13'h0
`define CH6_CMD_REG1_ADDR           	13'h600 + 13'h4
`define CH6_CMD_REG2_ADDR           	13'h600 + 13'h8
`define CH6_CMD_REG3_ADDR           	13'h600 + 13'hC
`define CH6_STATIC_REG0_ADDR        	13'h600 + 13'h10
`define CH6_STATIC_REG1_ADDR        	13'h600 + 13'h14
`define CH6_STATIC_REG2_ADDR        	13'h600 + 13'h18
`define CH6_STATIC_REG3_ADDR        	13'h600 + 13'h1C
`define CH6_STATIC_REG4_ADDR        	13'h600 + 13'h20
`define CH6_RESTRICT_REG_ADDR       	13'h600 + 13'h2C
`define CH6_READ_OFFSET_REG_ADDR    	13'h600 + 13'h30
`define CH6_WRITE_OFFSET_REG_ADDR   	13'h600 + 13'h34
`define CH6_FIFO_FULLNESS_REG_ADDR  	13'h600 + 13'h38
`define CH6_CMD_OUTS_REG_ADDR       	13'h600 + 13'h3C
`define CH6_CH_ENABLE_REG_ADDR      	13'h600 + 13'h40
`define CH6_CH_START_REG_ADDR       	13'h600 + 13'h44
`define CH6_CH_ACTIVE_REG_ADDR      	13'h600 + 13'h48
//4C is re6erved
`define CH6_COUNT_REG_ADDR          	13'h600 + 13'h50
`define CH6_INT_RAWSTAT_REG_ADDR    	13'h600 + 13'hA0
`define CH6_INT_CLEAR_REG_ADDR      	13'h600 + 13'hA4
`define CH6_INT_ENABLE_REG_ADDR     	13'h600 + 13'hA8
`define CH6_INT_STATUS_REG_ADDR     	13'h600 + 13'hAC

//CH7 registers
`define CH7_CMD_REG0_ADDR           	13'h700 + 13'h0
`define CH7_CMD_REG1_ADDR           	13'h700 + 13'h4
`define CH7_CMD_REG2_ADDR           	13'h700 + 13'h8
`define CH7_CMD_REG3_ADDR           	13'h700 + 13'hC
`define CH7_STATIC_REG0_ADDR        	13'h700 + 13'h10
`define CH7_STATIC_REG1_ADDR        	13'h700 + 13'h14
`define CH7_STATIC_REG2_ADDR        	13'h700 + 13'h18
`define CH7_STATIC_REG3_ADDR        	13'h700 + 13'h1C
`define CH7_STATIC_REG4_ADDR        	13'h700 + 13'h20
`define CH7_RESTRICT_REG_ADDR       	13'h700 + 13'h2C
`define CH7_READ_OFFSET_REG_ADDR    	13'h700 + 13'h30
`define CH7_WRITE_OFFSET_REG_ADDR   	13'h700 + 13'h34
`define CH7_FIFO_FULLNESS_REG_ADDR  	13'h700 + 13'h38
`define CH7_CMD_OUTS_REG_ADDR       	13'h700 + 13'h3C
`define CH7_CH_ENABLE_REG_ADDR      	13'h700 + 13'h40
`define CH7_CH_START_REG_ADDR       	13'h700 + 13'h44
`define CH7_CH_ACTIVE_REG_ADDR      	13'h700 + 13'h48
//4C is re7erved
`define CH7_COUNT_REG_ADDR          	13'h700 + 13'h50
`define CH7_INT_RAWSTAT_REG_ADDR    	13'h700 + 13'hA0
`define CH7_INT_CLEAR_REG_ADDR      	13'h700 + 13'hA4
`define CH7_INT_ENABLE_REG_ADDR     	13'h700 + 13'hA8
`define CH7_INT_STATUS_REG_ADDR     	13'h700 + 13'hAC

//SHARED registers
`define INT0_STATUS_ADDR            	13'h1000
`define CORE0_JOINT_MODE_ADDR       	13'h1030
`define CORE0_PRIORITY_ADDR         	13'h1038
`define CORE0_CH_START_ADDR         	13'h1048
`define PERIPH_RX_CTRL_ADDR         	13'h1050
`define PERIPH_TX_CTRL_ADDR         	13'h1054
`define IDLE_ADDR                   	13'h10D0
`define USER_DEF_STATUS_ADDR        	13'h10E0
`define USER_CORE0_DEF_STATUS0_ADDR 	13'h10F0
`define USER_CORE0_DEF_STATUS1_ADDR 	13'h10F4

`define CHANNEL_REG_COUNT       		24
`define SHARED_REG_COUNT        		10

//CORE1 registers	//CHANGED
`define CORE0_CLKDIV_ADDR           	13'h1040
`define INT1_STATUS_ADDR            	13'h1004
`define INT2_STATUS_ADDR            	13'h1008
`define INT3_STATUS_ADDR            	13'h100C
`define INT4_STATUS_ADDR            	13'h1010
`define INT5_STATUS_ADDR            	13'h1014
`define INT6_STATUS_ADDR            	13'h1018
`define INT7_STATUS_ADDR            	13'h101C
`define CORE1_JOINT_MODE_ADDR       	13'h1034
`define CORE1_PRIORITY_ADDR         	13'h103C
`define CORE1_CLKDIV_ADDR           	13'h1044
`define CORE1_CH_START_ADDR         	13'h104C
`define USER_CORE1_DEF_STATUS0_ADDR 	13'h10F8
`define USER_CORE1_DEF_STATUS1_ADDR 	13'h10FC

