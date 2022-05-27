// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    // Fill in state name declarations

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            // Fill in reset logic
            present_state <= 1;
            out <= 1;
        end else begin
            case (present_state)
                // Fill in state transition logic
                1'b0: next_state = in ? 1'b0 : 1'b1;
                1'b1: next_state = in ? 1'b1 : 1'b0;
            endcase

            // State flip-flops
            present_state = next_state;   

            case (present_state)
                // Fill in output logic
                1'b0: out = 1'b0;
                1'b1: out = 1'b1;
            endcase
        end
    end

endmodule
