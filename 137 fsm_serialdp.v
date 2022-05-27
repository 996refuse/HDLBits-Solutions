module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
);
    
    reg check_reset, odd, odd2 = 0;
    parity check(clk, check_reset, in, odd);
    
    reg [7:0] out;
    // New: Datapath to latch input bits.
    reg is_reset;
    reg [12:0] state;
    always @(posedge clk) begin
        is_reset <= reset;
        
        if ((state & ('b11 << 10)) && (in == 0)) begin
            check_reset <= 0;
            out <= 0;
            odd2 <= 0;
        end
        
        if (state & 'b1 << 8)
            check_reset <= 1;
        
        if (reset) begin
            odd2 <= 0;
            state <= 1 << 11;
        end
        else if (is_reset & ~reset) begin
            odd2 <= 0;
            if (in)
                state <= 1 << 11;
            else
                state <= 1 << 0;
        end
        else begin
            if (in)
                state <= (state[7:0] << 1) | ((in == odd2) ? (state[8] << 12): (state[8] << 9)) | (state[9] << 10) | (state[10] << 11)
                | (state[11] << 11)
                | (state[12] << 11);
            else
                state <= (state[7:0] << 1) | ((in == odd2) ? (state[8] << 12): (state[8] << 9)) | (state[9] << 12) | (state[10])
                | (state[11])
                | (state[12] << 12);
        end
        
        if (state &'b100000000)
            odd2 <= 0;
        if (state & 'b11111111) begin
            if (in) odd2 <= ~odd2;
            out <= (out >> 1) + (in << 7);
        end
    end
    assign done = (state == 1 << 10);
	assign out_byte = done ? out : 0;

endmodule
