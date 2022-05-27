module top_module (
    input a,
    input b,
    input c,
    input d,
    output q );//

    reg x;
    always @(*) begin
        x = 0;
        x = a ? ~x : x;
        x = b ? ~x : x;
        x = c ? ~x : x;
        x = d ? ~x : x;
    end

    assign q = ~x; // Fix me

endmodule
