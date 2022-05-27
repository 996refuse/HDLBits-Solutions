module top_module (
    input clk,
    input w, R, E, L,
    output reg Q
);
    wire r0;
    always @(posedge clk) begin
        if(E) begin
            r0 = w;
            if(L)
                r0 = R;
            else
                r0 = r0;
        end
        else begin
            r0 = Q;
            if(L)
                r0 = R;
            else
                r0 = r0;
        end
        Q <= r0;
    end
endmodule
