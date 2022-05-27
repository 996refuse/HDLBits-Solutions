module top_module (
    input clk,
    input reset,      // Synchronous active-high reset
    output reg [3:0] q);

    initial q = 4'b0;
    
    always @(posedge clk) begin
    	q <= q + 1;
        if(reset)
            q <= 0;
    end
endmodule
