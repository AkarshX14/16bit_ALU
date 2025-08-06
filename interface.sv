// interface.sv
interface alu_if (input clk, input rst);
    logic [15:0] a;
    logic [15:0] b;
    logic [3:0] sel;
    logic [32:0] alu_out;
endinterface