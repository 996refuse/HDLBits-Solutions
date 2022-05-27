module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);

    assign Y1 = (w == 1) && (y & 'b1);
    assign Y3 = (w == 0) && (y & 'b110110);
endmodule
