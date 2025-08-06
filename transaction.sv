// transaction.sv
class transaction;
    // ALU inputs
    rand bit [15:0] a;
    rand bit [15:0] b;
    rand bit [3:0] sel;

    // ALU output
    bit [32:0] alu_out;

    function void display(string name);
        $display("[%s] A: %h, B: %h, SEL: %b, ALU_OUT: %h", name, a, b, sel, alu_out);
    endfunction
endclass