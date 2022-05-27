module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
);
    reg [3:1] olds = 0;
    reg oldr = 0;
    always @(posedge clk) begin
        olds <= s;
        oldr <= reset;
            
        if (reset)
            {dfr, fr3, fr2, fr1} <= 'b1111;
        else begin
            if (olds > s || s == 0)
                dfr <= 1;
            else if (olds == s && ~oldr)
                dfr <= dfr;
            else
                dfr <= 0;
            case (s)
                3'b111: {fr3, fr2, fr1} <= 'b0;
                3'b011: {fr3, fr2, fr1} <= 'b1;
                3'b001: {fr3, fr2, fr1} <= 'b11;
                3'b000: {fr3, fr2, fr1} <= 'b111;
            endcase
        end
        
        
    end
endmodule
