module top_module( 
    input [1023:0] in,
    input [7:0] sel,
    output [3:0] out );

    wire [9:0] sel4 = sel << 2;
    assign out = {in[sel4+3], in[sel4+2], in[sel4+1],in[sel4]};
endmodule
