`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
	
    wire x1, x2, x3;
	assign x1 = a & b;
	assign x2 = c & d;
    assign x3 = x1 | x2;
	assign out = x3;
    assign out_n = ~out;

endmodule
