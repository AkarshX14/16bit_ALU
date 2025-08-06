module top;
    // Clock and Reset generation
    bit clk;
    bit rst;

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10;
        rst = 0;
    end

    // Instantiate interface
    alu_if ifc(clk, rst);

    // Instantiate DUT
    alu dut (
        .clk(ifc.clk),
        .rst(ifc.rst),
        .a(ifc.a),
        .b(ifc.b),
        .sel(ifc.sel),
        .alu_out(ifc.alu_out)
    );

    // Instantiate Test Program
    test test_inst(ifc);

endmodule




//`timescale 1ns / 1ps

//module top;
//    // Clock and Reset generation
//    bit clk;
//    bit rst;

//    always #5 clk = ~clk;

//    initial begin
//        clk = 0;
//        rst = 1;
//        #10;
//        rst = 0;
//    end

//    // Instantiate interface
//    alu_if ifc(clk, rst);

//    // Instantiate DUT
//    alu dut (
//        .clk(ifc.clk),
//        .rst(ifc.rst),
//        .a(ifc.a),
//        .b(ifc.b),
//        .sel(ifc.sel),
//        .alu_out(ifc.alu_out)
//    );

//    // Instantiate Test Program
//    test test_inst(ifc);

//    // Waveform dump (Vivado compatible - optional for VCD dump)
//    initial begin
//        $dumpfile("alu_waveform.vcd");
//        $dumpvars(0, top);
//    end
//endmodule
