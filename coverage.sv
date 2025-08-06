// coverage.sv
class coverage;
    virtual alu_if vif;

    covergroup cg_alu @(posedge vif.clk);
        option.per_instance = 1;
        // Coverpoint for all 16 operations [cite: 118]
        cp_sel: coverpoint vif.sel {
            bins op_add  = {4'b0000};
            bins op_sub  = {4'b0001};
            bins op_mul  = {4'b0010};
            bins op_div  = {4'b0011};
            bins op_and  = {4'b0100};
            bins op_or   = {4'b0101};
            bins op_nand = {4'b0110};
            bins op_nor  = {4'b0111};
            bins op_shl  = {4'b1000};
            bins op_shr  = {4'b1001};
            bins op_rotl = {4'b1010};
            bins op_rotr = {4'b1011};
            bins op_xor  = {4'b1100};
            bins op_xnor = {4'b1101};
            bins op_gt   = {4'b1110};
            bins op_eq   = {4'b1111};
        }
    endgroup

    function new(virtual alu_if vif);
        this.vif = vif;
        cg_alu = new();
    endfunction
endclass