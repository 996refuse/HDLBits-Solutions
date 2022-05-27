module top_module (input a, input b, input c, output out);//

    wire o;
    andgate inst1 (o, a, b, c, 1, 1);
    assign out = ~o;

endmodule
