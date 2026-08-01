module data_memory(
    input clk,
    input we,
    input [3:0] address,
    input [3:0] write_data,
    output [3:0] read_data
);

    // 16 locations, each 4 bits
    reg [3:0] memory [0:15];

    //--------------------------------------------------
    // Initialize Data Memory
    //--------------------------------------------------
    initial begin
        memory[0]  = 4'd5;
        memory[1]  = 4'd3;
        memory[2]  = 4'd8;
        memory[3]  = 4'd10;
        memory[4]  = 4'd0;
        memory[5]  = 4'd0;
        memory[6]  = 4'd0;
        memory[7]  = 4'd0;
        memory[8]  = 4'd0;
        memory[9]  = 4'd0;
        memory[10] = 4'd0;
        memory[11] = 4'd0;
        memory[12] = 4'd0;
        memory[13] = 4'd0;
        memory[14] = 4'd0;
        memory[15] = 4'd0;
    end

    //--------------------------------------------------
    // Write Operation
    //--------------------------------------------------
    always @(posedge clk)
    begin
        if (we)
            memory[address] <= write_data;
    end

    //--------------------------------------------------
    // Read Operation
    //--------------------------------------------------
    assign read_data = memory[address];

endmodule