module instruction_memory(
    input [3:0] address,
    output [7:0] instruction
);

    // 16 x 8-bit ROM
    reg [7:0] memory [0:15];

    initial begin
        // PC = 0 : LOAD R0 <- MEM[0]
        memory[0] = 8'b01010000;

        // PC = 1 : LOAD R1 <- MEM[1]
        memory[1] = 8'b01010101;

        // PC = 2 : ADD R2 = R2 + R1
        memory[2] = 8'b00001001;

        // PC = 3 : SUB R2 = R2 - R1
        memory[3] = 8'b00011001;

        // PC = 4 : AND R2 = R2 & R1
        memory[4] = 8'b00101001;

        // PC = 5 : OR R2 = R2 | R1
        memory[5] = 8'b00111001;

        // PC = 6 : XOR R2 = R2 ^ R1
        memory[6] = 8'b01001001;

        // PC = 7 : STORE R0 -> MEM[2]
        memory[7] = 8'b01100010;

        // PC = 8 : HALT
        memory[8] = 8'b11110000;

        // Unused instructions
        memory[9]  = 8'b00000000;
        memory[10] = 8'b00000000;
        memory[11] = 8'b00000000;
        memory[12] = 8'b00000000;
        memory[13] = 8'b00000000;
        memory[14] = 8'b00000000;
        memory[15] = 8'b00000000;

    end

    assign instruction = memory[address];

endmodule