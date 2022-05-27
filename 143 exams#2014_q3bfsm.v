module top_module (
    input clk,
    input reset,   // Synchronous reset
    input x,
    output z
);

    reg [4:0] state;
    always @(posedge clk) begin
        if (reset)
            state <= 1;
        else begin
            if (x)
                state <= state[0] << 1 | state[1] << 4 | state[2] << 1 | state[3] << 2 | state[4] << 4;
            else
                state <= state[0] << 0 | state[1] << 1 | state[2] << 2 | state[3] << 1 | state[4] << 3;
        end
    end
    
    assign z = (state & 'b11000) > 0;
endmodule
