module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //

    // Use FSM from Fsm_serial
    reg [7:0] out;
    // New: Datapath to latch input bits.
    reg is_reset;
    reg [11:0] state;
    always @(posedge clk) begin
        is_reset <= reset;
        if (reset) begin
            ;
        end
        else if (is_reset & ~reset) begin
            if (in)
                state <= 1 << 10;
            else
                state <= 1 << 0;
        end
        else begin
            if (in)
                state <= state[8:0] << 1 | state[9] << 10 | state[10] << 10 | state[11] << 10;
            else
                state <= state[7:0] << 1 | state[8] << 11 | state[9] | state[10] | state[11] << 11;
        end
        
        if (state & 'b11111111)
            out <= (out >> 1) + (in << 7);
    end
    assign done = (state == 1 << 9);
	assign out_byte = done ? out : 0;
endmodule
