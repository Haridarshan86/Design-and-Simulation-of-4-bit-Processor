module processor_top(
    input clk,
    input reset
);

//--------------------------------------------------
// Internal Wires
//--------------------------------------------------
wire [3:0] pc;
wire [7:0] instruction;

// Instruction fields
wire [3:0] opcode;
wire [1:0] rd;
wire [1:0] rs;

// Control Unit
wire reg_write;
wire mem_write;
wire [2:0] alu_sel;

// Program Counter Enable
wire pc_enable;

// Register File
wire [3:0] read_data1;
wire [3:0] read_data2;
wire [3:0] write_data;

// ALU
wire [3:0] alu_result;
wire zero;
wire carry;

// Data Memory
wire [3:0] mem_data;

//--------------------------------------------------
// Decode Instruction
//--------------------------------------------------
assign opcode = instruction[7:4];
assign rd     = instruction[3:2];
assign rs     = instruction[1:0];

//--------------------------------------------------
// HALT Control
//--------------------------------------------------
assign pc_enable = (opcode == 4'b1111) ? 1'b0 : 1'b1;

//--------------------------------------------------
// Program Counter
//--------------------------------------------------
program_counter PC(
    .clk(clk),
    .reset(reset),
    .enable(pc_enable),
    .pc(pc)
);

//--------------------------------------------------
// Instruction Memory
//--------------------------------------------------
instruction_memory IM(
    .address(pc),
    .instruction(instruction)
);

//--------------------------------------------------
// Control Unit
//--------------------------------------------------
control_unit CU(
    .opcode(opcode),
    .reg_write(reg_write),
    .mem_write(mem_write),
    .alu_sel(alu_sel)
);

//--------------------------------------------------
// Register File
//--------------------------------------------------
register_file RF(
    .clk(clk),
    .we(reg_write),
    .read_addr1(rd),
    .read_addr2(rs),
    .write_addr(rd),
    .write_data(write_data),
    .read_data1(read_data1),
    .read_data2(read_data2)
);

//--------------------------------------------------
// ALU
//--------------------------------------------------
alu ALU(
    .A(read_data1),
    .B(read_data2),
    .ALU_Sel(alu_sel),
    .Result(alu_result),
    .Zero(zero),
    .Carry(carry)
);

//--------------------------------------------------
// Data Memory
//--------------------------------------------------
data_memory DM(
    .clk(clk),
    .we(mem_write),
    .address({2'b00, rs}),
    .write_data(read_data1),
    .read_data(mem_data)
);

//--------------------------------------------------
// Write Back MUX
//--------------------------------------------------
assign write_data =
    (opcode == 4'b0101) ? mem_data : alu_result;

endmodule