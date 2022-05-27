module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    
    wire [100:0] carry;
    assign carry[0] = cin;
    
    bcd_fadd obj[99:0] (a, b, carry[99:0], carry[100:1], sum);
    assign cout = carry[100];
    
endmodule
