module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
   	wire carry, nouse;
    wire [31:0] bb;
    assign bb = sub ? (~b + 1) : b;	
    add16 obj0(a[15:0], bb[15:0], 0, sum[15:0], carry);
    add16 obj1(a[31:16], bb[31:16], carry, sum[31:16], nouse);
        
endmodule
