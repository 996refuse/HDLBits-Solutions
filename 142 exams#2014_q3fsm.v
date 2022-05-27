module top_module (
    input clk,
    input reset,   // Synchronous reset
    input s,
    input w,
    output z
);
    reg state;
    reg [2:0] bits;
    reg [2:0] counts;
    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
            counts <= 3'b111;
        end
        else begin
            if (~state)
                state <= s;
            else begin
                bits <= {bits[1:0], w};
                if (counts == 0)
                    counts <= 3'b110;
                else
                    counts <= {counts[1:0], 1'b0};
            end
        end
    end
    
    assign z = ((bits[0] + bits[1] + bits[2]) == 2) & (counts == 0);
endmodule
