module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 


    // parameter [nodig=0 , dig=1 : NOFALL=0, FALL=1: LEFT=0, RIGHT=1]
    reg [2:0] state = 3'b000, next_state;
    //assign [3:0] trans = [dig, ground, bump_left, bump_right];

    always @(*) begin
        // State transition logic
        next_state <= state;
        if (state[2:1] == 2'b00) begin
            if (~ground)        next_state[1] <= 1'b1;
            else if (dig)       next_state[2] <= 1'b1;
            else if ((~state[0] & bump_left) | (state[0] & bump_right)) next_state[0] <= ~state[0];
        end
        else if (state[2:1] == 2'b01) begin
            if (ground)         next_state[2:1] <= 2'b00;
        end
        else if (state[2:1] == 2'b10) begin
            if (~ground)        next_state[2:1] <= 2'b01;
        end
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if (areset)
            state <= 2'b000;
        else
	        state <= next_state;
    end

    // Output logic
    assign walk_left  = ~state[0] & ~state[1] & ~state[2];
    assign walk_right =  state[0] & ~state[1] & ~state[2];
    assign aaah       =  state[1];
    assign digging    =  state[2];
    
endmodule
