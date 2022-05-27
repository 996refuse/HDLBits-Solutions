module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 

    reg is_reset;
    reg [11:0] state;
    always @(posedge clk) begin
        is_reset <= reset;
        if (reset) begin
            ;
        end
        else if (is_reset & ~reset) begin
            if (in)
                state <= 1 << 10;
            else
                state <= 1 << 0;
        end
        else begin
            if (in)
                state <= state[8:0] << 1 | state[9] << 10 | state[10] << 10 | state[11] << 10;
            else
                state <= state[7:0] << 1 | state[8] << 11 | state[9] | state[10] | state[11] << 11;
        end
    end
    assign done = (state == 1 << 9);
endmodule
