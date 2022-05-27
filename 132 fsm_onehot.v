module top_module(
    input in,
    input [9:0] state,
    output [9:0] next_state,
    output out1,
    output out2);
    
    always @(*) begin
        if (in)
            next_state <= (state[6:0] << 1) | state[7] << 7 | (state[9:8] ? 2 : 0);
        else
            next_state <= ({state[9:7], state[4:0]} ? 1 : 0) | state[6:5] << 8;
    end
    
    assign out1 = (state & 10'b1100000000) > 0;
    assign out2 = (state & 10'b1010000000) > 0;
endmodule
