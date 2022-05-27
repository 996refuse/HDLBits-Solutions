module top_module (
    input clk,
    input enable,
    input S,
    input A, B, C,
    output Z ); 

    wire [2:0] sel = {A, B, C};
    reg [7:0] Q = 8'b0;
    
    assign Z = Q[sel];
    
    always @(posedge clk) begin
        if(enable)
            Q <= {Q[6:0], S};
    end
endmodule
