module top_module ( input clk, input d, output q );

    wire x1, x2;
    my_dff obj1(clk, d, x1);
    my_dff obj2(clk, x1, x2);
    my_dff obj3(clk, x2, q);
endmodule
