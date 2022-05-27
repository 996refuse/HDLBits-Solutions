module top_module (
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);//
    wire carry_out, nouse;
    add16 obj0(a[15:0] , b[15:0] , 0, sum[15:0], carry_out);
    add16 obj1(a[31:16], b[31:16], carry_out, sum[31:16], nouse);
endmodule

module add1 ( input a, input b, input cin,   output sum, output cout );

// Full adder module here
	assign sum = a ^ b ^ cin;
    assign cout = a&b | a&cin | b&cin;
endmodule
