module top_module(
    input clk,
    input areset,    // Asynchronous reset to OFF
    input j,
    input k,
    output out); //  

    parameter OFF=0, ON=1; 
    reg state, next_state;

    always @(*) begin
        // State transition logic
        casex({state, j, k})
            3'b00?: next_state = 1'b0;
            3'b01?: next_state = 1'b1;
            3'b1?0: next_state = 1'b1;
            3'b1?1: next_state = 1'b0;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        // State flip-flops with asynchronous reset
        if(areset) begin
            state <= 1'b0;
        end
        else begin
        	state <= next_state;
        end
    end

    // Output logic
    // assign out = (state == ...);
    assign out = (state == 1'b1);
endmodule
