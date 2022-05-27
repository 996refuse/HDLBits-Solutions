module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);

    assign Y2 = (y & 'b1) && (w == 0);
    assign Y4 = (y & 'b110110) && (w == 1);
endmodule
