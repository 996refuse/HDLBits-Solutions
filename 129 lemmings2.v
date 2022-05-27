module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 

    // parameter [NOFALL=0, FALL=1: LEFT=0, RIGHT=1]
    reg [1:0] state = 2'b00;
    reg [1:0] next_state = 2'b00;

    always @(*) begin
        // State transition logic
        next_state <= state;
        if (~ground)
            next_state[1] <= 1'b1;
        else
            next_state[1] <= 1'b0;
        
        if (state[1] | ~ground) begin
            next_state[0] <= state[0];
        end
        else begin
            if ( state[0] & bump_right) next_state[0] <= 1'b0;
            if (~state[0] & bump_left)  next_state[0] <= 1'b1;
        end
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset)
            state <= 2'b00;
        else
	        state <= next_state;
    end

    // Output logic
    assign walk_left  = ~state[0] & ~state[1];
    assign walk_right =  state[0] & ~state[1];
    assign aaah       =  state[1];
    
endmodule
