module top_module (
    input clk,
    input d, 
    input ar,   // asynchronous reset
    output q);

    always @(posedge ar or posedge clk) begin
        if(ar)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule
