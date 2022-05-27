module count10 (
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

module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);
    
    assign ena[1] = (q[3:0] == 4'd9);
    assign ena[2] = (q[7:4] == 4'd9) & (q[3:0] == 4'd9);
    assign ena[3] = (q[11:8] == 4'd9) & (q[7:4] == 4'd9) & (q[3:0] == 4'd9);
    
    reg [3:1] z;
    reg r;
    always @(posedge clk) begin
        z <= ena;
        r <= reset;
    end
    
    count10 obj[3:0]( {z, clk} | {{3{r}}, 1'b0}, {4{reset}}, q);

endmodule
