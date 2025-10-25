`include "top.sv"

module top_tb;

    reg clk, reset;
	logic [31:0] write_data,data_address;
	logic write_enable;


    top dut
    (
        .clk                  (clk),
        .reset                (reset),

        .write_data           (write_data),
        .data_address         (data_address),
        .write_enable         (write_enable)
    );

	initial begin
		clk=0;
		forever #1 clk = ~clk;
	end

	initial begin
		reset=0;
		#1;
		reset=1;
		reset_o();
		#1;
		reset=0;
		#100;
		$finish;
	end

	task reset_o();
		write_data=0;
		data_address=0;
		write_enable=0;
	endtask

endmodule

