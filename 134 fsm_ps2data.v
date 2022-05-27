module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg [23:0] out_bytes,
    output done); //

    reg [4:0] state, next_state;
    
    // State transition logic (combinational)
    assign next_state = reset ? 1 : (in[3] ? (state[2:0] << 1) | (state[4:3] > 0) << 1 : (state[2:1] << 2) | ({state[4:3], state[0]} > 0) << 4);
    
    // State flip-flops (sequential)
    always @(posedge clk) begin
        state <= next_state;
        out_bytes <= {out_bytes[15:0], in};
    end
 
    // Output logic
    assign done = (state == 'b1000);


endmodule
