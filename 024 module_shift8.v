module top_module ( 
    input clk, 
    input [7:0] d, 
    input [1:0] sel, 
    output [7:0] q 
);
    wire [7:0] x0, x1, x2, x3;
    assign x0 = d;
    my_dff8 obj0(clk, x0, x1);
    my_dff8 obj1(clk, x1, x2);
    my_dff8 obj2(clk, x2, x3);
    
    assign q = (sel[1] ? (sel[0] ? x3: x2) : (sel[0] ? x1: x0));

endmodule
