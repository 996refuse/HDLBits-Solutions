module top_module (
    input clock,
    input a,
    output p,
    output q);

    reg s;
    always @(negedge clock) begin
        s <= a;
    end
    assign p = clock ? a : s;
    assign q = s;
endmodule
