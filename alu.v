// alu.v
// Design Under Test: 16-bit ALU

module alu (
    input clk,
    input rst,
    input [15:0] a,
    input [15:0] b,
    input [3:0] sel,
    output reg [32:0] alu_out
);

    // Operations based on Table 1 from the paper [cite: 118, 124]
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            alu_out <= 0;
        end else begin
            case (sel)
                4'b0000: alu_out <= a + b;           // Addition
                4'b0001: alu_out <= a - b;           // Subtraction
                4'b0010: alu_out <= a * b;           // Multiplication
                4'b0011: alu_out <= (b == 0) ? 0 : a / b; // Division
                4'b0100: alu_out <= a & b;           // AND
                4'b0101: alu_out <= a | b;           // OR
                4'b0110: alu_out <= ~(a & b);        // NAND
                4'b0111: alu_out <= ~(a | b);        // NOR
                4'b1000: alu_out <= a << 1;          // Logical shift left
                4'b1001: alu_out <= a >> 1;          // Logical shift right
                4'b1010: alu_out <= {a[14:0], a[15]}; // Rotate left
                4'b1011: alu_out <= {a[0], a[15:1]};  // Rotate right
                4'b1100: alu_out <= a ^ b;           // Logical xor
                4'b1101: alu_out <= ~(a ^ b);        // Logical xnor
                4'b1110: alu_out <= (a > b);         // Greater comparison
                4'b1111: alu_out <= (a == b);        // Equal comparison
                default: alu_out <= 0;
            endcase
        end
    end
endmodule