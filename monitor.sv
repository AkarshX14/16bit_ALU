// monitor.sv
class monitor;
    virtual alu_if vif;
    mailbox #(transaction) mon2scb_mbox;
    coverage cov;

    function new(virtual alu_if vif, mailbox #(transaction) mon2scb_mbox, coverage cov);
        this.vif = vif;
        this.mon2scb_mbox = mon2scb_mbox;
        this.cov = cov;
    endfunction

    task run();
        forever begin
            transaction trans = new();
            @(posedge vif.clk);
            trans.a = vif.a;
            trans.b = vif.b;
            trans.sel = vif.sel;
            trans.alu_out = vif.alu_out;
            mon2scb_mbox.put(trans);
            cov.cg_alu.sample(); // Sample for coverage
            $display("[MON] Captured transaction");
        end
    endtask
endclass