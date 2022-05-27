module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    
    reg [1:0] count_count;
    reg [2:0] state;
    reg [3:0] pattern;
    reg [15:0] small_count;
    
    always @(posedge clk) begin
        if (reset | (state == 3 & ack)) begin
            state <= 0;
            pattern <= 0;
            count_count <= 0;
            small_count <= 999;
        end
        else if (state == 0) begin
            pattern <= {pattern[2:0], data};
            if ((pattern[2:0] == 'b110) & (data == 1))
                state <= 1;
        end
        else if (state == 1) begin
            count <= {count[2:0], data};
            count_count <= count_count + 1;
            if (count_count == 3) begin
                state <= 2;
            end
        end
        else if (state == 2) begin
            if (!count && !small_count)
                state <= 3;
            if (small_count) begin
                small_count <= small_count - 1;
            end
            else begin
                count <= count - 1;
                small_count <= 999;
            end
        end
    end
    
    assign counting = state == 2;
    assign done = state == 3;

endmodule
