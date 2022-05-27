module recognizer (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output start_shifting);
    
    reg [2:0] bitarray;
    
    always @(posedge clk) begin
        if (reset) begin
            bitarray <= 0;
            start_shifting <= 0;
        end
        else if (bitarray == 'b110 && data == 1)
            start_shifting <= 1;
        else
            bitarray <= {bitarray[1:0], data}; 	
    end
endmodule

module shifter (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    
    reg [1:0] counter;
    always @(posedge clk) begin
        if (reset) begin
            shift_ena <= 1;
            counter <= 0;
        end
        else begin
            counter <= counter + 2'b1;
            if (counter == 3)
                shift_ena <= 0;
        end
    end
endmodule

module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output reg done,
    input ack );

    wire start_shifting, shifter_ena, stage2;
    recognizer obj1(clk, reset | (stage2 & done & ack), data, start_shifting);
    shifter    obj2(clk, ~start_shifting, shifter_ena);
    assign shift_ena = shifter_ena & start_shifting;
    assign stage2    = ~shifter_ena & start_shifting;
    assign counting  = stage2 & ~done;
    
    always @(posedge clk) begin
        if (shift_ena | reset) begin
            done <= 0;
        end
        
        if (stage2) begin
            if (~done & done_counting)
                done <= 1;
            else if (done & ack)
                done <= 0;
        end
        //else begin
        //    done <= 0;
        //end
    end
endmodule
