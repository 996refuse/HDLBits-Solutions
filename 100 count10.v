module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);

    always @(posedge clk) begin
        if(reset)
            q <= 0;
        else if(q == 4'd9)
            q <= 0;
        else
            q <= 1 + q;
    end
endmodule
