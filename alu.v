module alu( input[3:0] A,input[3:0]B,input[2:0] ALU_Sel,output reg[3:0]Result,output Zero,output reg Carry);

always @(*) begin
    Carry = 0;
case(ALU_Sel)

3'b000: begin            // ADD
{Carry, Result} = A + B;
end

3'b001: begin             // SUB
{Carry, Result} = A - B;
end

3'b010: begin             // AND
Result = A & B;
end

3'b011: begin             // OR
Result = A | B;
end

3'b100: begin             // XOR
Result = A ^ B;
end

3'b101: begin             // NOT
Result = ~A;
end

3'b110: begin             // INC
Result = A + 1;
end

3'b111: begin            // PASS
Result = A;
end

endcase
end
assign Zero=(Result == 4'b0000);
endmodule