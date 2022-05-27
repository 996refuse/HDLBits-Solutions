module top_module( 
    input [254:0] in,
    output [7:0] out );

    always @(*) begin
        out = 8'd0;
        for(int i = 0; i < $bits(in); ++i)
            if(in[i])
                out ++;
    end
endmodule
