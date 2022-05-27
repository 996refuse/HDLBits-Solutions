module top_module( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );

    wire [3:0] in;
    bcd_fadd obj[3:0] (a, b, in, {cout, in[3:1]}, sum);
    
    assign in[0] = cin;
endmodule
