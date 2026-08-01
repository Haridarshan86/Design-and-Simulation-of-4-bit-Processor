`timescale 1ns/1ps

module processor_tb;

    // Inputs
    reg clk;
    reg reset;

    // Instantiate Processor
    processor_top uut (
        .clk(clk),
        .reset(reset)
    );

    //--------------------------------------------------
    // Clock Generation (10 ns period)
    //--------------------------------------------------
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    //--------------------------------------------------
    // Reset Sequence
    //--------------------------------------------------
    initial begin
        reset = 1;
        #20;
        reset = 0;
    end

    //--------------------------------------------------
    // Monitor Signals
    //--------------------------------------------------
    initial begin
        $display("--------------------------------------------------------------------------");
        $display(" Time | PC | Instruction | Opcode | RegWrite | MemWrite | ALU Result");
        $display("--------------------------------------------------------------------------");

        $monitor("%4t | %2d | %b | %b |    %b     |     %b     | %d",
                 $time,
                 uut.pc,
                 uut.instruction,
                 uut.opcode,
                 uut.reg_write,
                 uut.mem_write,
                 uut.alu_result);
    end

    //--------------------------------------------------
    // End Simulation
    //--------------------------------------------------
    initial begin
        #200;

        $display("\n================ FINAL REGISTER VALUES ================");
        $display("R0 = %d", uut.RF.regfile[0]);
        $display("R1 = %d", uut.RF.regfile[1]);
        $display("R2 = %d", uut.RF.regfile[2]);
        $display("R3 = %d", uut.RF.regfile[3]);

        $display("\n================ FINAL DATA MEMORY ====================");
        $display("MEM[0] = %d", uut.DM.memory[0]);
        $display("MEM[1] = %d", uut.DM.memory[1]);
        $display("MEM[2] = %d", uut.DM.memory[2]);
        $display("MEM[3] = %d", uut.DM.memory[3]);

        $display("\nSimulation Finished Successfully.");
        $finish;
    end

endmodule