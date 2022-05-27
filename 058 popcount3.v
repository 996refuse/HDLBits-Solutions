module top_module( 
    input [2:0] in,
    output [1:0] out );

    assign out = 2'b00 + in[0] + in[1] + in[2];
endmodule
