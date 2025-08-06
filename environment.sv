// environment.sv
class environment;
    generator gen;
    driver drv;
    monitor mon;
    scoreboard scb;
    coverage cov;

    mailbox #(transaction) gen2drv_mbox;
    mailbox #(transaction) mon2scb_mbox;

    virtual alu_if vif;

    function new(virtual alu_if vif);
        this.vif = vif;
        gen2drv_mbox = new();
        mon2scb_mbox = new();
        
        gen = new(gen2drv_mbox);
        drv = new(vif, gen2drv_mbox);
        cov = new(vif);
        mon = new(vif, mon2scb_mbox, cov);
        scb = new(mon2scb_mbox);
    endfunction

    task run_test(int count);
        fork
            gen.run(count);
            drv.run();
            mon.run();
            scb.run();
        join_any
        
        # (count * 15);
        scb.report();
        $display("Functional Coverage: %f%%", cov.cg_alu.get_coverage());
    endtask
endclass