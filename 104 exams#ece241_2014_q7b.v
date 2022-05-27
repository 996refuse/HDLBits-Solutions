module top_module (
    input clk,
    input reset,
    output OneHertz,
    output [2:0] c_enable
); //

    reg [3:0] q0, q1, q2;
    bcdcount counter0 (clk, reset, c_enable[0], q0);
    bcdcount counter1 (clk, reset, c_enable[1], q1);
    bcdcount counter2 (clk, reset, c_enable[2], q2);
    
    assign c_enable[0] = 1;
    assign c_enable[1] = (q0 == 4'd9);
    assign c_enable[2] = ((q0 == 4'd9) && (q1 == 4'd9));

    assign OneHertz = ((q0 == 4'd9) && (q1 == 4'd9) && (q2 == 4'd9));
endmodule
