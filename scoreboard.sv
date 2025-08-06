// scoreboard.sv
class scoreboard;
    mailbox #(transaction) mon2scb_mbox;
    int pass_count = 0;
    int fail_count = 0;

    function new(mailbox #(transaction) mon2scb_mbox);
        this.mon2scb_mbox = mon2scb_mbox;
    endfunction

    task run();
        forever begin
            transaction trans, ref_trans;
            mon2scb_mbox.get(trans);
            ref_trans = new();

            // Reference model
            ref_trans.a = trans.a;
            ref_trans.b = trans.b;
            ref_trans.sel = trans.sel;
            calculate_expected(ref_trans);

            // Comparison
            if (ref_trans.alu_out == trans.alu_out) begin
                $display("[SCB-PASS] A=%h, B=%h, SEL=%b -> OUT=%h", trans.a, trans.b, trans.sel, trans.alu_out);
                pass_count++;
            end else begin
                $error("[SCB-FAIL] A=%h, B=%h, SEL=%b -> DUT_OUT=%h, EXP_OUT=%h", trans.a, trans.b, trans.sel, trans.alu_out, ref_trans.alu_out);
                fail_count++;
            end
        end
    endtask

    function void calculate_expected(transaction t);
        case (t.sel)
            4'b0000: t.alu_out = t.a + t.b;
            4'b0001: t.alu_out = t.a - t.b;
            4'b0010: t.alu_out = t.a * t.b;
            4'b0011: t.alu_out = (t.b == 0) ? 0 : t.a / t.b;
            4'b0100: t.alu_out = t.a & t.b;
            4'b0101: t.alu_out = t.a | t.b;
            4'b0110: t.alu_out = ~(t.a & t.b);
            4'b0111: t.alu_out = ~(t.a | t.b);
            4'b1000: t.alu_out = t.a << 1;
            4'b1001: t.alu_out = t.a >> 1;
            4'b1010: t.alu_out = {t.a[14:0], t.a[15]};
            4'b1011: t.alu_out = {t.a[0], t.a[15:1]};
            4'b1100: t.alu_out = t.a ^ t.b;
            4'b1101: t.alu_out = ~(t.a ^ t.b);
            4'b1110: t.alu_out = (t.a > t.b);
            4'b1111: t.alu_out = (t.a == t.b);
            default: t.alu_out = 0;
        endcase
    endfunction
    
    function void report();
        $display("\n-----------------SIMULATION REPORT-----------------");
        $display("PASS COUNT: %0d", pass_count);
        $display("FAIL COUNT: %0d", fail_count);
        $display("-------------------------------------------------");
    endfunction
endclass