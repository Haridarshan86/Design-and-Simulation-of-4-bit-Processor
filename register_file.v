module register_file(
    input clk,
    input we,

    input [1:0] read_addr1,
    input [1:0] read_addr2,

    input [1:0] write_addr,
    input [3:0] write_data,

    output [3:0] read_data1,
    output [3:0] read_data2
);

    // Four 4-bit registers
    reg [3:0] regfile [0:3];

    //--------------------------------------------------
    // Initialize registers
    //--------------------------------------------------
    initial begin
        regfile[0] = 4'd1;   // R0 = 1
        regfile[1] = 4'd2;   // R1 = 2
        regfile[2] = 4'd0;   // R2 = 0
        regfile[3] = 4'd0;   // R3 = 0
    end

    //--------------------------------------------------
    // Asynchronous Read
    //--------------------------------------------------
    assign read_data1 = regfile[read_addr1];
    assign read_data2 = regfile[read_addr2];

    //--------------------------------------------------
    // Synchronous Write
    //--------------------------------------------------
    always @(posedge clk)
    begin
        if (we)
            regfile[write_addr] <= write_data;
    end

endmodule