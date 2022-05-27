module top_module (
    input clk,
    input reset,
    output [9:0] q);

    initial q = 10'd0;
    
    always @(posedge clk) begin
        if(reset) begin
            q <= 10'b0;
        end
        else begin
            if(q == 10'd999)
                q <= 10'b0;
            else
                q <= q + 10'b1;
        end
    end
endmodule
