module full_adder( 
    input a, b, cin,
    output cout, sum );

    assign sum = a^b^cin;
    assign cout = (a&b) | (a&cin) | (b&cin);
endmodule

module top_module( 
    input [2:0] a, b,
    input cin,
    output [2:0] cout,
    output [2:0] sum );

    full_adder fa[2:0](a, b, {cout[1:0] ,cin}, cout, sum);
endmodule
