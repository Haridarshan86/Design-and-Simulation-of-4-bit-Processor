module control_unit(
input [3:0] opcode,
output reg reg_write,
output reg mem_write,
output reg [2:0] alu_sel
);
always @(*) begin
reg_write = 0;
mem_write = 0;
alu_sel = 3'b000;

case(opcode)

 4'b0000: begin
reg_write = 1;
alu_sel = 3'b000;      // ADD
end

4'b0001: begin
reg_write = 1;
alu_sel = 3'b001;      // SUB
end

4'b0010: begin
reg_write = 1;
alu_sel = 3'b010;      // AND
end

4'b0011: begin
reg_write = 1;
alu_sel = 3'b011;      // OR
end

4'b0100: begin
reg_write = 1;
alu_sel = 3'b100;      // XOR
end

4'b0110: begin
mem_write = 1;         // STORE
end

4'b0101: begin
reg_write = 1;      // LOAD
end

4'b1111: begin
reg_write = 0;
mem_write = 0;      // HALT
end

default: begin
reg_write = 0;
mem_write = 0;
end

endcase
end
endmodule