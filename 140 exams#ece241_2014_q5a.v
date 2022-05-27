module top_module (
    input clk,
    input areset,
    input x,
    output reg z
); 

    reg [1:0] state, next_state;
    always @(*) begin
        if (state == 1 << 0) begin
            if (x)
                next_state <= 1 << 1;
        	else
                next_state <= 1 << 0;
        end
        else begin
            if (x)
                next_state <= 1 << 1;
        	else
                next_state <= 1 << 1;
        end
    end
    
    always @(posedge clk, posedge areset) begin
        if (areset) begin
            state <= 1 << 0;
            z <= 0;
        end
        else begin
            state <= next_state;
            if (state == 1 << 0) begin
                if (x)
                    z <= 1;
                else
                    z <= 0;
            end
            else begin
                if (x)
                    z <= 0;
                else
                    z <= 1;
            end
        end
    end
    
endmodule
