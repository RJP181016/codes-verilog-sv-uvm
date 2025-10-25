module InstructionMemory
(
    output logic [31:0]   instruction_data_o,
    input  logic [31:0]   instruction_address_i
);

    logic [31:0]instruction [63:0];

    initial
    begin
        $readmemh("loop_to_add_numbers.hex",instruction); 
        //$readmemh("add.s",instruction); 
    end

    always_comb
    begin
        assign instruction_data_o = instruction[instruction_address_i[31:2]];
    end
endmodule
