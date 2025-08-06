// test.sv
program test(alu_if ifc);
    environment env;

    initial begin
        env = new(ifc);
        env.run_test(100); // Run 100 random transactions
        $finish;
    end
endprogram