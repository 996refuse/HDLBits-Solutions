module top_module (
    input [2:0] a,
    output [15:0] q ); 

    always @(*) begin
        case(a)
        3'b000: q = 'h1232;
        3'b001: q = 'haee0;
        3'b010: q = 'h27d4;
        3'b011: q = 'h5a0e;
        3'b100: q = 'h2066;
        3'b101: q = 'h64ce;
        3'b110: q = 'hc526;
        3'b111: q = 'h2f19;
    	endcase
    end
    
endmodule
