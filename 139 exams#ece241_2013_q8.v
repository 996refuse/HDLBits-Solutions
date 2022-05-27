module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z ); 

    reg [2:0] state, next_state;
    
    always @(*) begin
        if (x)
            next_state <= state[0] << 1 | state[1] << 1 | state[2] << 1;
		else
            next_state <= state[0] << 0 | state[1] << 2 | state[2] << 0;
    end
        
    always @(posedge clk, negedge aresetn) begin
        if (~aresetn)
            state <= 1;
        else
            state <= next_state;
    end
    
    assign z = (state == (1 << 2)) && (x == 1);
endmodule
