// generator.sv
class generator;
    transaction trans;
    mailbox #(transaction) gen2drv_mbox;

    function new(mailbox #(transaction) gen2drv_mbox);
        this.gen2drv_mbox = gen2drv_mbox;
    endfunction

    task run(int count);
        for (int i = 0; i < count; i++) begin
            trans = new();
            if (!trans.randomize()) begin
                $fatal("Generator randomization failed!");
            end
            gen2drv_mbox.put(trans);
            $display("[GEN] Sent transaction %0d", i);
        end
    endtask
endclass