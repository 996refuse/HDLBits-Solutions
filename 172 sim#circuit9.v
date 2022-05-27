module top_module (
    input clk,
    input a,
    output [3:0] q );
    
    always @(posedge clk) begin
        if (a) q <= 4;
        else q <= (q + 1) % 7;
    end

endmodule
