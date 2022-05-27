module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

    assign Y0 = (~y[1] & y[2] & ~y[0] & ~x) | (~y[2] & ~y[0] & x) | (~y[2] & y[0] & ~x);
    //assign Y0 = y[0];
    assign z  = (y == 'b011) | (y == 'b100);
endmodule
