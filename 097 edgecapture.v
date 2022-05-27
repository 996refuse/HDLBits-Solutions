module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0] in_reg;
    always @(posedge clk) begin
        in_reg <= in;
        if(reset)
            out = 32'b0;
        else
	        out <= out | (~in & in_reg);
    end
endmodule
