module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 

    reg [1:0] state, next_state;
    always @(*) begin
        if (state == 1 << 0) begin
            if (x) begin
                next_state <= 1 << 1;
                // z <= 1;
            end
            else begin
                next_state <= 1 << 0;
                // z <= 0;
            end
        end
        else begin
            if (x) begin
                next_state <= 1 << 1;
                // z <= 0;
            end
            else begin
                next_state <= 1 << 1;
                // z <= 1;
            end
        end
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= 1 << 0;
        end
        else begin
            state <= next_state;
        end
    end
    
    assign z = (state == 1) & (x == 1) | (state == 2) & (x == 0);
    
endmodule
