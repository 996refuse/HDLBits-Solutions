module top_module (
    input clk,
    input in, 
    output out);

  	reg q;
    wire d;
    
    assign out = q;
    assign d = q ^ in;
    
    always @(posedge clk) begin
    	q <= d;
    end
endmodule
