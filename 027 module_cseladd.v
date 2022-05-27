module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);    
    wire carry, nouse;
    wire [15:0]sum_upper_0, sum_upper_1;
    add16 obj0(a[15:0], b[15:0], 0, sum[15:0], carry);
    add16 obj1_0(a[31:16], b[31:16], 0, sum_upper_0, nouse);
    add16 obj1_1(a[31:16], b[31:16], 1, sum_upper_1, nouse);

    assign sum[31:16] = carry ? sum_upper_1 : sum_upper_0;
endmodule
