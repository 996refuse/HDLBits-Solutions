module top_module (
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
