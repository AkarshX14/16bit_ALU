// driver.sv
class driver;
    virtual alu_if vif;
    mailbox #(transaction) gen2drv_mbox;

    function new(virtual alu_if vif, mailbox #(transaction) gen2drv_mbox);
        this.vif = vif;
        this.gen2drv_mbox = gen2drv_mbox;
    endfunction

    task run();
        forever begin
            transaction trans;
            gen2drv_mbox.get(trans);
            vif.a <= trans.a;
            vif.b <= trans.b;
            vif.sel <= trans.sel;
            #10; // Wait for one clock cycle
        end
    endtask
endclass