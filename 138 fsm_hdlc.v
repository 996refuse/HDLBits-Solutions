module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);

    reg [9:0] state = 0;
    reg [9:0] next_state = 0;
    always @(*) begin
        if(reset)
            next_state <= 1;
        else
            if (in)
                next_state <= state[6:0] << 1 | state[7] << 7 | (state[9:8] ? 2 : 0);
        	else
                next_state <= (state[4:0] ? 1 : 0) | state[6:5] << 8 | (state[9:7] ? 1 : 0);
    end
    
    always @(posedge clk) begin
        state <= next_state;
    end
    
    assign disc = state == 1 << 8;
    assign flag = state == 1 << 9;
    assign err  = state == 1 << 7;
endmodule
