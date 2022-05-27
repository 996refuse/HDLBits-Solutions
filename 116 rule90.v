module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 

    reg [512:-1] q_next;
    reg [511:0] q_next_next;
    
    integer i;
    always @(*) begin
        q_next = 514'b0;
        q_next[511:0] = q;
        for(i = 0; i < 512; ++ i) begin
            case({q_next[i-1], q_next[i], q_next[i+1]})
                3'b111: q_next_next[i] = 1'b0;
                3'b110: q_next_next[i] = 1'b1;
                3'b101: q_next_next[i] = 1'b0;
                3'b100: q_next_next[i] = 1'b1;
                3'b011: q_next_next[i] = 1'b1;
                3'b010: q_next_next[i] = 1'b0;
                3'b001: q_next_next[i] = 1'b1;
                3'b000: q_next_next[i] = 1'b0;
            endcase
        end
    end
    
    always @(posedge clk) begin
        if(load)
            q <= data;
        else
            q <= q_next_next;
    end
endmodule
