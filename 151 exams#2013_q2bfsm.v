module top_module (
    input clk,
    input resetn,    // active-low synchronous reset
    input x,
    input y,
    output reg f,
    output g
); 

    reg [7:0] state, next_state;
    always @(*) begin
        if (~resetn) begin
            next_state <= 0;
        end
        else if (state == 0) begin
            next_state <= 'b1111;
        end
        else if (state == 'b1111) begin
            next_state <= 1;
        end
        else if (state & 'b1111) begin
            if (x) begin
                next_state <= state[0] << 1 | state[1] << 1 | state[2] << 4 | state[3] << 1;
            end
            else begin
                next_state <= state[0] << 3 | state[1] << 2 | state[2] << 3 | state[3] << 3;
            end
        end
        else begin
            if (y) begin
                next_state <= state[4] << 5 | state[5] << 5 | state[6] << 5 | state[7] << 7;
            end
            else begin
                next_state <= state[4] << 6 | state[5] << 5 | state[6] << 7 | state[7] << 7;
            end
        end 
    end
    
    always @(posedge clk) begin
        state <= next_state;
        
    end
    
    assign f = (state == 'b1111);
    assign g = (state & 'b1110000) > 0;
endmodule
