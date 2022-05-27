module top_module (
    input clk,
    input reset,
    output [3:0] q);

    initial q = 4'd1;
    always @(posedge clk) begin
        if(reset)
            q <= 1;
        else if(q == 4'd10)
            q <= 1;
        else
            q <= q + 1;
    end
endmodule
