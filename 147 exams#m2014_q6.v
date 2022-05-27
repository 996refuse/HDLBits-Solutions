module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);

    reg [5:0] state, next_state;
    
    always @(*) begin
        if (w)
            next_state <= ((state[1] | state[2] | state[4] | state[5]) << 3) | (state[0] | state[3]);
        else
            next_state <= { state[3], (state[2] | state[4]), 1'b0, (state[1] | state[5]), state[0]} << 1;
    end
    
    always @(posedge clk) begin
        if (reset)
            state <= 1;
        else
            state <= next_state;
    end
    
    assign z = ('b110000 & state) > 0;
endmodule
