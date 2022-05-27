module top_module(
    input in,
    input [1:0] state,
    output reg [1:0] next_state,
    output out); //

    parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;

    // State transition logic: next_state = f(state, in)
    always @(*) begin
        if (in == 0) begin
            if (state == A)
                next_state <= A;
            else if (state == B)
                next_state <= C;
            else if (state == C)
                next_state <= A;
            else
                next_state <= C;
        end 
        else begin
            if (state == A)
                next_state <= B;
            else if (state == B)
                next_state <= B;
            else if (state == C)
                next_state <= D;
            else
                next_state <= B;
        end
    end
    
    // Output logic:  out = f(state) for a Moore state machine
    assign out = (state == D);

endmodule
